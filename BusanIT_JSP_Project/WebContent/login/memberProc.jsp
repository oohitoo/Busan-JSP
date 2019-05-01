<!-- memberProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<jsp:useBean id="bean" class="login.LoginBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	String caddress1 = request.getParameter("caddress1");
	String caddress2 = request.getParameter("caddress2");
	bean.setcAddress(caddress1 + caddress2);
	boolean result = mgr.insertMember(bean);
	String msg = "회원가입에 실패 하였습니다.";
	String location = "member.html";
	if(result) {
		msg = "회원가입을 하였습니다.";
		location = "login.html";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>