<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="login.loginMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  String msg = "Login failed";
	  
 	  boolean result = mgr.loginCustomer(id, pass);
 	  if(result){
 	    session.setAttribute("idKey",id);
 	    msg = "Login success";
 	  }
%>
<%-- <script>
	alert("<%=msg%>");
	location.href = "login.jsp";
</script> --%>
id : <%=id%>
pass : <%= pass%>
