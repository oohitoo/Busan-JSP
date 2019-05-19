<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="ordersMgr" class="orders.ordersMgr"/>

<%	request.setCharacterEncoding("EUC-KR");
	
	String oNum = request.getParameter("oNum");
%>