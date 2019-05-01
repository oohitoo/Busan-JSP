<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");

	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  String msg = "로그인에 실패 하였습니다.";
	  String href = "login.html";
	  boolean result = mgr.loginCustomer(id, pass);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "로그인에 성공 하였습니다.";
	    href = "../Index.jsp";
	  }
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=href%>";
</script>