package MenuList;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class menuMgr {
	
	/* �̹��� ������ �ϱ� ���� ���� */
	/* ���� ��� ���� */
	public static final String saveFolder = "F:/DTeam/BusanIT_JSP_Project/WebContent/img/storeImage";
	final String encType = "EUC-KR";
	final int maxSize = 20 * 1024 * 1024; // 20m
	/* �̹��� ������ �ϱ� ���� �� ���� */
	
	private DB.DBConnectionMgr pool;
	
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
			
			//���� �ؾ� �ɰ�!! �� ������.. �Ф�
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
				bean.setRestImg(rs.getString("restImg"));
				
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
	
	//���Ժ� �̹��� �����ϴ°�
	public boolean ShopimageUpdateFile(HttpServletRequest req, String bsnsCond) {
		Connection conn = null;
		PreparedStatement psmt = null;
		boolean flag = false;
		String sql;
		
		try {
			MultipartRequest mult = new MultipartRequest(req, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
			String upFile = mult.getFilesystemName("upFile");
			// �տ��� �ѿ��� name ���� ��
			File f = mult.getFile("upFile");
			int size = (int)f.length();
			
			conn = pool.getConnection();
			sql = "update menu_list set restImg = ?, restImgsize = ? where bsnsCond = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, upFile); //���� ���� �ϱ�
			psmt.setInt(2, size);
			psmt.setString(3, bsnsCond);
			System.out.println(upFile + "/" + size + "/" + bsnsCond + "/");
			System.out.println(psmt.executeUpdate());
			
			if(psmt.executeUpdate() == 9) { // ��ȯ�� ����
				flag = true;
			}			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt);
		}		
		return flag;
	}
}
