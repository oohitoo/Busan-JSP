package review;

import java.sql.*;
import java.util.Vector;

	public class reviewMgr{
		private DBConnectionMgr pool;
		
		public reviewMgr() {
			pool=DBConnectionMgr.getInstance();
			
		}
		public void insertreview(reviewBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert review_table(rId,rContent,rRegdate,rStar) values(?,?,now(),?) ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getrId());
				pstmt.setString(2, bean.getrContent());
				pstmt.setInt(3, bean.getrStar());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;
		}
		public Vector<reviewBean> reviewList() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<reviewBean> vlist = new Vector<>();
			try {
				con = pool.getConnection();
				sql = "select * from review_table order by rnum desc";
				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();
				while(rs.next()) {
					reviewBean bean = new reviewBean();
					bean.setrNum(rs.getInt("rNum"));
					bean.setrId(rs.getString("rId"));
					bean.setrContent(rs.getString("rContent"));
					bean.setrRegdate(rs.getString("rRegdate"));
					bean.setrStar(rs.getInt("rStar"));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
			
		}
		public void reviewDelete(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "delete from review_table where rnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return;
			
		}
		public reviewBean reviewRead(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			reviewBean bean = new reviewBean();
			try {
				con = pool.getConnection();
				sql = "select * from review_table where rNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bean.setrNum(rs.getInt("rNum"));
					bean.setrId(rs.getString("rId"));
					bean.setrContent(rs.getString("rContent"));
					bean.setrRegdate(rs.getString("rRegdate"));
					bean.setrStar(rs.getInt("rStar"));
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
			
		}
		public String reviewcontent(String content) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "select 8 fron review_table where rContent=?;";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return content;
			
		}
		//∆‰¿Ã¬°
		public int getCount(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int count=0;
			try {
				con = pool.getConnection();
				sql = "select count(rNum) from review_table where rNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next())
					count = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return count;
			
		}
		
	}
	
	
	

