<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="menu.ordersBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />

<%
	request.setCharacterEncoding("EUC-KR");

	String rName = "�Ե����� �λ������";
	int subtotal, yeartotal = 0;
%>
<html>
<head>

</head>
<body>
	<h2>���� ���� ��ȸ</h2>
	<table>
		<tr style="background: red">
			<td>��</td>
			<td>������ī��</td>
			<td>����������</td>
			<td>�ٷΰ���</td>
			<td>�Ѿ�</td>
		</tr>
		
			<!-- ���� ������ �ϱ� -->
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
				<td><%= i %>��</td> <!-- �� ��� -->
				<% 		
					if(order.containsKey("������ ī�����")) {
						/* �� �Ѿ� */
						subtotal += order.get("������ ī�����");
						/* �� �Ѿ� */
				%>
					<td><%= order.get("������ ī�����") %>��</td>
				<% 
					} else{
				%>
					<td>0��</td>
				<% 		
					} if(order.containsKey("������ ���ݰ���")) {
						/* �� �Ѿ� */
						subtotal += order.get("������ ���ݰ���");
						/* �� �Ѿ� */
				%>
					<td><%= order.get("������ ���ݰ���") %>��</td>
				<% 
					} else  {
				%>
					<td>0��</td>
				<% 		
					} if(order.containsKey("�ٷΰ���")) {
						/* �� �Ѿ� */
						subtotal += order.get("�ٷΰ���");
						/* �� �Ѿ� */
				%>
					<td><%= order.get("�ٷΰ���") %>��</td>
				<% 
					} else  {
				%>
					<td>0��</td>
				<%
					}
					yeartotal += subtotal;
				//--olist for %>
				
			<!-- ��� �� ��� �� -->
 				<td><%= subtotal %>��</td> 
			</tr>
			<%}//--����for%>
			<tr>
				<td colspan="2">�հ� :</td>
				<td colspan="3">���� <%= yeartotal %></td>
			</tr>
	</table>
</body>
</html>