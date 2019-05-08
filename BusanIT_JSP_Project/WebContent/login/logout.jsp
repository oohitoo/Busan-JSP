<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	session.invalidate();
%>
<script>
	alert("로그아웃 하였습니다.");
	location.href = '../Index.jsp';
</script>