<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<jsp:useBean id="bean" class="login.LoginBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	String name = request.getParameter("name");
	String Id [] ;
	String msg = "입력하신 정보가 잘못되었거나 존재하지않는 계정입니다.";
	String location = "FindId.jsp";
	String findId = mgr.findloginId(bean);
	if (findId != null) {
		msg = "계정을 찾았습니다.";
		Id = findId.split("@");	
		location = "login.jsp?Id1=" +Id[0] +"&Id2="+ Id[1] ;
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script> 