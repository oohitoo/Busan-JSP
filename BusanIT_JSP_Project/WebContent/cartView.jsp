<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<h2>장바구니</h2>
<hr>
<%
	if (session.getAttribute("shopingList") == null) {
		out.println("없음");
	}
	else {
		ArrayList<String> list = (ArrayList) session.getAttribute("shopingList");

		for (int i = 1; i < list.size(); i++) {
			out.println(list.get(i));
			if (i % 3 == 0) {
				out.println("<br>");
			}
		}
	}
%>

<input type="button" value="뒤로가기" onclick="location.href='Index.jsp'">