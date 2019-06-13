package review;

import java.sql.*;
import java.util.Vector;

import org.apache.jasper.tagplugins.jstl.core.Out;

import login.LoginBean;

	public class reviewMgr{
		private DBConnectionMgr pool;
		
		public reviewMgr() {
			pool=DBConnectionMgr.getInstance();
			
		}
		
		public String getcNick(String rid) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			String name = null;
			try {
				con = pool.getConnection();
				sql = "SELECT cnick FROM customer WHERE id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					name = rs.getString("cnick");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return name;
		}
		public void insertreview(reviewBean bean, String myNick) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert review_table(rId,rContent,rRegdate,rStar,shopName,rNick,oDate) values(?,?,now(),?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getrId());
				pstmt.setString(2, bean.getrContent());
				pstmt.setInt(3, bean.getrStar());
				pstmt.setString(4, bean.getShopName());
				pstmt.setString(5, myNick);
				pstmt.setString(6, bean.getoDate());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;
		}
		public Vector<reviewBean> reviewList(String shopName) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<reviewBean> vlist = new Vector<>();
			try {
				con = pool.getConnection();
				sql = "select * from review_table where shopName= ?  order by odate desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, shopName); 
				rs = pstmt.executeQuery();
				while(rs.next()) {
					reviewBean bean = new reviewBean();
					bean.setrNum(rs.getInt("rNum"));
					bean.setrId(rs.getString("rId"));
					bean.setrContent(rs.getString("rContent"));
					bean.setrRegdate(rs.getString("rRegdate"));
					bean.setrNick(rs.getString("rNick"));
					bean.setrStar(rs.getInt("rStar"));
					bean.setoDate(rs.getString("oDate"));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
			
		}
		public Vector<reviewBean> reviewAll(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<reviewBean> vlist = new Vector<>();
			try {
				con = pool.getConnection();
				sql = "SELECT re.*, onum from review_table re, orders o where o.odate = re.odate and re.rId = o.id and id = ? group by onum order by rRegdate desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id); 
				rs = pstmt.executeQuery();
				while(rs.next()) {
					reviewBean bean = new reviewBean();
					bean.setrNum(rs.getInt("rNum"));
					bean.setrId(rs.getString("rId"));
					bean.setrContent(rs.getString("rContent"));
					bean.setrRegdate(rs.getString("rRegdate"));
					bean.setrNick(rs.getString("rNick"));
					bean.setrStar(rs.getInt("rStar"));
					bean.setShopName(rs.getString("shopName"));
					bean.setoDate(rs.getString("odate"));
					bean.setoNum(rs.getString("onum"));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
			
		}
		public Vector<reviewBean> reviewShop(String businessName) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<reviewBean> vlist = new Vector<>();
			try {
				con = pool.getConnection();
				sql = "select * from review_table where shopname =? and rstar not in (0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, businessName); 
				rs = pstmt.executeQuery();
				while(rs.next()) {
					reviewBean bean = new reviewBean();
					bean.setrNum(rs.getInt("rNum"));
					bean.setrId(rs.getString("rId"));
					bean.setrContent(rs.getString("rContent"));
					bean.setrRegdate(rs.getString("rRegdate"));
					bean.setrNick(rs.getString("rNick"));
					bean.setrStar(rs.getInt("rStar"));
					bean.setShopName(rs.getString("shopName"));
					bean.setoDate(rs.getString("odate"));
					
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
			
		}
		
		public String shopComment(String odate, String shopname) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			String comment = null;
			try {
				con = pool.getConnection();
				sql = "select rContent from review_table where odate=? and shopname=? and rstar = 0";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, odate);
				pstmt.setString(2, shopname);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					comment = rs.getString(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return comment;
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
				sql = "select * fron review_table where rContent=?;";
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
		//페이징
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
		

		//리뷰썻는지 확인하기
		public reviewBean checkReview(String id,String odate) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			reviewBean bean = new reviewBean();
			try {
				con = pool.getConnection();
				sql = "select r.rNum,r.rId,rContent, r.rRegdate,r.rnick, r.rstar,r.odate from orders o , review_table r where o.odate = r.odate and o.id = r.rid and r.odate = ? and r.rid = ? ;";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, odate);
				pstmt.setString(2, id);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					bean.setrNum(rs.getInt("rNum"));
					bean.setrId(rs.getString("rId"));
					bean.setrContent(rs.getString("rContent"));
					bean.setrRegdate(rs.getString("rRegdate"));
					bean.setrNick(rs.getString("rNick"));
					bean.setrStar(rs.getInt("rStar"));
					bean.setoDate(rs.getString("oDate"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		
		//리뷰 내용 수정
		public boolean reviewUpdate(int rnum,String content) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update review_table set rContent = ? where rnum = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.setInt(2, rnum);
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
	
	
	

