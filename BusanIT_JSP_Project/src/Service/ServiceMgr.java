package Service;

import java.sql.Connection;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Service.ServiceBean;

public class ServiceMgr {
	private DBConnectionMgr pool;
		public static final 	String 						SAVEFOLDER 	= "C://Jsp//myapp//WebContent//board//fileupload/";
		public static final 	String 						ENCTYPE 		= "EUC-KR";
		public static int 				   						MAXSIZE 			= 10 * 1024 * 1024;
		
		public ServiceMgr() {
			pool = DBConnectionMgr.getInstance();
			
		}
		
		//Service Insert : 
		public void insertService(HttpServletRequest req) {
			Connection 					con 		= null;
			PreparedStatement 	pstmt 	= null;
			ResultSet 					rs 		= null;
			String 							sql 		= null;
			try {
					////////파일업로드/////////
					File dir = new File(SAVEFOLDER);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					MultipartRequest multi 		 	=
							new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
					String 					filename  	= null;
					int						filesize 	 	= 0;
					if(multi.getFilesystemName("filename")!=null) {
						filename 	= multi.getFilesystemName("filename");
						filesize 	= (int)multi.getFile("").length(); 
					}
					/////////////////////////////////
					//게시물 내용(content Type : TEXT, HTML)
					String content = multi.getParameter("content");
						content = UtilMgr.replace(content,"<","&lt;");
					
					////////////////////////////////
					con 		= pool.getConnection();
					sql 		= "SELECT max(snum) FROM Service";
					pstmt 	= con.prepareStatement(sql);
					rs 		= pstmt.executeQuery();
					int ref 	= 1;
					if(rs.next())
						ref = rs.getInt(1) + 1; //현재 저장된 num값을 1씩 증가시켜 ref 값으로 리턴.
					/////////////////////////////////
					sql = "insert Service(sid,content,subject,ref,pos,depth,regdate,pass,count,ip)";
					sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("id"));
					pstmt.setString(2, content);
					pstmt.setString(3, multi.getParameter("subject"));
					pstmt.setInt	  (4, ref);
					pstmt.setString(5, multi.getParameter("pass"));
					pstmt.setString(6, multi.getParameter("ip"));
					pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return;
		}
		
	//Service Total Count(총 게시물 개수)
	public int getTotalCount(String keyField, String keyWord) {
		Connection 		  con 	= null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs 	= null;
		String 			  sql 	= null;
		int 		totalCount	=0;
		try {
			con = pool.getConnection();
			if(keyWord.equals("null")||keyWord.equals("")) {
				
				sql = "SELECT COUNT(*) FROM Service";
				pstmt = con.prepareStatement(sql);
			}else {
		
			sql = "SELECT COUNT(*) FROM Service WHERE " + keyField + " LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyWord + "%");
		} 
			rs 	= pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		}	catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	//Service List
	 public Vector<ServiceBean> getServiceList
	  (String keyField,String keyWord,int start, int end){
	    Connection con 			= null;
	    PreparedStatement pstmt = null;
	    ResultSet rs 			= null;
	    String sql 				= null;
	    Vector<ServiceBean> vlist = new Vector<>();
	    try {
	      con = pool.getConnection();
	      if(keyWord.equals("null")||keyWord.equals("")) {
			      sql = "SELECT * FROM Service ORDER BY ref DESC,pos limit ?, ?";
			      pstmt = con.prepareStatement(sql);
			      pstmt.setInt(1, start);
			      pstmt.setInt(2, end);
	      }else {
			      sql = "SELECT * FROM Service WHERE " + keyField +
			      		   " like ? ORDER BY ref DESC, pos limit ?, ?";
			      pstmt = con.prepareStatement(sql);
			      pstmt.setString(1,  "%" + keyWord + "%");
			      pstmt.setInt(2, start);
			      pstmt.setInt(3, end);
	      }
			      rs = pstmt.executeQuery();
			      while(rs.next()) {
			    	  ServiceBean bean = new ServiceBean();
			    	  bean.setsNum(rs.getInt("snum"));
			    	  bean.setsName(rs.getString("sid"));
			    	  bean.setSubject(rs.getString("subject"));
			    	  bean.setPos(rs.getInt("pos"));
			    	  bean.setRef(rs.getInt("ref"));
			    	  bean.setDepth(rs.getInt("depth"));			    	 
			    	  bean.setRegdate(rs.getString("regdate"));
			    	  bean.setCount(rs.getInt("count"));
			    	  vlist.addElement(bean);
			      }
			    } catch (Exception e) {
			      e.printStackTrace();
			    } finally {
			      pool.freeConnection(con, pstmt, rs);
			    }
			    return vlist;
			  }
	
	//Service Get
	 public ServiceBean getService(int num) {
		Connection con 			= null;
		PreparedStatement pstmt = null;
		ResultSet rs 			= null;
		String sql 				= null;
		ServiceBean bean = new ServiceBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM Service WHERE snum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setsNum(rs.getInt("snum"));
				bean.setsName(rs.getString("sname"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setCount(rs.getInt("count"));
				bean.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	 }
	
	//Count Up(조회수 증가)
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "UPDATE Service SET count = count +1 WHERE snum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Service Delete
	public void deleteService(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "DELETE FROM Service WHERE snum = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return;
	}
	
	//Service Update
	public void updateService(ServiceBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "UPDATE Service SET sname=?, subject=?, content=? WHERE snum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getsName());	
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt	  (4, bean.getsNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	//Service Reply (답변)
		public void replyService(ServiceBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert Service(sname,content,subject,ref,pos,depth,regdate,pass,count,ip)";
				sql += "values(?, ?, ?, ?, ?, ?, now(), ?, 0, ?)";
													//		날짜 ,        조회수
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,  bean.getsName());
				pstmt.setString(2,  bean.getContent());
				pstmt.setString(3,  bean.getSubject());
				pstmt.setInt(4,  bean.getRef());			//원글의 ref값 저장, ref는 값을 그룹시켜준다 
				pstmt.setInt(5, bean.getPos()+1);		//답변은 원글바로밑에 잡히므로 원래있던 것을 1씩증가시키고 자리를 만듬 (밑메소드)
				pstmt.setInt(6, bean.getDepth()+1);
				pstmt.setString(7, bean.getPass());
				pstmt.setString(8,bean.getIp());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;
			
		}
	
	//Service Reply Up(답변 위치값 증가)
		public void replyUpService(int ref, int pos) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update Service set pos=pos+1 where ref= ? and pos > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, pos);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;
			
		}
	
	//main
	public static void main(String[] args) {

	}
}
