<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="java.util.Vector"%>
<%@page import="menu.menuBean"%>
<%@page import="review.reviewMgr"%>
<%@page import="review.reviewBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />
<%
	request.setCharacterEncoding("EUC-KR");
	String shop = request.getParameter("store");
	session.setAttribute("shop", shop);
	//세션값 받아오기
	String best = (String) session.getAttribute("best");
	String drink = (String) session.getAttribute("drink");
	String side = (String) session.getAttribute("side");

	/* 리뷰단 */
	int totalRecord = 0; //총 게시물 수
	int numPerPage = 5; //페이지당 레코드 수 5,10,15,30
	int pagePerBlock = 15; //블럭당 페이지 수
	int totalPage = 0; //총 페이지 수=(올림)총게시물수 / 페이지당 레코드 수		
	int totalBlock = 0; //총 블럭 수=(올림) 총 페이지수 / 블럭당 페이지수 
	int nowPage = 1; //현재 페이지
	int nowBlock = 1; //현재 블럭

	int num = 0;
	String id = null;
	String subject = null;
	String content = null;
	String regdate = null;

	//한페이지에 보여질 게시물 갯수
	if (request.getParameter("numPerPage") != null && !request.getParameter("numPerPage").equals("null")) {
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	}

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);

	/* 리뷰종료 */
%>
<!-- 메뉴를 가져와야함 -->
<jsp:useBean id="menuMgr" class="menu.menuMgr" />

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<%-- <!-- 리뷰단  -->
<link href="style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

BootStrap CDN
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> --%>

<!-- 리뷰 종료 -->

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
<script type="text/javascript">
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
	
	function cartView(rName,menu, info, price) {
		console.log(menu+ "/" + info+"/" + price);
		/* location.href = "privateShopProc.jsp?flag=insert"+"&menu="+menu; */
		location.href = "privateShopProc.jsp?rName="+rName+"&menu="+menu+"&info="+info+"&price="+price+"&count="+1+"&flag=insert";
	}

	
	/* 리뷰단 */
		function pageing(page){
			document.readFrm.nowPage.value=page;
			document.readFrm.submit();
		}

		function block(block){
			document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
			document.readFrm.submit();
			}
		function numPerFn(numPerPage){
			document.readFrm.numPerPage.value=numPerPage;
			document.readFrm.submit();
			
		}
		function reviewInsert(){
			document.insert.action="insertreview.jsp";
			document.insert.submit();
			
		}	
		function reviewDelete(number){
			location.href ="reviewDelete.jsp?rnum="+number;
			
		}
		function reviewRead(){
			document.read.action="reviewRead.jsp";
			document.read.submit();
			
		}
	
	/* 리뷰 종료 */
