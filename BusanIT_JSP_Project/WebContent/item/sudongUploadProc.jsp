<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="MenuList.menuMgr" />
<%
	boolean flag = mgr.ShopimageUpdateFile(request, "패스트푸드");
	
	out.println(flag);

	if(flag){
		response.sendRedirect("sudongImage.jsp");
	}
	else{
		out.println("실패 하였습니다.");
	}
%>