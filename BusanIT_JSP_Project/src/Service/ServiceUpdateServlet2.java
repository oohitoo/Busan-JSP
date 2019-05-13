package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/Service/ServiceUpdate2")
public class ServiceUpdateServlet2 extends HttpServlet {

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		
		//세션에 저장한 빈즈를 가져오기
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MultipartRequest multi = 
				new MultipartRequest(request, ServiceMgr.SAVEFOLDER, ServiceMgr.MAXSIZE, 
						ServiceMgr.ENCTYPE, new DefaultFileRenamePolicy());
		
		ServiceBean bean = (ServiceBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		String inPass = multi.getParameter("pass");

		if(inPass.equals(dbPass)) {
			new ServiceMgr().updateService2(multi);
			String nowPage = multi.getParameter("nowPage");
			String url = "read.jsp?nowPage="+nowPage+
					"&num="+multi.getParameter("num");
			response.sendRedirect(url);
		}else {
			out.println("<script>");	
			out.println("alert('입력하신 비밀번호가 아닙니다.')");	
			out.println("history.back()");	
			out.println("</script>");	
		}
	}
}























