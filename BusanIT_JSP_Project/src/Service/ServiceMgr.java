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
	private 					DBConnectionMgr 	pool;
	public static final 	String SAVEFOLDER 	= "C://Jsp//eclipse-workspace//eclipse-workspace//Test_JSP//work//Test_JSP//WebContent//Service//fileupload/";
	public static final 	String ENCTYPE 		= "EUC-KR";
	public static int 			   MAXSIZE 		= 10 * 1024 * 1024;
	
	public ServiceMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Service Insert : 
	public void insertService(HttpServletRequest req) {
		Connection 			con 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String 				sql 	= null;
		try {
			
				File dir = new File(SAVEFOLDER);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				MultipartRequest multi 	=
						new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
				String 	filename  	= null;
				int		filesize 	= 0;
				if(multi.getFilesystemName("filename")!=null) {
					filename 	= multi.getFilesystemName("filename");
					filesize 	= (int)multi.getFile("").length(); 
					
				}
				
				//게시물 내용
				String content = multi.getParameter("content");
				if(multi.getParameter("contentType").equals("TEXT")) {
					content = UtilMgr.replace(content,"<","&lt;");
				}
			
				con 	= pool.getConnection();
				sql 	= "SELECT max(num) FROM Service";
				pstmt 	= con.prepareStatement(sql);
				rs 		= pstmt.executeQuery();
				int ref = 1;
				if(rs.next())
					ref = rs.getInt(1) + 1; 
				sql = "insert Service(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
				sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, content);
				pstmt.setString(3, multi.getParameter("subject"));
				pstmt.setInt	  (4, ref);
				pstmt.setString(5, multi.getParameter("pass"));
				pstmt.setString(6, multi.getParameter("ip"));
				pstmt.setString(7, filename);
				pstmt.setInt	  (8, filesize);
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
			    	  bean.setNum(rs.getInt("num"));
			    	  bean.setName(rs.getString("name"));
			    	  bean.setSubject(rs.getString("subject"));
			    	  bean.setPos(rs.getInt("pos"));
			    	  bean.setRef(rs.getInt("ref"));
			    	  bean.setDepth(rs.getInt("depth"));
			    	 
			    	  bean.setRegdate(rs.getString("regdate"));
			    	  bean.setCount(rs.getInt("count"));
			    	  bean.setFilename(rs.getString("filename"));
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
			sql = "SELECT * FROM Service WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
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
			sql = "UPDATE Service SET count = count +1 WHERE num = ?";
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
			sql = "SELECT filename FROM Service WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()&&rs.getString(1)!=null) {
				if(!rs.getString(1).equals("")) {
					File file = new File(SAVEFOLDER + rs.getString(1));
					if(file.exists()) {
						UtilMgr.delete(SAVEFOLDER + rs.getString(1));
					}
				}
			}
			sql = "DELETE FROM Service WHERE num = ?";
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
			sql = "UPDATE Service SET name=?, subject=?, content=? WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());	
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt	  (4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	//Service Update2(파일 수정)
		public void updateService2(MultipartRequest multi) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				if(multi.getFilesystemName("filename")!=null) {
					sql = "update Service set name=?, subject=?, content=?, "
							+ "filename=? where num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("name"));
					pstmt.setString(2, multi.getParameter("subject"));
					pstmt.setString(3, multi.getParameter("content"));
					pstmt.setString(4, multi.getFilesystemName("filename"));
					pstmt.setInt(5, Integer.parseInt(multi.getParameter("num")));
				}else {
					sql = "update Service set name=?, subject=?, content=? "
							+ "where num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("name"));
					pstmt.setString(2, multi.getParameter("subject"));
					pstmt.setString(3, multi.getParameter("content"));
					pstmt.setInt(4, Integer.parseInt(multi.getParameter("num")));
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
	
	//Service Reply (답변)
		public void replyService(ServiceBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert Service(name,content,subject,ref,pos,depth,regdate,pass,count,ip)";
				sql += "values(?, ?, ?, ?, ?, ?, now(), ?, 0, ?)";
													//		날짜 ,        조회수
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,  bean.getName());
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
	
	//Post 1000
	public void post1000(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert Service(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	//main
	public static void main(String[] args) {
		ServiceMgr mgr = new ServiceMgr();
		mgr.post1000();

	}
}
