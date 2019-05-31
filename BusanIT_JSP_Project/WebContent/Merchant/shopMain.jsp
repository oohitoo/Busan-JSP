<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="shoplogin.loginMgr"%>
<%@page import="menu.ordersBean"%>
<%@page import="shoplogin.loginBean"%>
<%@page import="java.util.Vector"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="mgr" class="shoplogin.loginMgr" />
<jsp:useBean id="ordersMgr" class="menu.ordersMgr" />
<jsp:setProperty property="*" name="oBean" />
<%
	String businessName = (String) session.getAttribute("name");
	/* 소켓을 위하여 세션 값 저장 */
	session.setAttribute("shop", businessName);
	if (businessName == null) {
%>
<script>
	alert("로그인을 해 주세요");
	location.href = "shopLogin.jsp";
</script>
<%}%>
<head>
<meta charset="EUC-KR">
<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<!-- Jquery  -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
	function updateOrderStatus(orderStatus, oNum) {
		location.href = "shopOrderStatusProc.jsp?orderStatus=" + orderStatus + "&oNum=" + oNum;
	}
</script>
<style>
img {
	margin: 15px 70px;
	width: 200px;
}

.modal {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 400px;
	height: 350px;
	border-radius: 0.5rem;
}

.close-button {
	float: right;
	width: 1.5rem;
	line-height: 1.5rem;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
	background-color: lightgray;
}

.close-button:hover {
	background-color: darkgray;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}
