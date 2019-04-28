package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class loginMgr {

	DBConnectionMgr pool;
	
	public loginMgr(){
		pool = DBConnectionMgr.getInstance();
	}

	//insert Member_tb
	public boolean insertMember(loginBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getZipcode());
			pstmt.setString(6, bean.getAddress());

			if(pstmt.executeUpdate()==1)
				flag = true;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}


	//
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from membertb where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;	
	}

	//우편번호 검색
	public Vector<ZipcodeBean> zipcodeRead(String street){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();

		try {
			con = pool.getConnection();
			sql = "SELECT * FROM address WHERE street LIKE ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, "%" + street + "%");

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ZipcodeBean bean = new ZipcodeBean();
				bean.setIdx(rs.getInt(1));
				bean.setPostnum(rs.getString(2));
				bean.setCity(rs.getString(3));
				bean.setGu(rs.getString(4));
				bean.setStreet(rs.getString(5));
				bean.setStreetNum(rs.getString(6));					
				vlist.addElement(bean);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	//
	public boolean loginCustomer(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from membertb where id =? and pwd =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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

}
