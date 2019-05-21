package menu;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class menuMgr {
	
	/* 이미지 저장 및 불러오기 위해서 떄문에 함.ㅜㅜ*/
	public static final String saveFolder = "F:/DTeam/BusanIT_JSP_Project/WebContent/img/storeImage/";
	final String encType = "EUC-KR";
	final int maxSize = 20 * 1024 * 1024; // 20M로 설정
	/* 이미지 저장 및 불러오기 위해서 함.ㅜㅜ*/
	
	private DB.DBConnectionMgr pool;
	
	public menuMgr() {
		pool = DB.DBConnectionMgr.getInstance();
	}
	
	//가게 이름을 가져와서 메뉴 테이블에서 메뉴 검색하기
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
				bean.setCategory(rs.getString("category"));
				bean.setMenu(rs.getString("menu"));
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
	
	//메뉴 추가
	public void insertMenu(menuBean mbean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert menu(rName, category, menu, mprice, minfo, mimg) VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mbean.getrName());
			pstmt.setString(2, mbean.getCategory());
			pstmt.setString(3, mbean.getMenu());
			pstmt.setInt(4, mbean.getmPrice());
			pstmt.setString(5, mbean.getmInfo());
			pstmt.setString(6, mbean.getmImg());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	//가게별 이미지 저장하는곳
		public boolean ShopimageUpdateFile(HttpServletRequest req) {
			Connection conn = null;
			PreparedStatement psmt = null;
			boolean flag = false;
			String sql;
			
			try {
				MultipartRequest mult = new MultipartRequest(req, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
				String upFile = mult.getFilesystemName("upFile");
				// 앞에서 넘오는 name 설정 값
				File f = mult.getFile("upFile");
				int size = (int)f.length();
				
				conn = pool.getConnection();
				sql = "update menu_list set restImg = ?, restImgsize = ? where bsnsCond = ?";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, upFile); //파일 설정 하기
				psmt.setInt(2, size);
				psmt.setString(3, bsnsCond);
				System.out.println(upFile + "/" + size + "/" + bsnsCond + "/");
				System.out.println(psmt.executeUpdate());
				
				if(psmt.executeUpdate() == 9) { // 반환될 값임
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
		
	//메뉴 삭제
	public void deleteMenu(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "DELETE FROM menu WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
}
