<%@page import="menu.menuBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	/* ���� ���� */
	session.setAttribute("best", "��ǥ�޴�");
	session.setAttribute("drink", "������");
	session.setAttribute("side", "���̵�޴�");
	
	// �տ��� ���� �̸� �޾ƿ���
	String shopName = request.getParameter("store");
	session.setAttribute("store", shopName);
%>
<!-- �޴� �˻� �Ϸ� �����~ -->
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
		////d����
	}
%>
<!-- desienForm ������ �� -->
<jsp:include page="designForm.jsp" />
<!-- ���� �� ������ -->
<jsp:include page="dropdown.jsp" />

