<!-- 
	�׽�Ʈ��
	1. ����
	2. 190501 - MenuList �۾�
	3. ���� ��� ������������Ϸ�
 -->
<%@page import="MenuList.menu_listBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String menu = request.getParameter("menu");
%>
<jsp:useBean id="mgr" class="MenuList.menuMgr"/>
<%
	Vector<menu_listBean> list= mgr.menuSelect(menu);
%>

<!-- �޴� ��� �����ִ°� -->
<table border="1">
	<%
		if(list.isEmpty()){
			%>
			<tr>
				<td align="center"><br> �˻������ �����ϴ�.</td>
			</tr>
			<%
		}
		else{
			%>
			
			<%
			for(int i = 0; i < list.size(); ++i){
				menu_listBean bean = list.get(i);
				String StoreCond = bean.getStoreCond(); // ī�װ�
				String StoreName= bean.getStorename(); // ���Ը�
				String StoreAddrs1 = bean.getStoreaddr1(); //���θ��ּ�
				String tel = bean.getTel(); //��ȭ��ȣ
				String BestMenu = bean.getBestmenu();
			%>
			<tr>
				<td rowspan="3" width="150px" height="150px" align="center">�̹���</td>
				<td colspan="2" width="400px"><%= StoreName %></td>
			</tr>
			
			<tr>
				<td><%= StoreAddrs1 %></td>
				<td><%= tel %></td>
			</tr>
			
			<tr>
				<td colspan="2">��ǥ�޴� : <%= BestMenu %></td>
			</tr>
			<%
				}
			}
	%>
</table>
<!-- �޴� ��� ���� -->