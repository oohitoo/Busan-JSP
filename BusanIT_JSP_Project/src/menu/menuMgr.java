package menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class menuMgr {
	
	// �̹������� �� �ҷ����� ���ؼ� ����� ����
	public static final String saveFolder = "F:/DTeam/BusanIT_JSP_Project/WebContent/img/storeImage/";
	final String encType = "EUC-KR";
	final int maxSize = 20 * 1024 * 1024; // 20M�� ����
	/* �̹��� ���� �� �ҷ����� ���ؼ� ��.�̤�*/
	
	private DB.DBConnectionMgr pool;
	
	public menuMgr() {
		pool = DB.DBConnectionMgr.getInstance();
	}
	
	//���� �̸��� �����ͼ� �޴� ���̺��� �޴� �˻��ϱ�
	public Vector<menuBean> menuSelect(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;
		
		Vector<menuBean> vlist = new Vector<>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from menu where rName = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ShopName);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				menuBean bean = new menuBean();
				bean.setIdx(rs.getInt("idx"));
				bean.setrName(rs.getString("rName"));
				bean.setmName(rs.getString("Menu"));
				bean.setmPrice(rs.getInt("mPrice"));
				bean.setmInfo(rs.getString("mInfo"));
				bean.setmImg(rs.getString("mImg"));
				bean.setmImgsize(rs.getString("mImgsize"));
				
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
	
	// �޴� ����� �������� ��
	public Vector<menuBean> getMenu(String shop, String Catagore) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;
		
		Vector<menuBean> mlist = new Vector<>();		
		
		try {
			conn = pool.getConnection();
			sql = "select * from menu where rName = ? and Category = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, shop);
			psmt.setString(2, Catagore);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				menuBean mBean = new menuBean();
				mBean.setIdx(rs.getInt(1));
				mBean.setrName(rs.getString(2));
				mBean.setCatagore(rs.getString(3));
				mBean.setmName(rs.getString(4));
				mBean.setmPrice(rs.getInt(5));		
				mBean.setmInfo(rs.getString(6));
				mBean.setmImg(rs.getString(7));
				mBean.setmImgsize(rs.getString(8));
				
				mlist.addElement(mBean);
			}			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		
		return mlist;
	}
	
	public menuBean getmenuBean(String shopName, String menu) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		menuBean bean = new menuBean();
		
		try {
			con = pool.getConnection();
			sql = "select * from menu where rName = ? and Menu = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopName);
			pstmt.setString(2, menu);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setIdx(rs.getInt("idx"));
				bean.setrName(rs.getString("rName"));
				bean.setCatagore(rs.getString("Category"));
				bean.setmName(rs.getString("Menu"));
				bean.setmPrice(rs.getInt("mPrice"));
				bean.setmInfo(rs.getString("mInfo"));
				bean.setmImg(rs.getString("mImg"));
				bean.setmImgsize(rs.getString("mImgsize"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
}