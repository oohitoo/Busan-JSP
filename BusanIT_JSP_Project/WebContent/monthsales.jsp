<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="menu.ordersBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />

<%
	request.setCharacterEncoding("EUC-KR");

// 	String rName= (String)session.getAttribute("name");
	String rName = "롯데리아 부산양정점";
	int cnt = 0;
	/* String year = "2019";
	String month = "00";
	String type =""; */
	int totalprice;
/* 	Vector<ordersBean> list = mgr.monthsales(rName,year); */
%>
<html>
<head>

</head>
<body>
	<h2>월별 매출 조회</h2>
	<table border="1">
		<tr style="background: red">
			<td>월</td>
			<td>만나서카드</td>
			<td>만나서현금</td>
			<td>바로결제</td>
			<td>총액</td>
		</tr>
		
			<!-- 월별 나오게 하기 -->
			<% for (int i= 1; i <= 12; ++i) {
				totalprice = 0;
				Vector<ordersBean> olist = mgr.monthsales(rName, i);
				HashMap<String, Integer> order = new HashMap<>();
				
					for (int l=0; l<olist.size(); l++) {
						ordersBean bean = olist.get(l);
						order.put(bean.getOrderType(), bean.getTotalPrice());
					}
	 			
			%>
			<tr>
				<td><%= i %>월</td> <!-- 월 출력 -->
				<% 		
							if(order.containsKey("만나서 카드결제")) {
								totalprice += order.get("만나서 카드결제");
				%>
				<td><%= order.get("만나서 카드결제") %>원</td>
				<% 
							} else  {
				%>
				<td>0원</td>
				<% 		
							} if(order.containsKey("만나서 현금결제")) {
								totalprice += order.get("만나서 현금결제");
				%>
				<td><%= order.get("만나서 현금결제") %>원</td>
				<% 
							} else  {
				%>
				<td>0원</td>
				<% 		
							} if(order.containsKey("바로결제")) {
								totalprice += order.get("바로결제");
				%>
				<td><%= order.get("바로결제") %>원</td>
				<% 
							} else  {
				%>
				<td>0원</td>
				<%
						}
						
				//--olist for %>
				
			<!-- 모든 달 출력 부 -->
 				<td><%= totalprice %>원</td> 
			</tr>
			<%}//--월별for%>
					
	</table>
</body>
</html>