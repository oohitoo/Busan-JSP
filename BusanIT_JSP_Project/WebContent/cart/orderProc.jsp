<%@page import="menu.menuBean"%>
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
	
	/* �����ͺ��� */
	String shop = (String)session.getAttribute("shop"); // ���� �̸�
	String addres = request.getParameter("addres"); // �ۼ��� �ּ�
	String numbers = request.getParameter("phoneNumber"); // �ڵ��� ��ȣ
	String req = request.getParameter("request"); //��û ����
	String payType = request.getParameter("selectBox"); // ���� Ÿ��
	
	//�ֹ���ȣ�� �ۼ��ϱ� ���� ���ǰ� ������.
	String orderNum = session.getId().substring(session.getId().length()-5, session.getId().length());
	
	String msg = ""; // ���� ��� �� ��
	Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
	Enumeration<String> hCartKey = hCart.keys(); //���� ã�Ƽ� hCartKey
	
	if(!hCart.isEmpty()){
		while(hCartKey.hasMoreElements()){
			// ��ٱ��Ͽ� �ִ� �ֹ� ��ü
			ordersBean order = hCart.get(hCartKey.nextElement());
			menuBean bean = menuMgr.getmenuBean(shop, order.getmName());
			//�ֹ� ó��
			oMgr.insertOrder(order, orderNum, addres, shop, numbers, req, payType);
			//��ٱ��� ����
			cMgr.deleteCart(order);
/* 			out.print(addres + "<br>");
			out.print(order.getmName()+ "<br>"); // �޴��̸� ��������
			out.print(session.getId().substring(session.getId().length()-5, session.getId().length())+"<br>"); // ���ǰ� */
			//�ֹ���ȣ�� mgr ���� ó�� (��¥ + ���ǰ� 4�ڸ�), ȸ������(id, �г���,�ּ�), ���� �̸�, ��ȣ, �ֹ�����, ��û����, �������(��ī,����), status
			
			/* DB���� �� ��
				1. ��¥ + ���ǰ� 4�ڸ�
				2. status
				1. ȸ�� (id, �г���, �ּ�) [�õ��غ���]
			   Proc���� �� ��			    
			    - 2. �����̸�
			    - 3. ��ȣ
			    - 4. �ֹ�����
			    - 5. ��û����
			    - 6. �������
			    - 7. order �ѱ�� ��
			    - 8. ���� �� 5�ڸ� 
			*/
			
			/* LoginBean loginBean = loginMgr.getCustomer(id); */
			
			//��ٱ��� ����
			
		}
		msg = "�ֹ��� �Ϸ� �Ǿ����ϴ�.";
	}
	else{
		msg = "��ٱ��ϰ� ��� �ֽ��ϴ�.";
	}	
%>
<script>
	alert("<%= msg%>");
	location.href = 'orderList.jsp';
</script>