<%@page import="menu.menuBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	/* 세션 설정 */
	session.setAttribute("best", "대표메뉴");
	session.setAttribute("drink", "음류수");
	session.setAttribute("side", "사이드메뉴");
	
	// 앞에서 가게 이름 받아왔음
	String shopName = request.getParameter("store");
	session.setAttribute("store", shopName);
%>
<!-- 메뉴 검색 하러 가즈아~ -->
<jsp:useBean id="mgr" class="menu.menuMgr" />
<%
	Vector<menuBean> vlist = mgr.menuSelect(shopName);
	for(int i = 0; i < vlist.size(); ++i){
		menuBean bean = vlist.get(i);
		String shopname = bean.getrName();
		String shopmenuname = bean.getrName();
		int menuPrice = bean.getmPrice();
		String menuInfo = bean.getrName();
		String mImage = bean.getrName();
		////d여기
	}
%>
<!-- desienForm 디자인 폼 -->
<jsp:include page="designForm.jsp" />
<!-- 가게 상세 페이지 -->
<jsp:include page="dropdown.jsp" />

