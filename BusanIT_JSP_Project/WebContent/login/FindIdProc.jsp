<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<jsp:useBean id="bean" class="login.LoginBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	String name = request.getParameter("name");
	String Id [] ;
	String msg = "�Է��Ͻ� ������ �߸��Ǿ��ų� ���������ʴ� �����Դϴ�.";
	String location = "FindId.jsp";
	String findId = mgr.findloginId(bean);
	if (findId != null) {
		msg = "������ ã�ҽ��ϴ�.";
		Id = findId.split("@");	
		location = "login.jsp?Id1=" +Id[0] +"&Id2="+ Id[1] ;
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script> 