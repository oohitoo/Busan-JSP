<!-- memberProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="login.loginMgr"/>
<jsp:useBean id="bean" class="login.loginBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mgr.insertMember(bean);
	String msg = "ȸ�����Կ� ���� �Ͽ����ϴ�.";
	String location = "meber.jsp";
	if(result) {
		msg = "ȸ�������� �Ͽ����ϴ�.";
		location = "login.jsp?id=" + bean.getId();
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>