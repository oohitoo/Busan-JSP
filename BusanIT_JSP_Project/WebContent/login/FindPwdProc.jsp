<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr" />
<jsp:useBean id="bean" class="login.LoginBean" />
<jsp:setProperty property="*" name="bean" />
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	String msg = "�Է��Ͻ� ������ �߸��Ǿ��ų� ���������ʴ� �����Դϴ�.";
	String location = "FindId.jsp";
	String findPwd = mgr.findloginPwd(bean);

	if (findPwd != null) {
		msg = "��й�ȣ�� ������ �����ϴ� :" + findPwd;
		location = "login.html";
	}
%>
<script>
	alert("<%=msg%>");
	location.href= "<%=location%>";
</script>
