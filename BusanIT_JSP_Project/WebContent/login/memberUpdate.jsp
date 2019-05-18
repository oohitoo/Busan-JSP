<%@page import="login.LoginBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	LoginBean bean = mgr.getCustomer(id);
%>
<script>
	function menulist(menu) {
		console.log(menu);
		location.href = 'item/itemProc.jsp?menu='+menu;
	}
</script>
<jsp:include page="desienForm.jsp" />				
<!-- 여기에 메인부분!!! -->
<%@include file="in_memberUpdate.jsp" %>
