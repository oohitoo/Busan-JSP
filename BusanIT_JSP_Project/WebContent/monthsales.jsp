<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="menu.ordersBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />

<%
	request.setCharacterEncoding("EUC-KR");

	String rName = "롯데리아 부산양정점";
	int subtotal, yeartotal = 0;
%>
<html>
<head>

</head>
<body>
	<h2>월별 매출 조회</h2>
	<table>
		<tr style="background: red">
			<td>월</td>
			<td>만나서카드</td>
			<td>만나서현금</td>
			<td>바로결제</td>
			<td>총액</td>
		</tr>
		
			<!-- 월별 나오게 하기 -->
			<% for (int i= 1; i <= 12; ++i) {
				subtotal = 0;
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
						/* 달 총액 */
						subtotal += order.get("만나서 카드결제");
						/* 년 총액 */
				%>
					<td><%= order.get("만나서 카드결제") %>원</td>
				<% 
					} else{
				%>
					<td>0원</td>
				<% 		
					} if(order.containsKey("만나서 현금결제")) {
						/* 달 총액 */
						subtotal += order.get("만나서 현금결제");
						/* 년 총액 */
				%>
					<td><%= order.get("만나서 현금결제") %>원</td>
				<% 
					} else  {
				%>
					<td>0원</td>
				<% 		
					} if(order.containsKey("바로결제")) {
						/* 달 총액 */
						subtotal += order.get("바로결제");
						/* 년 총액 */
				%>
					<td><%= order.get("바로결제") %>원</td>
				<% 
					} else  {
				%>
					<td>0원</td>
				<%
					}
					yeartotal += subtotal;
				//--olist for %>
				
			<!-- 모든 달 출력 부 -->
 				<td><%= subtotal %>원</td> 
			</tr>
			<%}//--월별for%>
			<tr>
				<td colspan="2">합계 :</td>
				<td colspan="3">숫자 <%= yeartotal %></td>
			</tr>
	</table>
</body>
</html>