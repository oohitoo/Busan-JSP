<%@page import="Service.UtilMgr"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="menu.ordersBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	String rName = "롯데리아 부산양정점";
	int year = Integer.parseInt(request.getParameter("year"));
	int subtotal, yeartotal = 0;
	int card=0,cash=0, directpay=0,month=0;
%>
<html>
<head>
<link rel="stylesheet" href="css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script	type="text/javascript">
	function no(month) {
		location.href = "daysales.jsp?month="+month;
	}
	function previous(year) {
		var int_year = Number(year);
		previous_year = int_year-1
 		location.href = "daysales.jsp?year="+previous_year;
	}
	function next(year) {
		var int_year = Number(year);
 		location.href = "daysales.jsp?year="+next_year;
	}
</script>
</head>
<body>
<button align="left" type="button" class="btn btn-primary" onclick="javascript:previous('<%=year%>')">이&nbsp;전&nbsp;년도</button>
<button align="left" type="button" class="btn btn-primary" onclick="javascript:next('<%=year%>')">다&nbsp;음&nbsp;년도</button>
	<h2 align="center">월별 매출 조회</h2>
	<table  class="baedalga table-hover ">
		<tr style="background: #4e73df 10%" >
			<td class="text-center">월</td>
			<td class="text-center">만나서카드</td>
			<td class="text-center">만나서현금</td>
			<td class="text-center">바로결제</td>
			<td class="text-center">총액</td>
		</tr>
		
			<!-- 월별 나오게 하기 -->
			<% for (int i= 1; i <= 12; ++i) {
				subtotal = 0;
				Vector<ordersBean> olist = mgr.monthsales(rName, i,year);
				HashMap<String, Integer> order = new HashMap<>();
				
					for (int l=0; l<olist.size(); l++) {
						ordersBean bean = olist.get(l);
						out.print(year = Integer.parseInt(bean.getoYear()));
						order.put(bean.getOrderType(), bean.getTotalPrice());
					}
	 			
			%>
			<tr align="center" onclick="javascript:no('<%=i%>')">
				<td ><%= i %>월</td> <!-- 월 출력 -->
				<% 		
					if(order.containsKey("만나서 카드결제")) {
						/* 달 총액 */
						subtotal += order.get("만나서 카드결제");
						/* 년 총액 */
						card += order.get("만나서 카드결제");
				%>
					<td><%= UtilMgr.monFormat(order.get("만나서 카드결제")) %>원</td>
				<% 
					} else{
				%>
					<td>-</td>
				<% 		
					} if(order.containsKey("만나서 현금결제")) {
						/* 달 총액 */
						subtotal += order.get("만나서 현금결제");
						/* 년 총액 */
						cash += order.get("만나서 현금결제");	
				%>
					<td><%= UtilMgr.monFormat(order.get("만나서 현금결제")) %></td>
				<% 
					} else  {
				%>
					<td>-</td>
				<% 		
					} if(order.containsKey("바로 결제")) {
						/* 달 총액 */
						subtotal += order.get("바로 결제");
						/* 년 총액 */
						directpay += order.get("바로 결제");
				%>
					<td><%= UtilMgr.monFormat(order.get("바로 결제")) %>원</td>
				<% 
					} else  {
				%>
					<td>-</td>
				<%
					}
					yeartotal += subtotal;
					
				//--olist for %>
				
			<!-- 모든 달 출력 부 -->
					
 				<td ><font color="#3a3b45"><b><%= UtilMgr.monFormat(subtotal) %>원</b></font></td> 
			</tr>
			<%}//--월별for%>
			<tr class="impact">
				<td align="center">합계 </td>
				<td align="center"><%= UtilMgr.monFormat(card) %></td>
				<td align="center"><%= UtilMgr.monFormat(cash) %></td>
				<td align="center"><%= UtilMgr.monFormat(directpay) %></td>
				<td colspan="3"  align="center"> <%= UtilMgr.monFormat(yeartotal) %>원</td>
			</tr>
	</table>
	
</body>
</html>