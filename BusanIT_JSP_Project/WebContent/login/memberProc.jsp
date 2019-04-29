<!-- memberProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="login.loginMgr"/>
<jsp:useBean id="bean" class="login.loginBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mgr.insertMember(bean);
	String msg = "회원가입에 실패 하였습니다.";
	String location = "member.html";
	if(result) {
		msg = "회원가입을 하였습니다.";
		location = "login.html?id=" + bean.getId();
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>