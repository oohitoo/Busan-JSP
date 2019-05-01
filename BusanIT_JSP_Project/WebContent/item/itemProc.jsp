<!-- 
	테스트용
	1. 팀장
	2. 190501 - MenuList 작업
	3. 현재 목록 가져오기까지완료
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

<!-- 메뉴 목록 보여주는곳 -->
<table border="1">
	<%
		if(list.isEmpty()){
			%>
			<tr>
				<td align="center"><br> 검색결과가 없습니다.</td>
			</tr>
			<%
		}
		else{
			%>
			
			<%
			for(int i = 0; i < list.size(); ++i){
				menu_listBean bean = list.get(i);
				String StoreCond = bean.getStoreCond(); // 카테고리
				String StoreName= bean.getStorename(); // 가게명
				String StoreAddrs1 = bean.getStoreaddr1(); //도로명주소
				String tel = bean.getTel(); //전화번호
				String BestMenu = bean.getBestmenu();
			%>
			<tr>
				<td rowspan="3" width="150px" height="150px" align="center">이미지</td>
				<td colspan="2" width="400px"><%= StoreName %></td>
			</tr>
			
			<tr>
				<td><%= StoreAddrs1 %></td>
				<td><%= tel %></td>
			</tr>
			
			<tr>
				<td colspan="2">대표메뉴 : <%= BestMenu %></td>
			</tr>
			<%
				}
			}
	%>
</table>
<!-- 메뉴 목록 종료 -->