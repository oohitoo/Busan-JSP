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

<body id="page-top">
	<!-- 상단 이미지 및 해더 이미지 -->
	<div class="container"><br>
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
					<a href="login/login.jsp">주문내역</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/member.html">회원가입</a>
				</div>
				<div class="main_3 main_common">
					<a href="login/login.html">로그인</a>
				</div>
			</div>
			<% }
				else{
			%>
				<div class="main_1 main_common">
					<a href="login/logout.jsp">로그아웃</a>
				</div>				
				<div class="main_1 main_common">
					<a href="#">장바구니</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/memberUpdate.jsp">회원정보수정</a>
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
						<a class="nav-link" href="Index.html">
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
						<a class="nav-link" href="tables.html">
							<span>치킨</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=패스트푸드&nowPage=1">
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
						<a class="nav-link" href="Service.jsp">
							<span>고객센터</span>
						</a>
					</li>	

					<!-- Divider -->
					<hr class="sidebar-divider">

				</ul>
				<!-- End of Sidebar -->
				<!-- 왼쪽 메뉴바 종료 -->
				<!-- 오른쪽 메인 부분 시작 -->
			<table
					style="margin-left: 150px; margin-top: 100px; width: 700px; height: 500px; text-align: center; border-spacing: 30px;">
					<tr>
						<td colspan="2"><h3 class="panel-title">메뉴 목록</h3></td>
					</tr>
					<tr>
						<td>
							<div class="alert alert-success" style="margin: 10px;">
								<h3>중식메뉴</h3>
							</div>
						</td>
						<td>
							<div class="alert alert-dark" style="margin: 10px;">
								<h3>한식메뉴</h3>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="alert alert-danger" style="margin: 10px;">
								<h3>피자메뉴</h3>
							</div>
						</td>
						<td>
							<div class="alert alert-warning" style="margin: 10px;">
								<h3>치킨메뉴</h3>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="alert alert-info" style="margin: 10px;">
								<h3>패스트푸드</h3>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<!-- 메인 부분 안에 버튼식 부분 종료 -->
		</div>
	</div>
	<!-- 오른쪽 메인 부분 종료 -->
</body>
