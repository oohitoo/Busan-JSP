package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class LoginMgr {

	private DBConnectionMgr pool;
	private Connection conn = null;
	private PreparedStatement psmt;
	private ResultSet rs;
	String sql;
	
	public LoginMgr()
	{
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean TestDb() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from membertb";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
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
		public boolean insertMember(LoginBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "insert into membertb(id, pwd, name, phonenumber, cPostNumber, cAddress) values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getPwd());
				pstmt.setString(3, bean.getName());
				pstmt.setString(4, bean.getPhonenumber());
				pstmt.setString(5, bean.getcPostNumber());
				pstmt.setString(6, bean.getcAddress());
				
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
				sql = "select id from membertb where id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				flag = rs.next();
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

	//
	public LoginBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		LoginBean bean = new LoginBean();
		
		try {
			con = pool.getConnection();
			//
			sql = "select * from membertb where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setPhonenumber(rs.getString("phnoe"));				
				bean.setcPostNumber(rs.getString("zipcode"));
				bean.setcAddress(rs.getString("address"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//
	public String findloginId(LoginBean bean){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String id = null;
		ResultSet rs = null;
		/*System.out.println(bean.getName() + " : " + bean.getPhonenumber());*/
		try {
			con = pool.getConnection();
			sql = "select id from membertb where name=? and phonenumber=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getPhonenumber());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return id;
		
	}
	
	
	//
	public String findloginPwd(LoginBean bean)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String pwd = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select pwd from membertb where id=? name=?, phonenumber=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPhonenumber());
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				pwd = rs.getString("pwd");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return pwd;
		
	}
	
	//
		public boolean updateMember(LoginBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update membertb set pwd=?, name=?, phone=?, zipcode=?, address=? where id=?";
				pstmt = con.prepareStatement(sql);			
				pstmt.setString(1, bean.getPwd());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getPhonenumber());
				pstmt.setString(4, bean.getcPostNumber());
				pstmt.setString(5, bean.getcAddress());
							
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
