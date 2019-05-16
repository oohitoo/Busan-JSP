<%@page import="login.LoginBean"%>
<%@page import="menu.menuBean"%>
<%@page import="Service.UtilMgr"%>
<%@page import="java.util.Enumeration"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="menu.CartMgr"/>
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>
<jsp:useBean id="loginMgr" class="login.LoginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey"); 
	
	if(id == null){
		%>
		<script>
			alert("로그인 후 사용 바랍니다.");
			location.href ="login/login.html";
		</script>
		<%
	}
	int num = 1;
	
%>

<title>구매자 페이지</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet" href="../css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script>
	function creatUpdate(menu, num) {
		var count = document.getElementById("count" + num).value;
		console.log(count);
		location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=update&count="+count; 
	}
	function creatdelete(menu, num) {
		var count = document.getElementById("count" + num).value;
		location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=del&count="+count; 
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
			<%
				if(id == null){
			%>
			<div class="main">
				<div class="main_1 main_common">
					<a href="cartView.jsp">주문내역</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/member.html">회원가입</a>
				</div>
				<div class="main_3 main_common">
					<a href="login/login.html">로그인</a>
				</div>
			</div>
			<%
				}
					else{
			%>
				<div class="main_1 main_common">
					<a href="login/logout.jsp">로그아웃</a>
				</div>				
				<div class="main_1 main_common">
					<a href="cartView.jsp">장바구니</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/memberUpdate.jsp">회원정보수정</a>
				</div>
				<div class="main_3 main_common" style="width: 130px">
					<a href="#"><%=id%>님</a>
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
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="Index.jsp">
						<div class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-laugh-wink"></i>
						</div>
						<img src="../img/Logo_1.png" width="200px" height="50px" alt="Logo이미지"/>
					</a>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item">
						<a class="nav-link" href="../Index.html">
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
						<a class="nav-link" href="../item/itemList.jsp?menu=중식&nowPage=1">
							<span>중식</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemList.jsp?menu=한식&nowPage=1">
							<span>한식</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemList.jsp?menu=피자&nowPage=1">
							<span>피자</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemList.jsp?menu=치킨&nowPage=1">
							<span>치킨</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemList.jsp?menu=패스트푸드&nowPage=1">
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
						<a class="nav-link" href="Service/Service.jsp">
							<span>고객센터</span>
						</a>
					</li>	

					<!-- Divider -->
					<hr class="sidebar-divider">

				</ul>
				<!-- End of Sidebar -->
				<!-- 왼쪽 메뉴바 종료 -->
				<!-- 오른쪽 메인 부분 시작 -->
				
				<table border="1" style="margin-left: 100px; margin-top: 50px; width: 700px; color: black;" >
					<tr align="center">
						<td colspan="3" style="height: 100px">
							<span style="font-size: 2.0em; color: navy">주문자 정보</span>
						</td>
					</tr>

					<tr align="center" style="height: 30px">
						<td>
							<span style="color: black">주문목록 ( 주문가게 명 )</span>
						</td>
						<td width="130px">수량</td>
						<td width="150px">가격</td>
					</tr>
					<!-- 세션값 반복 돌리면 됨 -->
					<%
						int total = 0; //전체값
						Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
									
						if(hCart.isEmpty()){
					%>
							<td colspan="3" align="center"> 장바구니 목록이 없습니다.</td>
						<%
							}
										else{
											// 줄줄이 사탕 객체
											Enumeration<String> hCartKey = hCart.keys();
											// 요소 값이 더이상 있을때 까지
											while(hCartKey.hasMoreElements()){
												
												String shop = (String)session.getAttribute("store");
												//hCart에 저장된 주문 객체를 return 
												menu.ordersBean order = hCart.get(hCartKey.nextElement());
												String menuName = order.getmName();
												//상품 객체(상품 가격, 상품 이름)								
												menuBean bean = menuMgr.getmenuBean(shop, menuName);
												int price = bean.getmPrice();
												int count = order.getCount(); // 주문수량
												out.println(count);
												int subTotal = count * price; // 상품 총액
												total += subTotal;
						%>
						<tr>							
							<td rowspan="2"><%=menuName %> ( <%= shop %> )</td>
							<td align="center">
							<input type="text" id="count<%= num %>" size="3" value="<%= count %>"></td>
							<td rowspan="2" align="center"><%= price %> 원</td>
						</tr>
						<tr>
							<td align="center">
								<input type="button" value = "수정" size="3" onclick = "javascript:creatUpdate('<%= menuName%>', '<%= num%>')">
								<input type="button" value = "삭제" size="3" onclick = "javascript:creatdelete('<%= menuName%>', '<%= num%>')">
							</td>
						</tr>
						<tr>
						<% num++;} %>
							<td colspan="2" align="center">총 주문금액 : <%= UtilMgr.monFormat(total) %> 원</td>
							<td align="center">
								<a href="orderProc.jsp">주문하기</a>
							</td>
						</tr>
						<%
						}
					%>
					<!-- <tr>
						<td>주문목록들 ~~~~~~~~~~</td>
						<td width="50px">수량 ~~~~~~~~~~</td>
						<td width="150px"><center>30000</center></td>
					</tr> -->
					<!-- 세션값 반복 종료 구간 -->
					<% 
						LoginBean loginBean = loginMgr.getCustomer(id);
					%>
					<tr>
						<td colspan="3">
							<hr>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<table style="width: 700px; height: 150px; margin-left: 100px">
								<tr>
									<td width="50px">주소 :</td>
									<td colspan="2"><input type="text" name="addres" size="50" value="<%= loginBean.getcAddress()%>"></td>
								</tr>
								<tr>
									<td>전화번호 : </td>
									<td colspan="2"><input type="tel" name="numbers" size="50" value="<%= loginBean.getcPhone()%>"></td>
								</tr>
								<tr>
									<td>요청사항 : </td>
									<td colspan="2"><input type="text" name="numbers" size="50" placeholder="40자리 까지 작성 할 수 있어요"></td>
								</tr>
							</table>						
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<table style="width: 700px">
								<tr height="100px;">
									<td></td>
								</tr>
								<tr>
									<td align="center">
										<span style="font-size: 1.5em;">결제방식 :</span> &nbsp;&nbsp;&nbsp;&nbsp;
											<select name="payType" style="font-size: 1.2em;">
													<option>만나서 카드결제</option>
													<option>만나서 현금결제</option>
													<option>카드 결제</option>
													<option>무통장 입금</option>
											</select>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>	
			</div>
			<!-- 메인 부분 안에 버튼식 부분 종료 -->
		</div>
	</div>
	<!-- 오른쪽 메인 부분 종료 -->
</body>
<%-- 	
<%
	if (session.getAttribute("shopingList") == null) {
		out.println("없음");
	} else {
		ArrayList<String> list = (ArrayList) session.getAttribute("shopingList");
		for (int i = 1; i < list.size(); i++) {
			out.println(list.get(i));
			if (i % 3 == 0) {
				out.println("<br>");
			}
		}
	}
%> --%>