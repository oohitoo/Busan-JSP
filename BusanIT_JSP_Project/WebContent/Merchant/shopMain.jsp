<%@page import="orders.ordersBean"%>
<%@page import="shoplogin.loginBean"%>
<%@page import="java.util.Vector"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="mgr" class="shoplogin.loginMgr" />
<jsp:useBean id="ordersMgr" class="orders.ordersMgr" />
<jsp:setProperty property="*" name="oBean" />
<%
	String businessName = (String) session.getAttribute("name");
	if(businessName==null){
		%>
<script>
	alert("로그인을 해 주세요");
	location.href = "shopLogin.jsp";
</script>
<%}%>
<head>
<meta charset="EUC-KR">
<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script>
function updateOrderStatus(orderStatus , oNum){
	location.href="shopOrderStatusProc.jsp?orderStatus="+orderStatus+"&oNum="+oNum;	
}
</script>
<title>판매자 페이지</title>
</head>
<style>
@import('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.0/css/bootstrap.min.css') 

.funkyradio div {
  clear: both;
  overflow: hidden;
}

.funkyradio label {
  width: 100%;
  border-radius: 3px;
  border: 1px solid #D1D3D4;
  font-weight: normal;
}

.funkyradio input[type="radio"]:empty,
.funkyradio input[type="checkbox"]:empty {
  display: none;
}

.funkyradio input[type="radio"]:empty ~ label,
.funkyradio input[type="checkbox"]:empty ~ label {
  position: relative;
  line-height: 2.5em;
  text-indent: 3.25em;
  margin-top: 2em;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}

.funkyradio input[type="radio"]:empty ~ label:before,
.funkyradio input[type="checkbox"]:empty ~ label:before {
  position: absolute;
  display: block;
  top: 0;
  bottom: 0;
  left: 0;
  content: '';
  width: 2.5em;
  background: #D1D3D4;
  border-radius: 3px 0 0 3px;
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label,
.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label {
  color: #888;
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label:before,
.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #C2C2C2;
}

.funkyradio input[type="radio"]:checked ~ label,
.funkyradio input[type="checkbox"]:checked ~ label {
  color: #777;
}

.funkyradio input[type="radio"]:checked ~ label:before,
.funkyradio input[type="checkbox"]:checked ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #333;
  background-color: #ccc;
}

.funkyradio input[type="radio"]:focus ~ label:before,
.funkyradio input[type="checkbox"]:focus ~ label:before {
  box-shadow: 0 0 0 3px #999;
}

.funkyradio-default input[type="radio"]:checked ~ label:before,
.funkyradio-default input[type="checkbox"]:checked ~ label:before {
  color: #333;
  background-color: #ccc;
}

.funkyradio-primary input[type="radio"]:checked ~ label:before,
.funkyradio-primary input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #337ab7;
}

.funkyradio-success input[type="radio"]:checked ~ label:before,
.funkyradio-success input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #5cb85c;
}

.funkyradio-danger input[type="radio"]:checked ~ label:before,
.funkyradio-danger input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #d9534f;
}

.funkyradio-warning input[type="radio"]:checked ~ label:before,
.funkyradio-warning input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #f0ad4e;
}

