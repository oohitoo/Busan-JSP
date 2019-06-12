<%@page import="menu.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="cMgr" scope="session" class="menu.CartMgr"/>
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>
<jsp:useBean id="loginMgr" class="login.LoginMgr"/>
<jsp:useBean id="oMgr" class="menu.ordersMgr"/>
<jsp:useBean id="loginBean" class="login.LoginBean"/>

<%
	request.setCharacterEncoding("EUC-KR");
	
	/* �����ͺ��� */
	String id = (String)session.getAttribute("idKey");
	String shop = (String)session.getAttribute("shop"); // ���� �̸�
	String addres = request.getParameter("address"); // �ۼ��� �ּ�
	String numbers = request.getParameter("phoneNumber"); // �ڵ��� ��ȣ
	String req = request.getParameter("request"); //��û ����
	String payType = request.getParameter("paytype"); // ���� Ÿ��
	int k =0;
	//�������� 8�ڸ� ����+���� �����
	String tempoNum = "";
    for (int i = 0; i < 8; i++) {
        int rndVal = (int) (Math.random() * 62);
        if (rndVal < 10) {
            tempoNum += rndVal;
        } else if (rndVal > 35) {
            tempoNum += (char) (rndVal + 61);
        } else {
            tempoNum += (char) (rndVal + 55);
        }
    }
    
    out.print(payType);
    String[] menu=request.getParameterValues("menu");
    String[] count=(request.getParameterValues("counts"));
    
	//�ֹ���ȣ�� �ۼ��ϱ� ���� ���ǰ� ������.
	//�ֹ���ȣ�� 8�ڸ� ����+���ڷ� ��
	String orderNum = tempoNum;
	
	String msg = ""; // ���� ��� �� ��
	Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
	Enumeration<String> hCartKey = hCart.keys(); //���� ã�Ƽ� hCartKey
	
	if(!hCart.isEmpty()){
		while(hCartKey.hasMoreElements()){
			
			// ��ٱ��Ͽ� �ִ� �ֹ� ��ü
			//�޴��̸�, ���� ��������
			//size, �޴��̸�, ������ cartView���� �迭�� ��������
			ordersBean order = hCart.get(hCartKey.nextElement());
			//menuBean bean = menuMgr.getmenuBean(shop, order.getMenu());
			int intcount = Integer.parseInt(count[k]);
			//�ֹ� ó��
			oMgr.insertOrder(id,menu[k],intcount, orderNum, addres, shop, numbers, req, payType);
			//��ٱ��� ����
			cMgr.deleteCart(order);
			k++;
		}
		msg = "�ֹ��� �Ϸ� �Ǿ����ϴ�.";
		// �ֹ��� table ����
		hCart.clear();
				
	}
	else{
		msg = "��ٱ��ϰ� ��� �ֽ��ϴ�.";
	}	
%>
 <script>
	 location.replace('../orderdetail/orderList.jsp');
</script> 