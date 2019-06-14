<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="MenuList.menu_listBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	String menu = request.getParameter("menu");
%>
<jsp:useBean id="mgr" class="MenuList.menuMgr"/>
<%
	//페이징 & 블럭처리 시작
	int totalsize = mgr.getStoreTotalList(menu); // 총 게시물 수 
	int numPerpage = 7; //한 페이지에 보여줄 개수
	int pagePerBlock = 10; // 밑에 [1][2][3].. 이거 총 10개
	int totalPage = 0; //총 페이지 수
	int totalBlock = 0;
	int nowpage = 1; // 현재 페이지
	int nowBlock = 1; //현재 블럭
	
	// Limit 에 들어가는 숫자임 
	int start = 0; // 시작번호
	int end = numPerpage; //끝 번호
	// Limit 에 들어가는 숫자임 끝 
	
	// nowpage가 없으면 0으로 설정 
	nowpage = Integer.parseInt(request.getParameter("nowPage"));
		
	start = (nowpage * numPerpage) - numPerpage;
	// 총 페이지
	totalPage = (int)Math.ceil((double)totalsize / numPerpage);
	// 총 블럭 수
	totalBlock = (int) Math.ceil((double)totalPage / pagePerBlock);
	// 현재 블럭을 구할때
	nowBlock = (int) Math.ceil((double)nowpage / pagePerBlock);
	// 현재 총 게시물 : ?개, 총 페이지 수 : ?개
	//out.println("총 게시물 수" + totalsize + " 총 페이지수" + totalPage + "현재 블럭" + nowBlock);
	//페이징 & 블럭처리 종료	
%>
<jsp:include page="designForm.jsp" />

<script type="text/javascript">
	function paging(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(block) {
		document.readFrm.nowPage.value = <%= pagePerBlock %> * (block-1) + 1;
		document.readFrm.submit();
	}
	function storeInfo(store) {
		location.href = "privateShop.jsp?store="+store;
	}	
</script>
			<%// 반환된 게시물 을 벡터로 저장
				Vector<menu_listBean> list = mgr.ShopSelect(menu, start, end);
				int listSize = list.size();
				if(list.isEmpty()){%>
					<table style="margin-left: 100px; width: 700px;">
						<tr>
							<td align="center"><br> 검색결과가 없습니다.</td>
						</tr>
					
						<tr height="100px">
							<td colspan="3" style="text-align: center"><span>Copyright Your Website 2019</span></td>
						</tr>
					</table>
				<%}else{%>
					<table style="margin-left: 150px;">
					<tr style="height: 70px;">
						<td colspan="3" style="text-align: center;">
							<h3 style="color:#486CDA">
								<strong><%= menu %></strong>
							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="3">총 가게 수 : <%=totalsize%> 개 
							(<font color="red"><%=nowpage + "/" + totalPage%></font>)
						</td>
					</tr>
					<tr style="height: 50px;">
						<td></td>
						<td ></td>
						<td ></td>
					</tr>
					<% for(int i = 0; i < list.size(); ++i){
							menu_listBean bean = list.get(i);
							/* String StoreCond = bean.getStoreCond(); // 카테고리 */
							String StoreImage = bean.getRestImg(); // 가게 대표 이미지
							String StoreName= bean.getStorename(); // 가게명
							String StoreAddrs1 = bean.getStoreaddr1(); //도로명주소
							String tel = bean.getTel(); //전화번호
							String BestMenu = bean.getBestmenu();
					%>
					<tr>
						<td rowspan="3" width="140px" height="130px" align="center">
							<% if(StoreImage == null){%>
								<img alt="이미지준비중" width="100px" height="100px" src="../img/menuImg/ready.gif">
							<%}else{%>
								<img alt="이미지준비중" width="100px" height="100px" src="../img/storeImage/<%=StoreImage%>">
							<%}%>
						</td>
						<td colspan="2">
							<a href="javascript:storeInfo('<%= StoreName %>')"><%= StoreName %></a>
						</td>
					</tr>

					<tr style="color:black">
						<td><%= StoreAddrs1 %></td>
						<td align="center" style="width:132px;"><%= tel %></td>
					</tr>

					<tr>
						<td colspan="2">대표메뉴 : <%= BestMenu %></td>
					</tr>
					<%}%>					
					<tr>
						<td colspan="3" style="text-align: center">
							<%
							// 페이징에 표시될 시작변수 및 마지막 변수
							int pageStart = (nowBlock - 1) * pagePerBlock + 1;
							int pageEnd = ((pageStart+pagePerBlock)<=totalPage)?(pageStart+pagePerBlock):totalPage+1;
							if (totalPage != 0) {%>
							
							<!-- 이전블럭 -->
							<% if (nowBlock > 1) { %>
								<a href="javascript:block(<%= nowBlock-1%>)">이전</a> <%} %>
							<!-- 페이징 -->
							<% for (; pageStart<pageEnd;pageStart++) { %> 
								<a href="javascript:paging(<%= pageStart %>)">
							<% if (nowpage == pageStart) { %> <font color="red"> <%} %>
								[<%= pageStart %>]
								</a>
							<% if(nowpage == pageStart) {%> </font> <%} %>
							<% } %>&nbsp;
							
							<!-- 다음블럭 -->
							<% if (totalBlock > nowBlock) { %>
								<a href="javascript:block(<%= nowBlock + 1%>)">...next</a>
							<%} %>
						<% } %>
						</td>
					</tr>
					
					<tr height="100px">
					</tr>
					
					<tr height="100px">
						<td colspan="3" style="text-align: center"><span>Copyright &copy; Your Website 2019</span></td>
					</tr>
					
					<%}%>
				</table>
				
				<form name="readFrm">
					<input type="hidden" name="totalsize" value="<%= totalsize %>" />
					<input type="hidden" name="nowPage" value="<%= nowpage %>" />					
					<input type="hidden" name="menu" value="<%= menu %>" />				
				</form>
				<p/>
	<!-- 오른쪽 메인 부분 종료 -->
</body>
