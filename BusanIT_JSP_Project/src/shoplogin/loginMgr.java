package shoplogin;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import login.DBConnectionMgr;
import shoplogin.loginBean;

public class loginMgr {
	private String businessid;
	private String pwd;
	private String pwd2;
	private String scategories;
	private String name;
	private String phone;
	private String zipcode;
	private String address;
	DBConnectionMgr pool;
	
	public static final String SAVEFOLDER = "F:/DTeam/BusanIT_JSP_Project/WebContent/img/storeImage/";
	public final String ENCTYPE = "EUC-KR";
	public final int MAXSIZE = 20 * 1024 * 1024; 
	
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
		loginBean bean = new loginBean();
		try {
			con = pool.getConnection();
			sql = "select businessId from menu_list where businessId = ? and pwd = ?";
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
	public loginBean shopInfo(String businessid){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		loginBean bean = new loginBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM menu_list WHERE businessid =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, businessid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean.setBusinessid(rs.getString("businessid"));
				bean.setPwd(rs.getString("pwd"));
				bean.setBsnsSector(rs.getString("bsnsSector"));
				bean.setBsnsCond(rs.getString("bsnsCond"));
				bean.setBsnsNm(rs.getString("bsnsNm"));
				bean.setAddrRoad(rs.getString("addrRoad"));
				bean.setAddrRoad1(rs.getString("addrRoad1"));
				bean.setMenu(rs.getString("menu"));
				bean.setTel(rs.getString("tel"));
				bean.setGugun(rs.getString("gugun"));
				bean.setLat(rs.getFloat("lat"));
				bean.setLng(rs.getFloat("lng"));
				bean.setRestImg(rs.getString("restImg"));
				bean.setRestImgsize(rs.getInt("restImgsize"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//shop Info Update
	public boolean updateShopInfo(String pwd, String scategories, String businessId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update restaurantlist set pwd =?, scategory=? where businessid =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, scategories);
			pstmt.setString(3, businessId);
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
	
	public boolean ShopimageUpdateFile(HttpServletRequest req) {
		Connection conn = null;
		PreparedStatement psmt = null;
		boolean flag = false;
		String sql;
		
		try {
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			
			String upFile = multi.getFilesystemName("pic");
			pwd = multi.getParameter("pwd"); 
			scategories = multi.getParameter("scategories"); 
			businessid = multi.getParameter("businessId");
			File f = multi.getFile("pic");
			int size = (int)f.length();
			conn = pool.getConnection();
			sql = "update menu_list set restImg = ?, restImgsize = ?, pwd = ?, bsnsCond = ? where businessid = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, upFile); 
			psmt.setInt(2, size);
			psmt.setString(3, pwd);
			psmt.setString(4, scategories);
			psmt.setString(5, businessid);
			psmt.executeUpdate();
			
			System.out.println(psmt.executeUpdate());
			if(psmt.executeUpdate() == 1) { 
				flag = true;
			}			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt);
		}		
		return flag;
	}
	
	//order count
	public int getNumCnt(String oNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int rcnt = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from orders where oNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, oNum);
			rs = pstmt.executeQuery();
			if(rs.next())
				rcnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return rcnt;
	}
}
