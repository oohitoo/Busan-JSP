package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;








public class loginMgr {

	private DBConnectionMgr pool;
	
	public loginMgr()
	{
		pool = DBConnectionMgr.getInstance();
	}
	
	//회원가입
		public boolean insertMember(loginBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				//테이블 이름 미정
				sql = "insert 테이블이름(id, pwd, name, phone, zipcode, address) values(?,?,?,?,?,?)";
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
	
	
	//ID 중복확인
		public boolean checkId(String id) 
		{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				//테이블 이름 미정
				sql = "select id from 테이블이름 where id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				flag = rs.next();//true이면 중복, false이면 중복 아님...
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;	
		}
		
	//우편번호 검색
		public Vector<ZipcodeBean> zipcodeRead(String area3)
		{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
			try {
				con = pool.getConnection();
				sql = "select * from tblZipcode where area3 like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + area3 + "%"); //'%강남대로%'
				rs = pstmt.executeQuery();
				while(rs.next()) 
				{
					ZipcodeBean bean = new ZipcodeBean();
					bean.setZipcode(rs.getString(1));
					bean.setArea1(rs.getString(2));
					bean.setArea2(rs.getString(3));
					bean.setArea3(rs.getString(4));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
	//로그인
	public boolean loginCustomer(String id, String pwd) 
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			//테이블이름 미정
			sql = "select id from 테이블이름 where id =? and pwd =?";
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

	//회원정보 가져오기
	public loginBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		loginBean bean = new loginBean();
		
		try {
			con = pool.getConnection();
			//테이블이름 미정
			sql = "select * from 테이블이름 where id=?";
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
	
	
	
	//아이디 찾기
	public void FinloginId(loginBean bean)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			//테이블 이름 미정
			sql = "select id from 테이블이름  where name=?, phone=?";
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
	
	
	//비밀번호 찾기
	public void FinloginPwd(loginBean bean)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			//테이블 이름 미정
			sql = "select pwd from 테이블이름  where id=? name=?, phone=?";
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
	
	//회원정보 수정
		public boolean updateMember(loginBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				//테이블이름 미정
				sql = "update 테이블이름 set pwd=?, name=?, phone=?, zipcode=?, address=? where id=?";
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
