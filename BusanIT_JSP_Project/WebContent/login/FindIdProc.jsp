<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<jsp:useBean id="bean" class="login.LoginBean"/>
<jsp:setProperty property="*" name="bean"/>
<%

	String name = request.getParameter("name");

	String msg = "���������ʴ� �����Դϴ�.";
	String location = "FindId.jsp";
	String findId = mgr.findloginId(bean);

	if (findId != null) {
		msg = "ã�� ������ ������ �����ϴ�. ";
		location = "../Index.jsp";
	}
%>
<script >
	alert("<%=msg +  findId + name %>");
	location.href= "<%=location%>";	
</script>