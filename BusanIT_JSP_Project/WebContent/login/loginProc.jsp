<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="login.loginMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  
	  boolean result = mgr.loginCustomer(id, pass);
	  if(result){
	    session.setAttribute("idKey",id);
	    %>
	    	<script>
		  		location.href = "../Index.jsp";
		  	</script>
	    <%
	  }
	  else{
		  %>
		  	<script>
		  		alert("로그인에 실패하였습니다.");
		  		location.href = "login.jsp";
		  	</script>
		  <%
}
%>