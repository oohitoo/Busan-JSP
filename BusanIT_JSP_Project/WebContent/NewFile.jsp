<%@page import="java.util.Vector"%>
<%@page import="menu.ordersBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />

<%
	request.setCharacterEncoding("EUC-KR");

// 	String rName= (String)session.getAttribute("name");
	String rName = "��ܺ�";
	String year = "2019";
	String month = "00";
	String type ="";
	Vector<ordersBean> list = mgr.monthsales(rName,year);
%>
<html>
<head>

</head>
<body>
	<h2>���� ���� ��ȸ</h2>
	<table border="1">
		<tr style="background: red">
			<td>��</td>
			<td>ī��</td>
			<td>�ٷΰ���</td>
			<td>����</td>
			<td>�Ѿ�</td>
		</tr>
		<%if(list.isEmpty()){
		%>
		<tr>
			<td colspan="5">���� ������ �����ϴ�.</td>
		</tr>
		<%
		}else{
			for(int i = 0; i < list.size(); ++i){
				ordersBean bean=  list.get(i);
				
				if(month.equals(bean.getoDate().substring(6, 7))){
					
				} else {
					month = bean.getoDate().substring(6, 7);
					
		%>
		<tr>
			<td><%=month %></td>
			<%
						for(int j = 0 ; j<list.size();j++){
							ordersBean jbean=  list.get(j);
						%>
			<td><%=jbean.getTotalPrice() %></td>
			<%	
						}
					%>
			
		</tr>
		<% 					
				}//-if
				
			}//--for
		}//--if
		%>

	</table>
</body>
</html>