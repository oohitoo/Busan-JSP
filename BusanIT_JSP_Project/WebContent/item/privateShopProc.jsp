<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="menu.CartMgr"/>
<jsp:useBean id="order" class="menu.ordersBean" />
<jsp:setProperty property="*" name="order"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	String shop = (String)session.getAttribute("shop");
	if(id == null){
		response.sendRedirect("../login/login.html");
	}
	else{
		String flag = request.getParameter("flag");
		String msg = "";
		order.setmName(request.getParameter("menu"));
		order.setCount(Integer.parseInt(request.getParameter("count")));
		order.setId(id);
		if(flag.equals("insert")){
			cMgr.addCart(order);
			msg = "장바구니에 추가하였습니다.";
		}
		else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg = "장바구니에 수정하였습니다.";
		}
		else if(flag.equals("del")){
			cMgr.deleteCart(order);
			msg = "장바구니에 삭제하였습니다.";
		}
	
%>
<script>
	alert("<%= msg %>");
	location.href = "../cart/cartView.jsp";
</script>
<% } %>