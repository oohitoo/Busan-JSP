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

<title>구매자 페이지</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet" href="../css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

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

<body id="page-top">
	<!-- 상단 이미지 및 해더 이미지 -->
	<div class="container"><br>
		<a href="../Index.jsp">
			<img src="../img/Logo_2.png" width="200px" height="200px" alt="Logo이미지"/>
		</a>
		<a href="../Index.jsp">
			<img src="../img/Logo_1.png" width="500px" height="150px" alt="Logo이미지" style="margin-left: 150px;margin-right: 50px;"/>
		</a>
	</div>
	<!-- 상단 이미지 및 헤더 종료 -->
	<hr>
	<!-- 아이디 및 로그인 에 관련된 정보 -->
	<div class="container">
		<div class="Maincontainer">
			<% if(id == null){ %>
			<div class="main">
				<div class="main_1 main_common">
					<a href="../cart/cartView.jsp">주문내역</a>
				</div>
				<div class="main_2 main_common">
					<a href="../login/member.html">회원가입</a>
				</div>
				<div class="main_3 main_common">
					<a href="../login/login.html">로그인</a>
				</div>
			</div>
			<% }
				else{
			%>
				<div class="main_1 main_common">
					<a href="../login/logout.jsp">로그아웃</a>
				</div>				
				<div class="main_1 main_common">
					<a href="../cart/cartView.jsp">장바구니</a>
				</div>
				<div class="main_2 main_common">
					<a href="../login/memberUpdate.jsp">회원정보수정</a>
				</div>
				<div class="main_3 main_common" style="width: 130px">
					<a href="#"><%= id %>님</a>
				</div>
			<%
				}
			%>
		</div>
	</div>
	<!-- 아이디 및 로그인 에 관련된 정보 종료 -->
	<!-- 가운데 부분 시작  -->
	<br>
	<hr>
	<div class="container">
		<div class="row">
			<!-- Page Wrapper -->
			<div id="wrapper">
				<!-- Sidebar -->
				<ul	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
					<!-- Sidebar - Brand -->
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="../Index.jsp">
						<div class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-laugh-wink"></i>
						</div>
						<img src="../img/Logo_1.png" width="200px" height="50px" alt="Logo이미지"/>
					</a>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item">
						<a class="nav-link" href="../Index.jsp">
							<span>판매 상태</span>
						</a>
					</li>

					<!-- Divider -->
					<hr class="sidebar-divider">

					<!-- 조리 상태 -->
					<!-- Heading -->
					<div class="sidebar-heading">메뉴 항목</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<!-- <a class="nav-link" href="item/itemList.jsp?menu=중식&nowPage=1"> -->
						<a class="nav-link" href="itemList.jsp?menu=중식&nowPage=1">
							<span>중식</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemList.jsp?menu=한식&nowPage=1">
							<span>한식</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemList.jsp?menu=피자&nowPage=1">
							<span>피자</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemList.jsp?menu=치킨&nowPage=1">
							<span>치킨</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemList.jsp?menu=패스트푸드&nowPage=1">
							<span>패스트푸드</span>
						</a>
					</li>
					
					<!-- Divider -->
					<hr class="sidebar-divider">
					
					<!-- Heading -->
					<div class="sidebar-heading">내정보</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>회원정보</span>
						</a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>나의 리뷰 관리</span>
						</a>
					</li>	
					
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>고객센터</span>
						</a>
					</li>	

					<!-- Divider -->
					<hr class="sidebar-divider">

				</ul>
				<!-- End of Sidebar -->
				<!-- 왼쪽 메뉴바 종료 -->
				<!-- 오른쪽 메인 부분 시작 -->
				
				
				<%
				// 반환된 게시물 을 벡터로 저장
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
						<td colspan="3" style="text-align: center;"><h3><%= menu %></h3></td>
					</tr>
					<tr>
						<td colspan="3">총 가게 수 : <%=totalsize%> 개 
							(<font color="red"><%=nowpage + "/" + totalPage%></font>)
						</td>
					</tr>
					<tr style="height: 50px;">
						<td></td>
						<td style="text-align: right;">거리순</td>
						<td style="text-align: right;">평점순</td>
					</tr>
					<%
						for(int i = 0; i < list.size(); ++i){
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
							<% if(StoreImage != null){%>
							<img alt="이미지준비중" width="100px" height="100px" src="../img/storeImage/<%=StoreImage%>">
							<%}else{%>
								<img alt="이미지준비중" width="100px" height="100px" src="../img/storeImage/<%=StoreImage%>">
							<%}%>
						</td>
						<td colspan="2"><a href="javascript:storeInfo('<%= StoreName %>')"><%= StoreName %></a></td>
					</tr>

					<tr>
						<td><%= StoreAddrs1 %></td>
						<td align="center"><%= tel %></td>
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
							if (totalPage != 0) {
							%>
							
							<!-- 이전블럭 -->
							<% if (nowBlock > 1) { %>
								<a href="javascript:block(<%= nowBlock-1%>)">이전</a> <%} %>
							<!-- 페이징 -->
							<%
								for (; pageStart<pageEnd;pageStart++) {
							%> 
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
					<input type="hidden" name="totalsize" value="<%= totalsize%>" />
					<input type="hidden" name="nowPage" value="<%= nowpage%>" />					
					<input type="hidden" name="menu" value="<%= menu %>" />				
				</form>
				<p />
				
			</div>
			<!-- 메인 부분 안에 버튼식 부분 종료 -->
		</div>
	</div>
	<!-- 오른쪽 메인 부분 종료 -->
</body>
