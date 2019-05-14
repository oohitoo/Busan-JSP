<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="menu.CartMgr"/>
<jsp:useBean id="order" class="orders.ordersBean" />
<jsp:setProperty property="*" name="order"/>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	String menu = request.getParameter("menu");
	String info = request.getParameter("info");
	String price = request.getParameter("price");
	
	String id = (String)session.getAttribute("idKey");
	int count = Integer.parseInt(request.getParameter("count"));
	
	if(id == null){
		%>
		<script>
			history.back();
		</script>
		<%
	}
	else{
		String flag = request.getParameter("flag");
		String msg = "";
		order.setId(id);
		if(flag.equals("insert")){
			cMgr.addCart(order);
			msg = "장바구니에 추가하였습니다.";
		}
		else if(flag.equals("update")){
			/* cMgr.updateCart(order); */
			msg = "장바구니에 수정하였습니다.";
		}
		else if(flag.equals("del")){
			/* cMgr.deleteCart(order); */
			msg = "장바구니에 삭제하였습니다.";
		}
	}
%>
<%-- <script>
	alert("<%=menu%>가(이) 추가되었습니다.");
	history.go(-1);
</script> --%>