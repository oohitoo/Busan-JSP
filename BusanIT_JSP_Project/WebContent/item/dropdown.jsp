<%@page import="java.util.Vector"%>
<%@page import="menu.menuBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String shop = request.getParameter("store");	
	//세션값 받아오기
	String best = (String)session.getAttribute("best");
	String drink = (String)session.getAttribute("drink");
	String side = (String)session.getAttribute("side");
%>
<!-- 메뉴를 가져와야함 -->
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
.sectiondropdown{
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
#accordion{
    margin-top: 30px;
    margin-bottom: 30px;
    width: 700px; /* bar 크기 */
}
#accordion i{
    float: right;
    margin-right: 15px;
}
#accordion p{
    padding: 10px;
    margin: 0 !important;
}
#accordion div{
    background-color: #fff;
    margin-left: 50px;
}
h3{
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
</script>
<div class="container">
	<div class="row">
		<div id="accordion" style="margin-left: 100px;">
			<table style="width: 700px; margin-left: 50px; margin-top: 50px;">
				<tr>
					<!-- 가게 이름 표시하는 곳 -->
					<td colspan="3"><h5><%= shop %></h5></td>
				</tr>
				<tr>
					<td rowspan="3" width="100px" height="100px">이미지</td>
					<td> 최소 주문금액 13,000 원</td>
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
			</table>
			<br>
			<%
				Vector<menuBean> bestmenu = menuMgr.getMenu(shop, best);
			%>
			<!-- 대표메뉴 -->
			<h3 class="sectiondropdown">
				대표메뉴<i class="fa fa-caret-down" aria-hidden="true"></i> <!--<i>내려가는 아이콘 모양임</i>  -->
			</h3>
			<div style="height: 30% !important;">
				<p>
					<table style="width: 600px; margin-left: 20px; margin-right: 30px;">
						<%
						for(int i = 0; i < bestmenu.size(); ++i){
							menuBean bestbean = bestmenu.get(i);
							String mImg = bestbean.getmImg(); // 메뉴 이미지
							String mName = bestbean.getmName(); // 메뉴 이름
							String mInfo = bestbean.getmInfo(); // 메뉴 설명
							int mPrice = bestbean.getmPrice(); // 메뉴 가격
						%>						
						<tr>
							<td>
								<font color="black" size="4">
									<a href="javascript:cartView('<%=mName%>','<%=mInfo%>','<%=mPrice%>')"><%= mName %></a>
								</font>
							</td>
							<td rowspan="3" width="140px" height="130px" align="center">
								<% if(mImg != null){ %>
									<img src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px" height="100px">
								<%}else{ %>
									<img src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px" height="100px">
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
			<!-- 대표메뉴 종료 -->
			<% Vector<menuBean> drinkmenu = menuMgr.getMenu(shop, drink); %>
			<!-- 음류수 메뉴 -->
			<h3 class="sectiondropdown">
				음류수<i class="fa fa-caret-down" aria-hidden="true"></i>
			</h3>
			<div style="height: 30% !important;">
				<table style="width: 600px; margin-left: 20px; margin-right: 30px;">
					<%
					for(int i = 0; i < drinkmenu.size(); ++i){
						menuBean drinkbean = drinkmenu.get(i);
						String mImg = drinkbean.getmImg(); // 메뉴 이미지
						String mName = drinkbean.getmName(); // 메뉴 이름
						String mInfo = drinkbean.getmInfo(); // 메뉴 설명
						int mPrice = drinkbean.getmPrice(); // 메뉴 가격
					%>
					<tr>
						<td>
							<font color="black" size="4">
								<a href="javascript:cartView('<%=mName%>','<%=mInfo%>','<%=mPrice%>')"><%= mName %></a>
							</font></td>
						<td rowspan="3" width="140px" height="130px" align="center">
							<% if(mImg != null){ %>
								<img src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px" height="100px">
							<%}else{ %>
								<img src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px" height="100px">
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
			</div>
			<!-- 음류수 메뉴 종료 -->
			<% Vector<menuBean> sidemenu = menuMgr.getMenu(shop, side); %>
			<h3 class="sectiondropdown">
				사이드메뉴<i class="fa fa-caret-down" aria-hidden="true"></i>
			</h3>
			<div style="height: 30% !important;">
				<table style="width: 600px; margin-left: 20px; margin-right: 30px;">
					<%
					for(int i = 0; i < sidemenu.size(); ++i){
						menuBean sidebean = sidemenu.get(i);
						String mImg = sidebean.getmImg(); // 메뉴 이미지
						String mName = sidebean.getmName(); // 메뉴 이름
						String mInfo = sidebean.getmInfo(); // 메뉴 설명
						int mPrice = sidebean.getmPrice(); // 메뉴 가격
					%>
						<tr>
							<td>
								<font color="black" size="4">
									<a href="javascript:cartView('<%=mName%>','<%=mInfo%>','<%=mPrice%>')"><%= mName %></a>
								</font>
							</td>
							<td rowspan="3" width="140px" height="130px" align="center">
								<% if(mImg != null){ %>
									<img src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px" height="100px">
								<%}else{ %>
									<img src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px" height="100px">
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
			</div>	
			<table style="width: 600px; margin-left: 50px; margin-top: 50px;">
				<tr>
					<td width="300px" style="text-align: center;">
						<font color="black" size="5">예약</font>
					</td>
					<td width="300px" style="text-align: center;">
						<font color="black" size="5">배달</font>
					</td>
				</tr>
			</table>
		</div>
		<!-- 드롭다운 닫힘 -->
	</div>
</div>
<script src="https://use.fontawesome.com/9bc7fc2951.js"></script>
<script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js" integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM=" crossorigin="anonymous"></script><%@page import="java.util.Vector"%>