.funkyradio-info input[type="radio"]:checked ~ label:before,
.funkyradio-info input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #5bc0de;
}
</style>
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
					<img src="../img/Logo_1.png" alt="logo이미지" width="220px"
						height="70px" style="padding: 10px;" href="shopMain.jsp">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item">
			<a class="nav-link" href="#" onclick="window.location.reload(true);"> <!-- 클릭시 refresh --> 
			<span>판매 상태</span>
			</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- 배달 상태 -->
			<div class="sidebar-heading">배달 상태</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link" href=""> <span>배차 대기</span></a></li>

			<li class="nav-item active"><a class="nav-link" href=""> <span>배차 완료</span></a></li>

			<li class="nav-item active"><a class="nav-link" href=""> <span>배달 완료</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Heading -->
			<div class="sidebar-heading">관리자 페이지</div>

			<li class="nav-item active">
				<a class="nav-link" href="shopMenuUpdate.jsp"> 
					<span>메뉴 수정</span>
				</a>
			</li>

			<li class="nav-item active">
				<a class="nav-link" href="shopInfoUpdate.jsp"> 
					<span>정보 수정</span>
				</a>
			</li>
			<br/>
			<br/>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			<hr class="sidebar-divider d-none d-md-block">
			<!-- log out -->
			<li class="nav-item active"><a class="nav-link"
				href="shopLogOut.jsp"> <span>Log Out</span></a></li>
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
					<h1 class="h3 mb-2 text-gray-800"><%=businessName %></h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">주문 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
									<thead style="text-align: center;">
										<tr class="text-primary">
											<th>번호</th>
											<th>배달상태</th>
											<th>경과시간</th>
											<th>주문메뉴</th>
											<th>수량</th>
											<th>픽업/배달</th>
											<th>고객 요청 사항</th>
										</tr>
									</thead>
									<tbody style="text-align: center;">
										<!--자동테이블 -->
										<tr>
											<%
											Vector<ordersBean> orderList = ordersMgr.orderList(businessName);
											int listSize = orderList.size(), no=1;
											String oNumCheck = "null";/* oNum 같을때 test */
											if(orderList.isEmpty()){
												%>
											<th colspan="7" class="text-primary">
												<%out.println("아직 주문이 없네요. 홍보를 조금 더 해볼까요?"); %>
											</th>
											<%}else{
												for(int i=0; i<orderList.size(); i++){
													if(i==orderList.size()) break;
													ordersBean oBean = orderList.get(i);
													String oNum = oBean.getoNum();
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
													//주문 시간 및 현재시간
													SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
													// oDate;
													Date curDate = new Date();
													
										%>
											<td>
													<%
													if(oNumCheck.equals(oNum)){%>
													<%}else{%>
														<%=no %>
													<%} %>
											</td>
											<td>
													<%
													if(oNumCheck.equals(oNum)){%>
													<%}else{%>
													<!-- 미완성 -->
												    <div class="container">
													  <button onclick = "javascript:updateOrderStatus('1', '<%=oNum %>')" type="button" value="1" class="btn btn-<%=orderStatus.equals("1")?"primary":"info"%>" name="oStatus">하나</button>
													  <button onclick = "javascript:updateOrderStatus('2', '<%=oNum %>')" type="button" value="2" class="btn btn-<%=orderStatus.equals("2")?"primary":"info"%>" name="oStatus">둘</button>
													  <button onclick = "javascript:updateOrderStatus('3', '<%=oNum %>')" type="button" value="3" class="btn btn-<%=orderStatus.equals("3")?"primary":"info"%>" name="oStatus">셋</button>
													  <button onclick = "javascript:updateOrderStatus('4', '<%=oNum %>')" type="button" value="4" class="btn btn-<%=orderStatus.equals("4")?"primary":"info"%>" name="oStatus">넷</button>
													</div>
													<%} %>
											</td>
											<td>
												<%
													if(oNumCheck.equals(oNum)){%>
													<%}else{%>
														<%
														//시간 형 변환
														String cDate = dateFormat.format(curDate);
														Date oD = dateFormat.parse(oDate);
														Date cD = dateFormat.parse(cDate);
														//시간 차이
														long diff = Math.abs(oD.getTime() - cD.getTime());
														long sec = diff / 1000;
														long min = diff / (1000*60);
														long hour = diff / (1000*60*60);
														long day = diff / (1000*60*60*24);
														if(0<sec&&sec<60){%> 
															<%=sec %>초 전 
														<%}else if(0<min&&min<60){%>
															<%=min %>분 전
													 	<%}else if(0<hour&&hour<24){%> 
													 		<%=hour %>시간 전 
													 	<%}else{%>
															<%=day %>일 전
														<%}%>
													<%} %>
											</td>
											<td><%=menu %></td>
											<td><%=count %></td>
											<td>
												<%
												if(oNumCheck.equals(oNum)){no--;%>
												<%}else{%>
													<%=orderType %>
												<%} %>
											</td>
											<td style="text-align: left;">
												<%
												if(oNumCheck.equals(oNum)){%>
												<%}else{%>
													<%=oRequest %>
												<%} %>
											</td>
										</tr>
										<%oNumCheck=oNum; no++;%>
										<%}//for%>
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