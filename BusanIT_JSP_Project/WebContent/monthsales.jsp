<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="menu.ordersBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />

<%
	request.setCharacterEncoding("EUC-KR");

// 	String rName= (String)session.getAttribute("name");
	String rName = "�Ե����� �λ������";
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
	<h2>���� ���� ��ȸ</h2>
	<table border="1">
		<tr style="background: red">
			<td>��</td>
			<td>������ī��</td>
			<td>����������</td>
			<td>�ٷΰ���</td>
			<td>�Ѿ�</td>
		</tr>
		
			<!-- ���� ������ �ϱ� -->
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
				<td><%= i %>��</td> <!-- �� ��� -->
				<% 		
							if(order.containsKey("������ ī�����")) {
								totalprice += order.get("������ ī�����");
				%>
				<td><%= order.get("������ ī�����") %>��</td>
				<% 
							} else  {
				%>
				<td>0��</td>
				<% 		
							} if(order.containsKey("������ ���ݰ���")) {
								totalprice += order.get("������ ���ݰ���");
				%>
				<td><%= order.get("������ ���ݰ���") %>��</td>
				<% 
							} else  {
				%>
				<td>0��</td>
				<% 		
							} if(order.containsKey("�ٷΰ���")) {
								totalprice += order.get("�ٷΰ���");
				%>
				<td><%= order.get("�ٷΰ���") %>��</td>
				<% 
							} else  {
				%>
				<td>0��</td>
				<%
						}
						
				//--olist for %>
				
			<!-- ��� �� ��� �� -->
 				<td><%= totalprice %>��</td> 
			</tr>
			<%}//--����for%>
					
	</table>
</body>
</html>