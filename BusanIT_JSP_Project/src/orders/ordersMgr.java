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
	
	//주문 List 가게 이름에 따라 불러오기
	public Vector<ordersBean> orderList(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;
		
		Vector<ordersBean> olist = new Vector<>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orders where rName=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ShopName);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setoNum(rs.getInt("oNum"));
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
				oBean.setPayType(rs.getString("payType"));
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
}
