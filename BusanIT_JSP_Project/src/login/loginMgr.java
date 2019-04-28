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
<<<<<<< HEAD

	//insert Member_tb
	public boolean insertMember(loginBean bean) {
=======
	
	
	public boolean dbcomment() {
		boolean flag = false;
		
		try {
			conn = pool.getConnection();
			sql = "SELECT count(*) FROM address";
			psmt = conn.prepareStatement(sql);			
			rs = psmt.executeQuery();			
			flag = rs.next();			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		return flag;
	}
	
	//insert Member_tb
		public boolean insertMember(loginBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "insert into Member_tb(id, pwd, name, phone, zipcode, address) values(?,?,?,?,?,?)";
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
		public boolean checkId(String id) 
		{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				//
				sql = "select id from ���̺��̸� where id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				flag = rs.next();//true�̸� �ߺ�, false�̸� �ߺ� �ƴ�...
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;	
		}
		
		
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
					bean.setPostnum(rs.getString(1));
					bean.setCity(rs.getString(2));
					bean.setGu(rs.getString(3));
					bean.setStreet(rs.getString(4));
					bean.setStreetNum(rs.getString(5));
					
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
	public boolean loginCustomer(String id, String pwd) 
	{
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
<<<<<<< HEAD
			sql = "";
=======
			//
			sql = "select id from ���̺��̸� where id =? and pwd =?";
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
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

<<<<<<< HEAD

	//
	public boolean checkId(String id) {
=======
	//
	public loginBean getMember(String id) {
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
<<<<<<< HEAD
			sql = "select id from membertb where id =?";
=======
			//
			sql = "select * from ���̺��̸� where id=?";
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
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
<<<<<<< HEAD

	//우편번호 검색
	public Vector<ZipcodeBean> zipcodeRead(String street){
=======
	
	
	
	//
	public void FinloginId(loginBean bean)
	{
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
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
<<<<<<< HEAD

	//
	public boolean loginCustomer(String id, String pwd) {
=======
	
	
	//
	public void FinloginPwd(loginBean bean)
	{
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
<<<<<<< HEAD
			sql = "select id from membertb where id =? and pwd =?";
=======
			//
			sql = "select pwd from ���̺��̸�  where id=? name=?, phone=?";
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
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
<<<<<<< HEAD

=======
	
	//
		public boolean updateMember(loginBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				//���̺��̸� ����
				sql = "update ���̺��̸� set pwd=?, name=?, phone=?, zipcode=?, address=? where id=?";
				pstmt = con.prepareStatement(sql);			
				pstmt.setString(1, bean.getPwd());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getPhone());
				pstmt.setString(4, bean.getZipcode());
				pstmt.setString(5, bean.getAddress());
							
				if(pstmt.executeUpdate()==1)
					flag = true;			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
			
			
		}
	
	
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
}
