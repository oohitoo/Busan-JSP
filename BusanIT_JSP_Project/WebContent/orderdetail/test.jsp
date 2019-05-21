<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="menu.ordersMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	
	String date = "2019-05-21 09:27:03.0";
	out.println(date+ "<br>");
	out.println(date.substring(5, 7)+"¿ù " + date.substring(8,10)+"ÀÏ");
	
	
// 	for(int i = 0; i< list.size();i++) {
// 		ordersBean bean = list.get(i);
// 		String date = mFormat.format(bean.getoDate());
// 		out.println(date);
// 	}

%>