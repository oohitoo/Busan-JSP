<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");

	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  String msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  String href = "login.html";
	  boolean result = mgr.loginCustomer(id, pass);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "�α��ο� ���� �Ͽ����ϴ�.";
	    href = "../Index.jsp";
	  }
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=href%>";
</script>