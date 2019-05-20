package rowspan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class RowspanMgr {
	
	private DBConnectionMgr pool;
	
	public RowspanMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<RowspanBean> getRowspanList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RowspanBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from tblRowspan";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RowspanBean bean = new RowspanBean();
				bean.setNum(rs.getInt(1));
				bean.setMenuNum(rs.getInt(2));
				bean.setDelState(rs.getInt(3));
				bean.setMenu(rs.getString(4));
				bean.setCnt(rs.getInt(5));
				bean.setNote(rs.getString(6));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public int getNumCnt(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int rcnt = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from tblRowspan where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
				rcnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return rcnt;
	}
	
	public Vector<MenuNumSumBean> getMenuNumSum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MenuNumSumBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select num , count(menuNum) from tblRowspan group by num";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuNumSumBean bean = new MenuNumSumBean();
				bean.setNum(rs.getInt(1));
				bean.setMenuNumSum(rs.getInt(2));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

}