</style>
<title>판매자 페이지</title>
</head>
<!-- alert include -->
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- side bar include -->
		<jsp:include page="../Merchant/sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1></h1>
					<!-- 가게 이름 -->
					<h1 class="h3 mb-2 text-gray-800"><%=businessName%></h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">주문 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
												Vector<ordersBean> orderListMain = ordersMgr.orderListMain(businessName);
												int listSize = orderListMain.size(), no = 1;
												String oNumCheck = "null";/* oNum 같을때 test */
												if (orderListMain.isEmpty()) {
											%>
											<th colspan="7" class="text-primary">
												<%
													out.println("아직 주문이 없네요. 홍보를 조금 더 해볼까요?");
												%>
											</th>
											<%
												} else {
													int rcnt = 1, scnt = 0;
													for (int i = 0; i < orderListMain.size(); i++) {
														if (i == orderListMain.size())
															break;
														ordersBean oBean = orderListMain.get(i);
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
														//동일한 숫자로 row 갯수 맞추기
														rcnt = mgr.getNumCnt(oNum) - scnt;
											%>
											<%
												if (rcnt == 1 && scnt == 0) {
											%>
											<td><button onclick="javascript:onMessage()"><%=no%></button> <%
 	no++;
 %></td>
											<td>
												<div class="container">
													<button onclick="javascript:updateOrderStatus('1', '<%=oNum%>')" type="button" value="1" class="btn btn-<%=orderStatus.equals("1") ? "primary" : "info"%>" name="oStatus">결재 완료</button>
													<button onclick="javascript:updateOrderStatus('2', '<%=oNum%>')" type="button" value="2" class="btn btn-<%=orderStatus.equals("2") ? "primary" : "info"%>" name="oStatus">배달 준비 중</button>
													<button onclick="javascript:updateOrderStatus('3', '<%=oNum%>')" type="button" value="3" class="btn btn-<%=orderStatus.equals("3") ? "primary" : "info"%>" name="oStatus">배달 중</button>
													<button onclick="javascript:updateOrderStatus('4', '<%=oNum%>')" type="button" value="4" class="btn btn-<%=orderStatus.equals("4") ? "primary" : "info"%>" name="oStatus">배달 완료</button>
													<button onclick="javascript:updateOrderStatus('5', '<%=oNum%>')" type="button" value="5" class="btn btn-<%=orderStatus.equals("5") ? "primary" : "info"%>" name="oStatus">예약</button>
													<button onclick="javascript:updateOrderStatus('6', '<%=oNum%>')" type="button" value="6" class="btn btn-<%=orderStatus.equals("6") ? "primary" : "info"%>" name="oStatus">완료</button>
												</div>
											</td>
											<td>
												<%
													//시간 형 변환
																String cDate = dateFormat.format(curDate);
																Date oD = dateFormat.parse(oDate);
																Date cD = dateFormat.parse(cDate);
																//시간 차이
																long diff = Math.abs(oD.getTime() - cD.getTime());
																long sec = diff / 1000;
																long min = diff / (1000 * 60);
																long hour = diff / (1000 * 60 * 60);
																long day = diff / (1000 * 60 * 60 * 24);
																if (0 < sec && sec < 60) {%> 
												<%=sec%>초 전 
												<%} else if (0 < min && min < 60) {%> 
												<%=min%>분 전 
												<%} else if (0 < hour && hour < 24) {%> <%=hour%>시간 전 
												<%} else {%>
												<%=day%>일 전
												<%}%>
											</td>
											<td><%=menu%></td>
											<td><%=count%></td>
											<td><%=orderType%></td>
											<td style="text-align: left;"><%=oRequest%></td>

											<%} else {%>
											<%if (rcnt != 1 && scnt == 0) {%>
											<td rowspan="<%=rcnt%>"><button onclick="javascript:onMessage()"><%=no%></button> 
											<%no++;%>
											</td>
											<%}%>

											<%if (rcnt != 1 && scnt == 0) {%>
											<td rowspan="<%=rcnt%>">
												<div class="container">
													<button onclick="javascript:updateOrderStatus('1', '<%=oNum%>')" type="button" value="1" class="btn btn-<%=orderStatus.equals("1") ? "primary" : "info"%>" name="oStatus">결재 완료</button>
													<button onclick="javascript:updateOrderStatus('2', '<%=oNum%>')" type="button" value="2" class="btn btn-<%=orderStatus.equals("2") ? "primary" : "info"%>" name="oStatus">배달 준비 중</button>
													<button onclick="javascript:updateOrderStatus('3', '<%=oNum%>')" type="button" value="3" class="btn btn-<%=orderStatus.equals("3") ? "primary" : "info"%>" name="oStatus">배달 중</button>
													<button onclick="javascript:updateOrderStatus('4', '<%=oNum%>')" type="button" value="4" class="btn btn-<%=orderStatus.equals("4") ? "primary" : "info"%>" name="oStatus">배달 완료</button>
													<button onclick="javascript:updateOrderStatus('5', '<%=oNum%>')" type="button" value="5" class="btn btn-<%=orderStatus.equals("5") ? "primary" : "info"%>" name="oStatus">예약</button>
													<button onclick="javascript:updateOrderStatus('6', '<%=oNum%>')" type="button" value="6" class="btn btn-<%=orderStatus.equals("6") ? "primary" : "info"%>" name="oStatus">완료</button>
												</div>
											</td>
											<%}%>
											<%if (rcnt != 1 && scnt == 0) {%>
											<td rowspan="<%=rcnt%>">
												<%
													//시간 형 변환
																	String cDate = dateFormat.format(curDate);
																	Date oD = dateFormat.parse(oDate);
																	Date cD = dateFormat.parse(cDate);
																	//시간 차이
																	long diff = Math.abs(oD.getTime() - cD.getTime());
																	long sec = diff / 1000;
																	long min = diff / (1000 * 60);
																	long hour = diff / (1000 * 60 * 60);
																	long day = diff / (1000 * 60 * 60 * 24);
																	if (0 < sec && sec < 60) {%> 
												<%=sec%>초 전 
												<%} else if (0 < min && min < 60) {%> 
												<%=min%>분 전 
												<%} else if (0 < hour && hour < 24) {%> 
												<%=hour%>시간 전 
												<%} else {%>
												<%=day%>일 전 
												<%}%>
											</td>
											<%}%>
											<td><%=menu%></td>
											<td><%=count%></td>

											<%if (rcnt != 1 && scnt == 0) {%>
											<td rowspan="<%=rcnt%>"><%=orderType%></td>
											<%}%>


											<%if (rcnt != 1 && scnt == 0) {%>
											<td rowspan="<%=rcnt%>" style="text-align: left;"><%=oRequest%>
											</td>
											<%}%>
											<%}%>

										</tr>
										<%scnt++;
											if (mgr.getNumCnt(oNum) == scnt) {
												scnt = 0;
											}%>
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
			<input type="hidden" id="shopName" value="<%=businessName%>">

			<!--  팝업 될 레이어 -->
			<div class="modal">
				<div class="modal-content">
					<span class="close-button">&times;</span> <img alt="없다." src="../img/Logo_2.png">
					<h1 align="center">배달가~ 주문~</h1>
					<!-- window 클릭시 발생하는 거임 -->
					<input type="hidden" id="cancel" value="취소">
				</div>
			</div>

			<!-- footer include -->
			<jsp:include page="../Merchant/footer.jsp" />
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
</body>
<script>
	var modal = document.querySelector(".modal");
	var closeButton = document.querySelector(".close-button");
	var webSocket = new WebSocket('ws://' + location.host + '/BusanIT_JSP_Project/broadcasting');
	var shopName = $("#shopName");

	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	function onMessage() {
		/* alert("주문이 도착하였습니다.\n"); */
		var modal = document.querySelector(".modal");

		function toggleModal() {
			modal.classList.toggle("show-modal");
		}

		toggleModal();

	}
	function onOpen(event) {
		/* textarea.value += "연결 성공\n"; */
		/* alert("연결 성공 \n"); */
	}
	function onError(event) {
		alert(event.data);
	}
	function send() {
		/* textarea.value += "나 : " + inputMessage.value + "\n"; */
		/* webSocket.send(id.value + ":" + inputMessage.value);
		inputMessage.value = ""; */
	}
	closeButton.addEventListener("click", function toggleModal() {
		modal.classList.toggle("show-modal");
		location.reload();
	});
	window.addEventListener("click", function windowOnClick(event) {
		if (event.target === modal) {
			modal.classList.toggle("show-modal");
		}
		location.reload();
	});
</script>
</html>