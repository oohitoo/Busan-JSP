package Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;


@WebServlet({ "/ServicePostServlet", "/Service/ServicePost" })
public class ServicePostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
			String id = (String)session.getAttribute("idKey");
		ServiceMgr mgr = new ServiceMgr();
		mgr.insertService(request,id);
		response.sendRedirect("ServiceMain.jsp");
	}

}
