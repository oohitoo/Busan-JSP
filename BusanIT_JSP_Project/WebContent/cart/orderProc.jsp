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
	
	/* 가져와보자 */
	String shop = (String)session.getAttribute("shop"); // 가게 이름
	String addres = request.getParameter("addres"); // 작성한 주소
	String numbers = request.getParameter("phoneNumber"); // 핸드폰 번호
	String req = request.getParameter("request"); //요청 사항
	String payType = request.getParameter("selectBox"); // 결제 타입
	
	//주문번호를 작성하기 위해 세션값 가져감.
	String orderNum = session.getId().substring(session.getId().length()-5, session.getId().length());
	
	String msg = ""; // 내용 출력 할 것
	Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
	Enumeration<String> hCartKey = hCart.keys(); //값을 찾아서 hCartKey
	
	if(!hCart.isEmpty()){
		while(hCartKey.hasMoreElements()){
			// 장바구니에 있던 주문 객체
			ordersBean order = hCart.get(hCartKey.nextElement());
			menuBean bean = menuMgr.getmenuBean(shop, order.getmName());
			//주문 처리
			oMgr.insertOrder(order, orderNum, addres, shop, numbers, req, payType);
			//장바구니 삭제
			cMgr.deleteCart(order);
/* 			out.print(addres + "<br>");
			out.print(order.getmName()+ "<br>"); // 메뉴이름 가져와짐
			out.print(session.getId().substring(session.getId().length()-5, session.getId().length())+"<br>"); // 세션값 */
			//주문번호는 mgr 가서 처리 (날짜 + 세션값 4자리), 회원정보(id, 닉네임,주소), 가게 이름, 번호, 주문수량, 요청사항, 결제방식(만카,만현), status
			
			/* DB가서 할 것
				1. 날짜 + 세션값 4자리
				2. status
				1. 회원 (id, 닉네임, 주소) [시도해보자]
			   Proc에서 할 것			    
			    - 2. 가게이름
			    - 3. 번호
			    - 4. 주문수량
			    - 5. 요청사항
			    - 6. 결제방식
			    - 7. order 넘기면 됨
			    - 8. 세션 값 5자리 
			*/
			
			/* LoginBean loginBean = loginMgr.getCustomer(id); */
			
			//장바구니 삭제
			
		}
		msg = "주문이 완료 되었습니다.";
	}
	else{
		msg = "장바구니가 비어 있습니다.";
	}	
%>
<script>
	alert("<%= msg%>");
	location.href = 'orderList.jsp';
</script>