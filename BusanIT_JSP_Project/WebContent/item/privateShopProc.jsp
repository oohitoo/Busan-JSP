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
		String flag = request.getParameter("flag"); //����, ���� �Ǵ��� ���ؼ�
		String msg = ""; // �޼��� ������ ���ؼ� ����
		
		
		
		if(flag.equals("insert")){
			order.setrName(shop);
			order.setMenu(request.getParameter("menu"));
			order.setCount(Integer.parseInt(request.getParameter("count")));
			order.setId(id);
			
			cMgr.addCart(order);
			msg = "��ٱ��Ͽ� �߰��Ͽ����ϴ�.";
		}
		else if(flag.equals("update")){
			String[] counts = request.getParameterValues("count");
			String[] menus = request.getParameterValues("menu");
			for(int i=0; i <counts.length; i++){
				// ��µǴ��� Ȯ������.
				out.print(counts[i] + "/" + menus[i]); 
				order.setrName(shop);
				order.setMenu(menus[i]);
				order.setCount(Integer.parseInt(counts[i]));
				order.setId(id);
				cMgr.updateCart(order);
				msg = "��ٱ��Ͽ� �����Ͽ����ϴ�.";
			}
		}
		else if(flag.equals("del")){
			String[] counts = request.getParameterValues("count");
			String[] menus = request.getParameterValues("menu");
			for(int i=0; i <counts.length; i++){
				// ��µǴ��� Ȯ������.
				/* out.print(counts[i] + "/" + menus[i]); */
				order.setrName(shop);
				order.setMenu(menus[i]);
				order.setCount(Integer.parseInt(counts[i]));
				order.setId(id);
				cMgr.deleteCart(order);
				msg = "��ٱ��Ͽ� �����Ͽ����ϴ�.";
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
			msg = "��ٱ��Ͽ� �߰��Ͽ����ϴ�.";
		}
		else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg = "��ٱ��Ͽ� �����Ͽ����ϴ�.";
		}
		else if(flag.equals("del")){
			cMgr.deleteCart(order);
			msg = "��ٱ��Ͽ� �����Ͽ����ϴ�.";
		} */
	
%>
<%-- <script>
	alert("<%= msg %>");
	location.href = "../cart/cartView.jsp";
</script> --%>
<% } %>