package MenuList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class menuMgr {
	
	DB.DBConnectionMgr pool;
	
	public menuMgr() {
		pool = DB.DBConnectionMgr.getInstance();
	}
	
	public Vector<menu_listBean> menuSelect(String menu){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;
		
		Vector<menu_listBean> vlist = new Vector<menu_listBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from menu_list where bsnsCond = ?";
			psmt = conn.prepareStatement(sql);
			
			//세팅 해야 될것!! 왜 안햇지.. ㅠㅠ
			psmt.setString(1, menu);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				menu_listBean bean = new menu_listBean();
				bean.setIdx(rs.getInt("Idx"));
				bean.setStoreCond(rs.getString("bsnsCond"));				
				bean.setStorename(rs.getString("bsnsNm"));
				bean.setStoreaddr1(rs.getString("addrRoad"));
				bean.setStoreaddr2(rs.getString("addrRoad1"));
				bean.setBestmenu(rs.getString("menu"));
				bean.setTel(rs.getString("tel"));
				bean.setLat(rs.getFloat("lat"));
				bean.setLng(rs.getFloat("lng"));
				
				vlist.addElement(bean);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		
		return vlist;
	}
}
