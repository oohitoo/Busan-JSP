<%@page import="java.util.Vector"%>
<%@page import="menu.menuBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String shop = request.getParameter("store");
	session.setAttribute("shop", shop);
	//세션값 받아오기
	String best = (String)session.getAttribute("best");
	String drink = (String)session.getAttribute("drink");
	String side = (String)session.getAttribute("side");
%>
<!-- 메뉴를 가져와야함 -->
<jsp:useBean id="menuMgr" class="menu.menuMgr" />

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
.sectiondropdown {
	background-color: #fff9;
	margin-bottom: 0 !important;
	padding: 10px;
	outline: none;
	font-size: 16px;
	color: #333;
	font-weight: 600;
	border: 1px solid #ccc;
	margin-top: 5px;
	border-radius: 4px;
}

#accordion {
	margin-top: 30px;
	margin-bottom: 30px;
	width: 700px; /* bar 크기 */
}

#accordion i {
	float: right;
	margin-right: 15px;
}

#accordion p {
	padding: 10px;
	margin: 0 !important;
}

#accordion div {
	background-color: #fff;
	margin-left: 50px;
}

h3 {
	margin-left: 50px;
}
</style>
<script>
	jQuery(function() {
		jQuery("#accordion").accordion({
			header : "h3",
			collapsible : true,
			active : false,
			heightStyle : "content",
			autoHeight : false
		});
	});
	jQuery('.sectiondropdown').click(function() {
		jQuery("i", this).toggleClass("fa-caret-up fa-caret-down");
	});
	
	function cartView(menu, info, price) {
		console.log(menu+ "/" + info+"/" + price);
		/* location.href = "privateShopProc.jsp?flag=insert"+"&menu="+menu; */
		location.href = "privateShopProc.jsp?menu="+menu+"&info="+info+"&price="+price+"&count="+1+"&flag=insert";
	}
	function reserve(){
		document.readFrm.submit();
	}
