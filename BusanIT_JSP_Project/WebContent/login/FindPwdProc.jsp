<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr" />
<jsp:useBean id="bean" class="login.LoginBean" />
<jsp:setProperty property="*" name="bean" />
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	String msg = "���������ʴ� �����Դϴ�.";
	String location = "FindId.jsp";
	String findPwd = mgr.findloginId(bean);

	if (findPwd != null) {
		msg = "��й�ȣ�� ������ �����ϴ� :";
		location = "../Index.jsp";
	}
%>
<script>
	alert("<%=msg + findPwd%>");
	location.href= "<%=location%>";
</script>
