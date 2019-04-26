package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class loginMgr {

	private DBConnectionMgr pool;
	private Connection conn = null;
	private PreparedStatement psmt;
	private ResultSet rs;
	String sql;
	
	public loginMgr()
	{
		pool = DBConnectionMgr.getInstance();
	}
	
	
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
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			//
			sql = "select id from ���̺��̸� where id =? and pwd =?";
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

	//
	public loginBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		loginBean bean = new loginBean();
		
		try {
			con = pool.getConnection();
			//
			sql = "select * from ���̺��̸� where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setPhone(rs.getString("phnoe"));				
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	
	
	//
	public void FinloginId(loginBean bean)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			//���̺� �̸� ����
			sql = "select id from ���̺��̸�  where name=?, phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getPhone());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
		
	}
	
	
	//
	public void FinloginPwd(loginBean bean)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			//
			sql = "select pwd from ���̺��̸�  where id=? name=?, phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPhone());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
		
	}
	
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
	
	
}