</script>
<div class="container">
	<div class="row">
		<table style="width: 700px; margin-left: 50px; margin-top: 50px;">
			<tr>
				<!-- 가게 이름 표시하는 곳 -->
				<td colspan="3"><h5 style="color: balck"><%=shop%></h5></td>
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
							<table
								style="width: 600px; margin-left: 20px; margin-right: 30px;">
								<%
									for (int i = 0; i < bestmenu.size(); ++i) {
										menuBean bestbean = bestmenu.get(i);
										String mImg = bestbean.getmImg(); // 메뉴 이미지
										String menu = bestbean.getMenu(); // 메뉴 이름
										String mInfo = bestbean.getmInfo(); // 메뉴 설명
										int mPrice = bestbean.getmPrice(); // 메뉴 가격
								%>
								<tr>
									<td><font color="black" size="4"> <a
											href="javascript:cartView('<%=shop %>','<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%=menu%></a>
									</font></td>
									<td rowspan="3" width="140px" height="130px" align="center">
										<%
											if (mImg == null) {
										%> <img src="../img/menuImg/ready.gif"
										alt="이미지 준비중" width="100px" height="100px"> <%
 	} else {
 %> <img
										src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px"
										height="100px"> <%
 	}
 %>
									</td>
								</tr>
								<tr>
									<td><font color="#808080" size="3"><%=mInfo%></font></td>
								</tr>
								<tr>
									<td><font color="black" size="3"><li><%=mPrice%>
												원</li></font></td>
								</tr>
								<input type="hidden" id="menuName" value="<%=menu%>">
								<%
									}
								%>
							</table>
							</p>
						</div>
						<!-- 대표메뉴 종료 -->
						<%
							Vector<menuBean> drinkmenu = menuMgr.getMenu(shop, drink);
						%>
						<!-- 음류수 메뉴 -->
						<h3 class="sectiondropdown">
							음료 메뉴<i class="fa fa-caret-down" aria-hidden="true"></i>
						</h3>
						<div style="height: 100% !important;">
							<p>
							<table
								style="width: 600px; margin-left: 20px; margin-right: 30px;">
								<%
									for (int i = 0; i < drinkmenu.size(); ++i) {
										menuBean drinkbean = drinkmenu.get(i);
										String mImg = drinkbean.getmImg(); // 메뉴 이미지
										String menu = drinkbean.getMenu(); // 메뉴 이름
										String mInfo = drinkbean.getmInfo(); // 메뉴 설명
										int mPrice = drinkbean.getmPrice(); // 메뉴 가격
								%>
								<tr>
									<td><font color="black" size="4"> <a
											href="javascript:cartView('<%=shop %>','<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%=menu%></a>
									</font></td>
									<td rowspan="3" width="140px" height="130px" align="center">
										<%
											if (mImg == null) {
										%> <img src="../img/menuImg/ready.gif"
										alt="이미지 준비중" width="100px" height="100px"> <%
 	} else {
 %> <img
										src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px"
										height="100px"> <%
 	}
 %>
									</td>
								</tr>
								<tr>
									<td><font color="#808080" size="3"><%=mInfo%></font></td>
								</tr>
								<tr>
									<td><font color="black" size="3"><li><%=mPrice%>
												원</li></font></td>
								</tr>
								<%
									}
								%>
							</table>
							</p>

						</div>
						<!-- 음류수 메뉴 종료 -->
						<%
							Vector<menuBean> sidemenu = menuMgr.getMenu(shop, side);
						%>
						<!-- 사이드 메뉴 -->
						<h3 class="sectiondropdown">
							사이드 메뉴<i class="fa fa-caret-down" aria-hidden="true"></i>
						</h3>
						<div style="height: 100% !important;">
							<p>
							<table
								style="width: 600px; margin-left: 20px; margin-right: 30px;">
								<%
									for (int i = 0; i < sidemenu.size(); ++i) {
										
										menuBean sidebean = sidemenu.get(i);
										String mImg = sidebean.getmImg(); // 메뉴 이미지
										String menu = sidebean.getMenu(); // 메뉴 이름
										String mInfo = sidebean.getmInfo(); // 메뉴 설명
										int mPrice = sidebean.getmPrice(); // 메뉴 가격
								%>
								<tr>
									<td><font color="black" size="4"> <a
											href="javascript:cartView('<%=shop %>','<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%=menu%></a>
									</font></td>
									<td rowspan="3" width="140px" height="130px" align="center">
										<%
											if (mImg == null) {
										%> <img src="../img/menuImg/ready.gif"
										alt="이미지 준비중" width="100px" height="100px"> <%
 	} else {
 %> <img
										src="../img/menuImg/<%=mImg%>" alt="이미지 준비중" width="100px"
										height="100px"> <%
 	}
 %>
									</td>
								</tr>
								<tr>
									<td><font color="#808080" size="3"><%=mInfo%></font></td>
								</tr>
								<tr>
									<td><font color="black" size="3"><li><%=mPrice%>
												원</li></font></td>
								</tr>
								<%
									}
								%>
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
								<font color="white"><a href="../cart/reserve.jsp" class="btn btn-primary"> 예약</a></font>
							</td>
							<td width="300px" style="text-align: center;">
								<a href="../cart/cartView.jsp" class="btn btn-primary"> 배달</a>
							</td>
						</tr>
					</table>
				
				</td>
			</tr>
			<!-- 예약 배달 버튼  끝-->
			<tr>

				<!-- 대표메뉴 -->
			<tr>
				<td colspan="3">
						<jsp:include page="../review/review.jsp" />
				</td>
			</tr>
		</table>
	</div>
</div>

<script src="https://use.fontawesome.com/9bc7fc2951.js"></script>
<script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"
	integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM="
	crossorigin="anonymous"></script>