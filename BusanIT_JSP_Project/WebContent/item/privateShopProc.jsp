<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="menu.CartMgr"/>
<jsp:useBean id="order" class="menu.ordersBean" />
<jsp:setProperty property="*" name="order"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	String shop = (String)session.getAttribute("shop");
	if(id == null){
		response.sendRedirect("../login/login.html");
	}
	else{
		String flag = request.getParameter("flag"); //수정, 삭제 판단을 위해서
		String msg = ""; // 메세지 보내기 위해서 만듬
		
		
		
		if(flag.equals("insert")){
			order.setrName(shop);
			order.setMenu(request.getParameter("menu"));
			order.setCount(Integer.parseInt(request.getParameter("count")));
			order.setId(id);
			
			cMgr.addCart(order);
			msg = "장바구니에 추가하였습니다.";
		}
		else if(flag.equals("update")){
			String[] counts = request.getParameterValues("count");
			String[] menus = request.getParameterValues("menu");
			for(int i=0; i <counts.length; i++){
				// 출력되는지 확인했음.
				out.print(counts[i] + "/" + menus[i]); 
				order.setrName(shop);
				order.setMenu(menus[i]);
				order.setCount(Integer.parseInt(counts[i]));
				order.setId(id);
				cMgr.updateCart(order);
				msg = "장바구니에 수정하였습니다.";
			}
		}
		else if(flag.equals("del")){
			String[] counts = request.getParameterValues("count");
			String[] menus = request.getParameterValues("menu");
			for(int i=0; i <counts.length; i++){
				// 출력되는지 확인했음.
				/* out.print(counts[i] + "/" + menus[i]); */
				order.setrName(shop);
				order.setMenu(menus[i]);
				order.setCount(Integer.parseInt(counts[i]));
				order.setId(id);
				cMgr.deleteCart(order);
				msg = "장바구니에 삭제하였습니다.";
			}
		}
		
		/* String flag = request.getParameter("flag");
		String msg = "";
		order.setrName(shop);
		order.setMenu(request.getParameter("menu"));
		order.setCount(Integer.parseInt(request.getParameter("count")));
		order.setId(id);
		if(flag.equals("insert")){
			cMgr.addCart(order);
			msg = "장바구니에 추가하였습니다.";
		}
		else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg = "장바구니에 수정하였습니다.";
		}
		else if(flag.equals("del")){
			cMgr.deleteCart(order);
			msg = "장바구니에 삭제하였습니다.";
		} */
	
%>
<%-- <script>
	alert("<%= msg %>");
	location.href = "../cart/cartView.jsp";
</script> --%>
<% } %>