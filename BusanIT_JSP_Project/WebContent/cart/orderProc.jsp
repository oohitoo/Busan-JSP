<%@page import="java.util.Enumeration"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Hashtable"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="cMgr" scope="session" class="menu.CartMgr"/>
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>
<jsp:useBean id="loginMgr" class="login.LoginMgr"/>
<jsp:useBean id="oMgr" class="orders.ordersMgr"/>
<jsp:useBean id="loginBean" class="login.LoginBean"/>
<%
	request.setCharacterEncoding("EUC-KR");

	String msg = ""; // ���� ��� �� ��
	Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
	Enumeration<String> hCartKey = hCart.keys(); //���� ã�Ƽ� hCartKey
	
	if(!hCart.isEmpty()){
		while(hCartKey.hasMoreElements()){
			// ��ٱ��Ͽ� �ִ� �ֹ� ��ü
			ordersBean order = hCart.get(hCartKey.nextElement());
			//�ֹ� ó��
			out.print(order.getmName()); // �޴��̸� ��������
			out.print(session.getAttribute("shop")); // �������� ���� �̸� ������
			out.print(session.getId().substring(session.getId().length()-5, session.getId().length())); // ���ǰ�
			//�ֹ���ȣ�� mgr ���� ó�� (��¥ + ���ǰ� 4�ڸ�), 
			
			//��ٱ��� ����
			
		}
		msg = "�ֹ��� �Ϸ� �Ǿ����ϴ�.";
	}
	else{
		msg = "��ٱ��ϰ� ��� �ֽ��ϴ�.";
	}	
%>
<%-- <script>
	alert("<%= msg%>");
	location.href = 'orderList.jsp';
</script> --%>