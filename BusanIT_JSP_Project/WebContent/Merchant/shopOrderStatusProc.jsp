<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="ordersMgr" class="orders.ordersMgr"/>
<jsp:useBean id="ordersBean" class="orders.ordersBean"/>
<jsp:setProperty property="*" name="ordersBean"/>
<%	request.setCharacterEncoding("EUC-KR");
	
	String oNum = request.getParameter("oNum");
	String orderStatus = request.getParameter("orderStatus");
%>
<script type="text/javascript">
	location.href = "shopMain.jsp";
</script>