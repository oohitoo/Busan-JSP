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
	
	/* 가져와보자 */
	String shop = (String)session.getAttribute("shop"); // 가게 이름
	String addres = request.getParameter("addres"); // 작성한 주소
	String numbers = request.getParameter("phoneNumber"); // 핸드폰 번호
	String req = request.getParameter("request"); //요청 사항
	String payType = request.getParameter("selectBox"); // 결제 타입
	
	//랜덤으로 8자리 숫자+문자 만들기
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
    out.println("tempoNum : " + tempoNum);
	
	
	//주문번호를 작성하기 위해 세션값 가져감.
	//주문번호를 8자리 숫자+문자로 함
	String orderNum = tempoNum;
	
	String msg = ""; // 내용 출력 할 것
	Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
	Enumeration<String> hCartKey = hCart.keys(); //값을 찾아서 hCartKey
	
	if(!hCart.isEmpty()){
		while(hCartKey.hasMoreElements()){
			// 장바구니에 있던 주문 객체
			ordersBean order = hCart.get(hCartKey.nextElement());
			menuBean bean = menuMgr.getmenuBean(shop, order.getMenu());
			//주문 처리
			oMgr.insertOrder(order, orderNum, addres, shop, numbers, req, payType);
			//장바구니 삭제
			cMgr.deleteCart(order);
		}
		msg = "주문이 완료 되었습니다.";
		// 주문후 table 비우기
		hCart.clear();
				
	}
	else{
		msg = "장바구니가 비어 있습니다.";
	}	
%>
 <script>
	 location.replace('../orderdetail/orderList.jsp');
</script> 