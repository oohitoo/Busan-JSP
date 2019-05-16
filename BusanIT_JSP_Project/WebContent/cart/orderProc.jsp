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

	String msg = ""; // 내용 출력 할 것
	Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
	Enumeration<String> hCartKey = hCart.keys(); //값을 찾아서 hCartKey
	
	if(!hCart.isEmpty()){
		while(hCartKey.hasMoreElements()){
			// 장바구니에 있던 주문 객체
			ordersBean order = hCart.get(hCartKey.nextElement());
			//주문 처리
			out.print(order.getmName()); // 메뉴이름 가져와짐
			out.print(session.getAttribute("shop")); // 세션으로 가게 이름 가져옴
			out.print(session.getId().substring(session.getId().length()-5, session.getId().length())); // 세션값
			//주문번호는 mgr 가서 처리 (날짜 + 세션값 4자리), 
			
			//장바구니 삭제
			
		}
		msg = "주문이 완료 되었습니다.";
	}
	else{
		msg = "장바구니가 비어 있습니다.";
	}	
%>
<%-- <script>
	alert("<%= msg%>");
	location.href = 'orderList.jsp';
</script> --%>