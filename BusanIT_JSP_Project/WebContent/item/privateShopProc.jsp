<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="menu.CartMgr"/>
<jsp:useBean id="order" class="orders.ordersBean" />
<jsp:setProperty property="*" name="order"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	
	if(id == null){
		response.sendRedirect("../login/login.html");
	}
	else{
		String flag = request.getParameter("flag");
		String msg = "";
		order.setId(id);
		if(flag.equals("insert")){
			cMgr.addCart(order);
			msg = "��ٱ��Ͽ� �߰��Ͽ����ϴ�.";
		}
		else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg = "��ٱ��Ͽ� �����Ͽ����ϴ�.";
		}
		else if(flag.equals("del")){
			cMgr.deleteCart(order);
			msg = "��ٱ��Ͽ� �����Ͽ����ϴ�.";
		}
	
%>
<script>
	alert("<%= msg %>");
	history.go(-1);
</script>
<% } %>