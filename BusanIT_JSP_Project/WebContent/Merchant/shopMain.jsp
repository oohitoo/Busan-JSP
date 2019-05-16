<%@page import="orders.ordersBean"%>
<%@page import="shoplogin.loginBean"%>
<%@page import="java.util.Vector"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<jsp:useBean id="ordersMgr" class="orders.ordersMgr"/>
<jsp:setProperty property="*" name="oBean"/>
<%
	String businessName = (String) session.getAttribute("name");
	if(businessName==null){
		%>
		<script>
		alert("로그인을 해 주세요");
		location.href = "shopLogin.jsp";
		</script>
		<%
	}
%>
<head>
<meta charset="EUC-KR">
<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<title>판매자 페이지</title>
</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="shopMain.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					<!-- 앱 이름 -->
					<!-- logo Image -->
					<img src="../img/Logo_1.png" alt="logo이미지" width="220px" height="70px" style="padding: 10px;" href="shopMain.jsp">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="#" onclick="window.location.reload(true);"> 
			<!-- 클릭시 refresh --> <span>판매 상태</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- 배달 상태 -->
			<div class="sidebar-heading">배달 상태</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item active">
			<a class="nav-link"	href=""> 
			<span>배차 대기</span></a></li>

			<li class="nav-item active">
			<a class="nav-link"	href=""> 
			<span>배차 완료</span></a></li>

			<li class="nav-item active">
			<a class="nav-link"	href=""> 
			<span>배달 완료</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Heading -->
			<div class="sidebar-heading">관리자 페이지</div>

			<li class="nav-item active">
			<a class="nav-link"	href="shopMenuUpdate.jsp">
			<span>메뉴 수정</span></a></li>

			<li class="nav-item active">
			<a class="nav-link"	href="shopInfoUpdate.jsp">
			<span>정보 수정</span></a></li>

			<br/>
			<br/>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			<hr class="sidebar-divider d-none d-md-block">
			<!-- log out -->
			<li class="nav-item active">
			<a class="nav-link"	href="shopLogOut.jsp"> 
			<span>Log Out</span></a></li>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1></h1>
					<!-- 가게 이름 -->
					<h1 class="h3 mb-2 text-gray-800"><%= businessName %></h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">주문 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
									<thead style="text-align: center;">
										<tr>
											<th>번호</th>
											<th>배달상태</th>
											<th>경과시간</th>
											<th>주문메뉴</th>
											<th>주문수량</th>
											<th>픽업/배달</th>
											<th>고객 요청 사항</th>
										</tr>
									</thead>
									<tbody style="text-align: center;">
										<!--자동테이블 -->
										<tr>
										<%
											Vector<ordersBean> orderList = ordersMgr.orderList(businessName);
											int listSize = orderList.size(), no=0;
											if(orderList.isEmpty()){
												out.println("아직 주문이 없네요. 홍보를 조금 더 해볼까요?");
											}else{
												for(int i=0; i<orderList.size(); i++){
													if(i==orderList.size()) break;
													ordersBean oBean = orderList.get(i);
													int idx = oBean.getoNum();
													int count = oBean.getCount();
													String id = oBean.getId();
													String cNick = oBean.getcNick();
													String cAddress = oBean.getcAddress();
													String cPhone = oBean.getcPhone();
													String menu = oBean.getMenu();
													String oDate = oBean.getoDate();
													String oRequest = oBean.getoRequest();
													String orderType = oBean.getOrderType();
													String orderStatus = oBean.getOrderStatus();
													no++;
										
													//요청시간 String
													String reqDateStr = oDate;
													//현재시간 Date
													Date curDate = new Date();
													SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
													
													//요청시간을 Date로 parsing 후 time가져오기
													Date reqDate = dateFormat.parse(oDate);
													long reqDateTime = reqDate.getTime();
													//현재시간을 요청시간의 형태로 format 후 time 가져오기
													curDate = dateFormat.parse(dateFormat.format(curDate));
													long curDateTime = curDate.getTime();
													//분으로 표현
													long minute = (curDateTime - reqDateTime) / 60000;
																																						
										%>
												
													<td><%=no %></td>
													<td><%=orderStatus %></td><!-- 어케 변경? -->
													<td><%=minute + "분 경과"%></td>
													<td><%=menu %></td>
													<td><%=count %></td>
													<td><%=orderType %></td>
													<td style="text-align: left;">젓가락 낭낭하게 챙겨주세요</td>
												</tr>
												<%} //for%>
											<%} //if else%>
										<!-- 자동 테이블 -->
										
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
</body>
</html>