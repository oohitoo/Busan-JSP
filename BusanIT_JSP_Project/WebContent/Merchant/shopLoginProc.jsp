<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  String msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  
	  boolean result = mgr.loginShop(id, pass);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "�α��ο� ���� �Ͽ����ϴ�.";
	    %>
	    <script>
	    location.href = "shopMain.jsp";
		</script>
	    <% }%>
<script>
	alert("<%=msg%>");
	location.href = "shopLogin.jsp";
</script>
	  