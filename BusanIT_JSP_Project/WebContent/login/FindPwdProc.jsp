<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<jsp:useBean id="bean" class="login.LoginBean"/>
<jsp:setProperty property="*" name="bean"/>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
		
		
		String msg = "존재하지않는 계정입니다.";
		String location = "FindId.jsp";
		String findPwd = mgr.findloginId(bean);
		
		if(findPwd!=null){
			msg = "찾는 계정은 다음과 같습니다. ";
			location = "Index.html";
		}
%>

<script >
	alert("<%=msg +  findPwd %>");
	location.href= "<%=location%>";	
</script> 

