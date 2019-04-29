<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  String msg = "로그인에 실패 하였습니다.";
	  
	  boolean result = mgr.loginShop(id, pass);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "로그인에 성공 하였습니다.";
	    %>
	    <script>
	    location.href = "shopMain.jsp";
		</script>
	    <% }%>
<script>
	alert("<%=msg%>");
	location.href = "shopLogin.jsp";
</script>
	  