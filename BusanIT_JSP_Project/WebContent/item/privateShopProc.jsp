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
		session.setAttribute("shopingList", list);
	}

	list.add(menu);
	list.add(info);
	list.add(price);
%>
<script>
	alert("<%=menu%>��(��) �߰��Ǿ����ϴ�.");
	history.go(-1);
</script>
