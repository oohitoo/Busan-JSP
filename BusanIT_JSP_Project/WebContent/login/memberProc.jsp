<!-- memberProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<jsp:useBean id="bean" class="shoplogin.loginBean"/>
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