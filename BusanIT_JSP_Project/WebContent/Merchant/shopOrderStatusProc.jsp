<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="ordersMgr" class="menu.ordersMgr"/>
<jsp:useBean id="ordersBean" class="menu.ordersBean"/>
<jsp:setProperty property="*" name="ordersBean"/>
<%	request.setCharacterEncoding("EUC-KR");
	
	String oNum = request.getParameter("oNum");
	String orderStatus = request.getParameter("orderStatus");
	ordersMgr.updateOrder(orderStatus, oNum);
%>
<script type="text/javascript">
	location.href = "shopMain.jsp";
</script>