<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr" />
<jsp:useBean id="bean" class="login.LoginBean" />
<jsp:setProperty property="*" name="bean" />
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	String msg = "입력하신 정보가 잘못되었거나 존재하지않는 계정입니다.";
	String location = "FindId.jsp";
	String findPwd = mgr.findloginPwd(bean);

	if (findPwd != null) {
		msg = "비밀번호는 다음과 같습니다 :" + findPwd;
		location = "login.html";
	}
%>
<script>
	alert("<%=msg%>");
	location.href= "<%=location%>";
</script>
