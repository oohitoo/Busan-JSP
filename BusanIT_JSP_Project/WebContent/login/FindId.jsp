<%@ page contentType="text/html; charset=EUC-KR" %>
<%	request.setCharacterEncoding("EUC-KR");	%>
<jsp:useBean id="mgr" class="login.loginMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  String msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  
	  boolean result = mgr.loginCustomer(id, pass);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  }
%>
<script>
	alert("<%=msg%>");
	location.href = "login.jsp";
</script>