package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet({ "/ServiceUpdateServlet", "/Service/ServiceUpdate" })
public class ServiceUpdateServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("EUC-KR");
			response.setContentType("text/html; charset=EUC-KR");
			
			//세션에 저장한 빈즈를 가져오기
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			
			ServiceBean bean = (ServiceBean)session.getAttribute("bean");
			String dbPass = bean.getPass();
			String inPass = request.getParameter("pass");
			if(inPass.equals(dbPass)) {
				//update.jsp 요청한 값을 테이블에 수정한다.
				ServiceBean upBean = new ServiceBean();
				upBean.setsNum(Integer.parseInt(request.getParameter("num")));
				upBean.setsName(request.getParameter("id"));
				upBean.setSubject(request.getParameter("subject"));
				upBean.setContent(request.getParameter("content"));
				new ServiceMgr().updateService(upBean);
				String nowPage = request.getParameter("nowPage");
				String url="read.jsp?nowPage=" + nowPage + "&num=" + upBean.getsNum();
				response.sendRedirect(url);
				
			}else {
				out.println("<script>");
				out.println("alert('입력하신 비밀번호가 아닙니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
			
	}
}