</script>
<div class="container">
	<div class="row">
		<table style="width: 700px; margin-left: 50px; margin-top: 50px;">
			<tr>
				<!-- 가게 이름 표시하는 곳 -->
				<td colspan="3"><h5 style="color:balck"><%= shop %></h5></td>
			</tr>
			<tr>
				<td rowspan="3" width="100px" height="100px">이미지</td>
				<td>최소 주문금액 13,000 원</td>
			</tr>
			<tr>
				<td>결제방식 : 카드, 현금</td>
			</tr>
			<tr>
				<td>평균 배달 시간 : 40분, 예약 : 0명</td>
			</tr>
			<tr>
				<td colspan="3">사장님 알림 메세지</td>
			</tr>
			<!-- 대표메뉴 -->
			<%
				Vector<menuBean> bestmenu = menuMgr.getMenu(shop, best);
			%>
			<tr>
				<td colspan="3">
					<div id="accordion">
						<h3 class="sectiondropdown">
							대표메뉴<i class="fa fa-caret-down" aria-hidden="true"></i>
						</h3>
						<!-- 대표메뉴 -->
						<div style="height: 100% !important;">
							<p>
							<table style="width: 600px; margin-left: 20px; margin-right: 30px;">
								<%
							for(int i = 0; i < bestmenu.size(); ++i){
								menuBean bestbean = bestmenu.get(i);
								String mImg = bestbean.getmImg(); // 메뉴 이미지
								String menu = bestbean.getMenu(); // 메뉴 이름
								String mInfo = bestbean.getmInfo(); // 메뉴 설명
								int mPrice = bestbean.getmPrice(); // 메뉴 가격
							%>
								<tr>
									<td><font color="black" size="4"> <a
											href="javascript:cartView('<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%= menu %></a>
									</font></td>
									<td rowspan="3" width="140px" height="130px" align="center">
										<% if(mImg == null){ %> <img src="../img/menuImg/ready.gif"
										alt="이미지 준비중" width="100px" height="100px"> <%}else{ %> <img
										src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px"
										height="100px"> <%} %>
									</td>
								</tr>
								<tr>
									<td><font color="#808080" size="3"><%= mInfo %></font></td>
								</tr>
								<tr>
									<td><font color="black" size="3"><li><%= mPrice %>
												원</li></font></td>
								</tr>
								<input type="hidden" id="menuName" value="<%= menu %>">
								<%}%>
							</table>
							</p>
						</div>
						<!-- 대표메뉴 종료 -->
						<% Vector<menuBean> drinkmenu = menuMgr.getMenu(shop, drink); %>
						<!-- 음류수 메뉴 -->
						<h3 class="sectiondropdown">
							음료 메뉴<i class="fa fa-caret-down" aria-hidden="true"></i>
						</h3>
						<div style="height: 100% !important;">
							<p><table style="width: 600px; margin-left: 20px; margin-right: 30px;">
								<%
					for(int i = 0; i < drinkmenu.size(); ++i){
						menuBean drinkbean = drinkmenu.get(i);
						String mImg = drinkbean.getmImg(); // 메뉴 이미지
						String menu = drinkbean.getMenu(); // 메뉴 이름
						String mInfo = drinkbean.getmInfo(); // 메뉴 설명
						int mPrice = drinkbean.getmPrice(); // 메뉴 가격
					%>
					<tr>
						<td>
							<font color="black" size="4">
								<a
											href="javascript:cartView('<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%= menu %></a>
							</font>
									</td>
						<td rowspan="3" width="140px" height="130px" align="center">
							<% if(mImg == null){ %>
								<img src="../img/menuImg/ready.gif" alt="이미지 준비중" width="100px"
										height="100px">
							<%}else{ %>
								<img src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px"
										height="100px">
							<%} %>
						</td>
					</tr>
					<tr>
						<td><font color="#808080" size="3"><%= mInfo %></font></td>
					</tr>
					<tr>
						<td><font color="black" size="3"><li><%= mPrice %> 원</li></font></td>
					</tr>
					<%}%>
				</table>
                        </p>
							
                      </div>
                      <!-- 음류수 메뉴 종료 -->	
                      <% Vector<menuBean> sidemenu = menuMgr.getMenu(shop, side); %>
                      <!-- 사이드 메뉴 -->
                      <h3 class="sectiondropdown">사이드 메뉴<i
								class="fa fa-caret-down" aria-hidden="true"></i>
						</h3>
                      <div style="height: 100% !important;">
                        <p>
		                       <table style="width: 600px; margin-left: 20px; margin-right: 30px;">
					<%
					for(int i = 0; i < sidemenu.size(); ++i){
						menuBean sidebean = sidemenu.get(i);
						String mImg = sidebean.getmImg(); // 메뉴 이미지
						String menu = sidebean.getMenu(); // 메뉴 이름
						String mInfo = sidebean.getmInfo(); // 메뉴 설명
						int mPrice = sidebean.getmPrice(); // 메뉴 가격
					%>
						<tr>
							<td>
								<font color="black" size="4">
									<a
											href="javascript:cartView('<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%= menu %></a>
								</font>
							</td>
							<td rowspan="3" width="140px" height="130px" align="center">
								<% if(mImg == null){ %>
									<img src="../img/menuImg/ready.gif" alt="이미지 준비중" width="100px"
										height="100px">
								<%}else{ %>
									<img src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px"
										height="100px">
								<%} %>
							</td>
						</tr>
						<tr>
							<td><font color="#808080" size="3"><%= mInfo %></font></td>
						</tr>
						<tr>
							<td><font color="black" size="3"><li><%= mPrice %> 원</li></font></td>
						</tr>
					<%}%>
				</table>
                        </p>
							
                      </div>
                      <!-- 사이드 메뉴 종료-->
                    </div>
				</td>
			</tr>
			
			<!-- 예약 배달 버튼 -->
			<tr>
				<td colspan="3">
					<table style="width: 600px; margin-left: 50px; margin-top: 50px;">
				<tr>
					<td width="300px" style="text-align: center;">
						<font color="black" size="5">
							<a href="javascript:reserve()">예약</a>
						</font>
					</td>
					<td width="300px" style="text-align: center;">
						<a href="../cart/cartView.jsp"><font color="black" size="5">배달</font></a>
					</td>
				</tr>
			</table>
			<form name="readFrm" action="../cart/reserve.jsp">										
					<input type="hidden" name="shop" value="<%= shop %>" />				
			</form>
				</td>
			</tr>
			<!-- 예약 배달 버튼  끝-->
		</table>
	</div>
</div>

<script src="https://use.fontawesome.com/9bc7fc2951.js"></script>
<script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"
	integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM="
	crossorigin="anonymous"></script>