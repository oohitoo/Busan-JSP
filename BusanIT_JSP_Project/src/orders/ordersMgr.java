package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import menu.ordersBean;

public class ordersMgr {
	
	private DB.DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE = new SimpleDateFormat("yyyymmdd");
	
	public ordersMgr() {
		pool = DB.DBConnectionMgr.getInstance();
	}
	
	//주문내역 저장
	public void insertOrder(ordersBean order) {	
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into orders ";
			pstmt = con.prepareStatement(sql);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
