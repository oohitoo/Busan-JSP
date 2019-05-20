package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class ordersMgr {
	
	private DB.DBConnectionMgr pool;
	
	public ordersMgr() {
		pool = DB.DBConnectionMgr.getInstance();
	}
	
	//주문 List 가게 이름에 따라 불러오기(Main Page)
	public Vector<ordersBean> orderListMain(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;
		
		Vector<ordersBean> olist = new Vector<>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orders where rName=? AND (orderStatus=1 or orderStatus=2 or orderStatus=3 or orderStatus=5) order by oDate";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ShopName);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setoNum(rs.getString("oNum"));
				oBean.setCount(rs.getInt("count"));
				oBean.setId(rs.getString("id"));
				oBean.setcNick(rs.getString("cNick"));
				oBean.setcAddress(rs.getString("cAddress"));
				oBean.setrName(rs.getString("rName"));
				oBean.setcPhone(rs.getString("cPhone"));
				oBean.setMenu(rs.getString("menu"));
				oBean.setoDate(rs.getString("oDate"));
				oBean.setoRequest(rs.getString("oRequest"));
				oBean.setOrderType(rs.getString("orderType"));
				oBean.setOrderStatus(rs.getString("orderStatus"));
				olist.addElement(oBean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		return olist;
	}
	
	//주문 List 가게 이름에 따라 불러오기(shopPaidList Page)
		public Vector<ordersBean> orderPaidList(String ShopName){
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			String sql;
			
			Vector<ordersBean> olist = new Vector<>();
			
			try {
				conn = pool.getConnection();
				sql = "select * from orders where rName=? AND (orderStatus=1) order by oDate";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, ShopName);
				rs = psmt.executeQuery();
				while(rs.next()) {
					ordersBean oBean = new ordersBean();
					oBean.setoNum(rs.getString("oNum"));
					oBean.setCount(rs.getInt("count"));
					oBean.setId(rs.getString("id"));
					oBean.setcNick(rs.getString("cNick"));
					oBean.setcAddress(rs.getString("cAddress"));
					oBean.setrName(rs.getString("rName"));
					oBean.setcPhone(rs.getString("cPhone"));
					oBean.setMenu(rs.getString("menu"));
					oBean.setoDate(rs.getString("oDate"));
					oBean.setoRequest(rs.getString("oRequest"));
					oBean.setOrderType(rs.getString("orderType"));
					oBean.setOrderStatus(rs.getString("orderStatus"));
					olist.addElement(oBean);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			finally {
				pool.freeConnection(conn, psmt, rs);
			}
			return olist;
		}
		
		//주문 List 가게 이름에 따라 불러오기(shopDeliveredList Page)
				public Vector<ordersBean> orderDelieveredList(String ShopName){
					Connection conn = null;
					PreparedStatement psmt = null;
					ResultSet rs = null;
					String sql;
					
					Vector<ordersBean> olist = new Vector<>();
					
					try {
						conn = pool.getConnection();
						sql = "select * from orders where rName=? AND (orderStatus=4) order by oDate";
						psmt = conn.prepareStatement(sql);
						psmt.setString(1, ShopName);
						rs = psmt.executeQuery();
						while(rs.next()) {
							ordersBean oBean = new ordersBean();
							oBean.setoNum(rs.getString("oNum"));
							oBean.setCount(rs.getInt("count"));
							oBean.setId(rs.getString("id"));
							oBean.setcNick(rs.getString("cNick"));
							oBean.setcAddress(rs.getString("cAddress"));
							oBean.setrName(rs.getString("rName"));
							oBean.setcPhone(rs.getString("cPhone"));
							oBean.setMenu(rs.getString("menu"));
							oBean.setoDate(rs.getString("oDate"));
							oBean.setoRequest(rs.getString("oRequest"));
							oBean.setOrderType(rs.getString("orderType"));
							oBean.setOrderStatus(rs.getString("orderStatus"));
							olist.addElement(oBean);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					finally {
						pool.freeConnection(conn, psmt, rs);
					}
					return olist;
				}
				
				//주문 List 가게 이름에 따라 불러오기(shopReservationList Page)
				public Vector<ordersBean> orderReservationList(String ShopName){
					Connection conn = null;
					PreparedStatement psmt = null;
					ResultSet rs = null;
					String sql;
					
					Vector<ordersBean> olist = new Vector<>();
					
					try {
						conn = pool.getConnection();
						sql = "select * from orders where rName=? AND (orderStatus=5) order by oDate";
						psmt = conn.prepareStatement(sql);
						psmt.setString(1, ShopName);
						rs = psmt.executeQuery();
						while(rs.next()) {
							ordersBean oBean = new ordersBean();
							oBean.setoNum(rs.getString("oNum"));
							oBean.setCount(rs.getInt("count"));
							oBean.setId(rs.getString("id"));
							oBean.setcNick(rs.getString("cNick"));
							oBean.setcAddress(rs.getString("cAddress"));
							oBean.setrName(rs.getString("rName"));
							oBean.setcPhone(rs.getString("cPhone"));
							oBean.setMenu(rs.getString("menu"));
							oBean.setoDate(rs.getString("oDate"));
							oBean.setoRequest(rs.getString("oRequest"));
							oBean.setOrderType(rs.getString("orderType"));
							oBean.setOrderStatus(rs.getString("orderStatus"));
							olist.addElement(oBean);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					finally {
						pool.freeConnection(conn, psmt, rs);
					}
					return olist;
				}
				
				//주문 List 가게 이름에 따라 불러오기(shopServedList Page)
				public Vector<ordersBean> orderServedList(String ShopName){
					Connection conn = null;
					PreparedStatement psmt = null;
					ResultSet rs = null;
					String sql;
					
					Vector<ordersBean> olist = new Vector<>();
					
					try {
						conn = pool.getConnection();
						sql = "select * from orders where rName=? AND (orderStatus=6) order by oDate";
						psmt = conn.prepareStatement(sql);
						psmt.setString(1, ShopName);
						rs = psmt.executeQuery();
						while(rs.next()) {
							ordersBean oBean = new ordersBean();
							oBean.setoNum(rs.getString("oNum"));
							oBean.setCount(rs.getInt("count"));
							oBean.setId(rs.getString("id"));
							oBean.setcNick(rs.getString("cNick"));
							oBean.setcAddress(rs.getString("cAddress"));
							oBean.setrName(rs.getString("rName"));
							oBean.setcPhone(rs.getString("cPhone"));
							oBean.setMenu(rs.getString("menu"));
							oBean.setoDate(rs.getString("oDate"));
							oBean.setoRequest(rs.getString("oRequest"));
							oBean.setOrderType(rs.getString("orderType"));
							oBean.setOrderStatus(rs.getString("orderStatus"));
							olist.addElement(oBean);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					finally {
						pool.freeConnection(conn, psmt, rs);
					}
					return olist;
				}
	
	//주문 상태 update
	public void updateOrder(String orderStatus, String oNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con=pool.getConnection();
			sql="update orders SET orderStatus=? where oNum=?";
			pstmt=con.prepareStatement(sql);		
			pstmt.setString(1, orderStatus);
			pstmt.setString(2, oNum);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}return;
	}
}
