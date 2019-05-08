package shoplogin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import login.DBConnectionMgr;
import shoplogin.loginBean;

public class loginMgr {
	private String businessid;
	private String pwd;
	private String name;
	private String phone;
	private String zipcode;
	private String address;
	DBConnectionMgr pool;
	
	public loginMgr(){
		pool = DBConnectionMgr.getInstance();
	}
	//Shop Log In
	public boolean loginShop(String businessid, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			//
			sql = "select businessid from shop where businessid = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, businessid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//Shop Info
	public Vector<loginBean> shopInfo(String businessid){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<loginBean> shopInfo = new Vector<loginBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM shop WHERE businessid =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, businessid);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				loginBean bean = new loginBean();
				bean.setBusinessid(rs.getString(1));
				bean.setPwd(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setPhone(rs.getString(4));
				bean.setAddress(rs.getString(5));
				bean.setCategory(rs.getString(6));
				shopInfo.addElement(bean);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return shopInfo;
	}
	
	//shop Info Update
	public boolean updateShopInfo(String pwd, String businessId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update shop set pwd =? where businessid =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, businessId);
			pstmt.executeUpdate();

			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
