<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey"); 
%>
<title>구매자 페이지</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet" href="css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- 팝업 처리 하기 위함 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#close').click(function() {
			$('#pop').hide();
		});
	});
</script>

<body id="page-top">
	<!-- 상단 이미지 및 해더 이미지 -->
	<div class="container">
		<a href="Index.jsp">
			<img src="img/Logo_2.png" width="200px" height="200px" alt="Logo이미지"/>
		</a>
		<a href="Index.jsp">
			<img src="img/Logo_1.png" width="500px" height="150px" alt="Logo이미지" style="margin-left: 150px;margin-right: 50px;"/>
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
					<a href="cart/cartView.jsp">주문내역</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/member.html">회원가입</a>
				</div>
				<div class="main_3 main_common">
					<a href="login/login.jsp">로그인</a>
				</div>
			</div>
			<% } else{ %>
				<div class="main_1 main_common">
					<a href="login/logout.jsp">로그아웃</a>
				</div>				
				<div class="main_1 main_common">
					<a href="cart/cartView.jsp">장바구니</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/memberUpdate.jsp">회원정보수정</a>
				</div>
				<div class="main_3 main_common" style="width: 150px">
					<a href="login/memberUpdate.jsp"><%= id %>님</a>
				</div>
			<%}	%>
		</div>
	</div>
	<!-- 아이디 및 로그인 에 관련된 정보 종료 -->
	<!-- 가운데 부분 시작  -->
	<br>
	<hr>
	<div class="container">
		<div class="row">
			<div id="wrapper">
				<!-- 왼쪽 메뉴바 -->
				<ul	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="Index.jsp">
						<div class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-laugh-wink"></i>
						</div>
						<img src="img/Logo_1.png" width="200px" height="50px" alt="Logo이미지"/>
					</a>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item">
						<a class="nav-link" href="Index.jsp">
							<span>주문과 예약을 동시에 배달 家</span>
						</a>
					</li>
					<!-- 밑줄 -->
					<hr class="sidebar-divider">

					<!-- 메뉴 항목 -->
					<!-- Heading -->
					<div class="sidebar-heading">메뉴 항목</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=중식&nowPage=1">
							<span>중식</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=한식&nowPage=1">
							<span>한식</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=피자&nowPage=1">
							<span>피자</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=치킨&nowPage=1">
							<span>치킨</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=패스트푸드&nowPage=1">
							<span>패스트푸드</span>
						</a>
					</li>
					
					<!-- 밑줄 -->
					<hr class="sidebar-divider">
					
					<!-- 로그인 한 상태에서만 보여줄 메뉴 -->
					<% if(id == null){%>
					<li class="nav-item active">
						<a class="nav-link" href="Service/ServiceMain.jsp">
							<span>고객센터</span>
						</a>
					</li>
					<% }else{ %>
					<div class="sidebar-heading">내정보</div>
					
					<li class="nav-item active">
						<a class="nav-link" href="login/memberUpdate.jsp">
							<span>회원정보</span>
						</a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="review/reviewAll.jsp">
							<span>리뷰 관리</span>
						</a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="orderdetail/orderList.jsp">
							<span>주문 내역</span>
						</a>
					</li>	
					
					<li class="nav-item active">
						<a class="nav-link" href="orderdetail/reserveList.jsp">
							<span>예약 내역</span>
						</a>
					</li>
					<!-- 밑줄 -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item active">
						<a class="nav-link" href="Service/ServiceMain.jsp">
							<span>고객센터</span>
						</a>
					</li>						
					<hr class="sidebar-divider">
					<% } %>
					<!-- Divider -->
				</ul>
				<!-- 왼쪽 메뉴바 종료 -->
				<!-- 오른쪽 메인 부분 시작 -->
				<table style="margin-left: 150px; margin-top: 100px; width: 700px; height: 500px; text-align: center; border-spacing: 30px;">
					<tr>
						<td colspan="2"><h2 class="panel-title" style="color: #486CDA;"><strong>메뉴 목록</strong></h2></td>
					</tr>
					<tr>
						<td>
							<div class="alert alert-success" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=중식&nowPage=1">
								<h3>중식메뉴</h3>
								</a>
							</div>
						</td>
						<td>
							<div class="alert alert-dark" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=한식&nowPage=1">
								<h3>한식메뉴</h3>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="alert alert-danger" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=피자&nowPage=1">
								<h3>피자메뉴</h3>
								</a>
							</div>
						</td>
						<td>
							<div class="alert alert-warning" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=치킨&nowPage=1">
								<h3>치킨메뉴</h3>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="alert alert-info" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=패스트푸드&nowPage=1">
								<h3>패스트푸드</h3>
								</a>
							</div>							 
						</td>
					</tr>
				</table>				
			</div>
			<!-- 메인 부분 안에 버튼식 부분 종료 -->
		</div>
	</div>
	<!-- 오른쪽 메인 부분 종료 -->
	<div id ="pop" style=" z-index: 1">
		<div style="height: 370px;" >
			<img alt="이미지 없음" src="img/Logo_1.png" width="300px;">
			예약 및 배달을 함께 하는 배달家 입니다.<br>
			
			<p>예약시 주의사항</p><br>
				- 예약을 원할시 메뉴를 클릭하시지 마시고 예약하여 주시기 바랍니다.<br>
			배달시 주의사항<br>
				- 주문취소를 원할시 직접 가게에 연락하여 취소 하시기 바랍니다.<br>			
		</div>
		<div>
			<div id="close" style="width: 100px; margin: auto;">close</div>
		</div>
	</div>
</body>