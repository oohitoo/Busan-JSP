<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="MenuList.menuMgr" />
<%
	boolean flag = mgr.ShopimageUpdateFile(request, "�н�ƮǪ��");
	
	out.println(flag);

	if(flag){
		response.sendRedirect("sudongImage.jsp");
	}
	else{
		out.println("���� �Ͽ����ϴ�.");
	}
%>