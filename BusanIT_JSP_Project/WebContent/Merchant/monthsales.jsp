<%@page import="Service.UtilMgr"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="menu.ordersBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	String rName = "�Ե����� �λ������";
	int year = Integer.parseInt(request.getParameter("year"));
	int subtotal, yeartotal = 0;
	int card=0,cash=0, directpay=0,month=0;
%>
<html>
<head>
<link rel="stylesheet" href="../css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script	type="text/javascript">
	function no(year,month) {
		location.href = "daysales.jsp?year="+year+"&month="+month;
		
	}
	function previous(year) {
		var int_year = Number(year);
		previous_year = int_year-1
 		location.href = "monthsales.jsp?year="+previous_year;
	}
	function next(year) {
		var int_year = Number(year);
		next_year = int_year+1
 		location.href = "monthsales.jsp?year="+next_year;
	}
	function main() {
		location.replace("shopMain.jsp");
	}
</script>
</head>
<body>
	<div id = "badal">
		<table class="baedalga table-hover">
			<tr>
				<td>
					<div>
						<button type="button" class="btn btn-primary" onclick="javascript:previous('<%=year%>')">��&nbsp;��&nbsp;��&nbsp;��</button>
					</div>
				</td>
				<td colspan="4"><h2 align="center">���� ���� ��ȸ</h2></td>
				<td>
					<div style="float: right; margin-right: 50px;">
						<button type="button" class="btn btn-primary" onclick="javascript:next('<%=year%>')">��&nbsp;��&nbsp;��&nbsp;��</button>
					</div>
			</tr>
		</table>
		
		<table class="baedalga table-hover ">
			<tr style="background: #4e73df 10%" >
				<td class="text-center">��</td>
				<td class="text-center">������ī��</td>
				<td class="text-center">����������</td>
				<td class="text-center">�ٷΰ���</td>
				<td class="text-center">�Ѿ�</td>
			</tr>
			
				<!-- ���� ������ �ϱ� -->
				<% for (int i= 1; i <= 12; ++i) {
					subtotal = 0;
					Vector<ordersBean> olist = mgr.monthsales(rName, i,year);
					HashMap<String, Integer> order = new HashMap<>();
					
						for (int l=0; l<olist.size(); l++) {
							ordersBean bean = olist.get(l);
							order.put(bean.getOrderType(), bean.getTotalPrice());
						}
		 			
				%>
				<tr align="center" onclick="javascript:no('<%=year %>','<%=i%>')">
					<td ><%= i %>��</td> <!-- �� ��� -->
					<% 		
						if(order.containsKey("������ ī�����")) {
							/* �� �Ѿ� */
							subtotal += order.get("������ ī�����");
							/* �� �Ѿ� */
							card += order.get("������ ī�����");
					%>
						<td><%= UtilMgr.monFormat(order.get("������ ī�����")) %>��</td>
					<% 
						} else{
					%>
						<td>-</td>
					<% 		
						} if(order.containsKey("������ ���ݰ���")) {
							/* �� �Ѿ� */
							subtotal += order.get("������ ���ݰ���");
							/* �� �Ѿ� */
							cash += order.get("������ ���ݰ���");	
					%>
						<td><%= UtilMgr.monFormat(order.get("������ ���ݰ���")) %></td>
					<% 
						} else  {
					%>
						<td>-</td>
					<% 		
						} if(order.containsKey("�ٷ� ����")) {
							/* �� �Ѿ� */
							subtotal += order.get("�ٷ� ����");
							/* �� �Ѿ� */
							directpay += order.get("�ٷ� ����");
					%>
						<td><%= UtilMgr.monFormat(order.get("�ٷ� ����")) %>��</td>
					<% 
						} else  {
					%>
						<td>-</td>
					<%
						}
						yeartotal += subtotal;
						
					//--olist for %>
					
				<!-- ��� �� ��� �� -->
						
	 				<td ><font color="#3a3b45"><b><%= UtilMgr.monFormat(subtotal) %>��</b></font></td> 
				</tr>
				<%}//--����for%>
				<tr class="impact">
					<td align="center">�հ� </td>
					<td align="center"><%= UtilMgr.monFormat(card) %></td>
					<td align="center"><%= UtilMgr.monFormat(cash) %></td>
					<td align="center"><%= UtilMgr.monFormat(directpay) %></td>
					<td colspan="3"  align="center"> <%= UtilMgr.monFormat(yeartotal) %>��</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<button type="button" class="btn btn-primary" onclick="javascript:previous('<%=year%>')">��&nbsp;��&nbsp;��&nbsp;��</button>
						<button type="button" class="btn btn-primary" onclick="javascript:main()">��&nbsp;��&nbsp;ȭ&nbsp;��</button>
						<button type="button" class="btn btn-primary" onclick="javascript:next('<%=year%>')">��&nbsp;��&nbsp;��&nbsp;��</button>
					</td>
				</tr>
		</table>
	</div>
</body>
</html>