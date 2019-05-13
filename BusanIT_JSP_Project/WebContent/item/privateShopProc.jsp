<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	String menu = request.getParameter("menu");
	String info = request.getParameter("info");
	String price = request.getParameter("price");

	ArrayList<String> list = (ArrayList) session.getAttribute("shopingList");

	if (list == null) {
		list = new ArrayList<String>();
		list.add(0,"0");
		session.setAttribute("shopingList", list);
		session.setMaxInactiveInterval(60 * 60);
	}

	list.add(menu);
	list.add(info);
	list.add(price);
%>
<script>
	alert("<%=menu%>가(이) 추가되었습니다.");
	history.go(-1);
</script>
