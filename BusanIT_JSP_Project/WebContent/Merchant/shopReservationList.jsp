<%@page import="java.text.NumberFormat"%>
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
	String menuCombine ="";
	String countCombine ="";
	String mPriceCombine ="";
	String subTotalCombine ="";
	String totalCombineComma ="";
	int totalCombine=0;
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
.modal-detail {
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
.modal-content-detail {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 500px;
	height: 550px;
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
.close-button-detail {
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

.close-button-detail:hover {
	background-color: darkgray;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}
.show-modal-detail {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}
</style>
<title>판매자 페이지</title>
</head>
<!-- alert include -->
<%-- <jsp:include page="../Merchant/noti0518.html" /> --%>
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
								<table class="table" id="dataTable">
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
												Vector<ordersBean> orderList = ordersMgr.orderReservationList(businessName);
												int listSize = orderList.size(), no = 1;
												String oNumCheck = "null";/* oNum 같을때 test */
												if (orderList.isEmpty()) {
											%>
											<th colspan="7" class="text-primary">
												<%
													out.println("아직 주문이 없네요. 홍보를 조금 더 해볼까요?");
												%>
											</th>
										</tr>
											<%
												} else {
													int rcnt = 1, scnt = 0;
													for (int i = 0; i < orderList.size(); i++) {
														if (i == orderList.size())
															break;
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
														int mPrice = oBean.getmPrice();
														int subTotal = oBean.getTotalPrice();
														
														//주문 시간 및 현재시간
														SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
														// oDate;
														Date curDate = new Date();
														//동일한 숫자로 row 갯수 맞추기
														Vector<ordersBean> mmlist = ordersMgr.menuList(oNum);
															for(int j = 0 ; j < mmlist.size(); j++){
																ordersBean mbean = mmlist.get(j);
																menuCombine += mbean.getMenu()+"<br>";															
																countCombine += mbean.getCount()+"개<br>";															
																mPriceCombine += NumberFormat.getInstance().format(mbean.getmPrice())+"원<br>";															
																subTotalCombine += NumberFormat.getInstance().format(mbean.getTotalPrice())+"원<br>";															
																totalCombine += mbean.getTotalPrice();
																totalCombineComma = NumberFormat.getInstance().format(totalCombine)+"원";
															}
											%>
											<tr>
												<td onclick="javascript:toggleModalDetail( '<%=oNum%>','<%=oDate%>','<%=orderType%>','<%=cAddress%>','<%=menuCombine%>','<%=countCombine%>','<%=mPriceCombine%>','<%=subTotalCombine%>','<%=totalCombine%>','<%=totalCombineComma%>')"><%=no%><%no++;%></td>
												<td>
													<div class="container">
														<button onclick="javascript:updateOrderStatus('1', '<%=oNum%>')" type="button" value="1" class="btn btn-sm btn-<%=orderStatus.equals("1") ? "primary" : "info"%>" name="oStatus">결재 완료</button>
														<button onclick="javascript:updateOrderStatus('2', '<%=oNum%>')" type="button" value="2" class="btn btn-sm btn-<%=orderStatus.equals("2") ? "primary" : "info"%>" name="oStatus">배달 준비 중</button>
														<button onclick="javascript:updateOrderStatus('3', '<%=oNum%>')" type="button" value="3" class="btn btn-sm btn-<%=orderStatus.equals("3") ? "primary" : "info"%>" name="oStatus">배달 중</button>
														<button onclick="javascript:updateOrderStatus('4', '<%=oNum%>')" type="button" value="4" class="btn btn-sm btn-<%=orderStatus.equals("4") ? "primary" : "info"%>" name="oStatus">배달 완료</button>
														<button onclick="javascript:updateOrderStatus('5', '<%=oNum%>')" type="button" value="5" class="btn btn-sm btn-<%=orderStatus.equals("5") ? "primary" : "info"%>" name="oStatus">예약</button>
														<button onclick="javascript:updateOrderStatus('6', '<%=oNum%>')" type="button" value="6" class="btn btn-sm btn-<%=orderStatus.equals("6") ? "primary" : "info"%>" name="oStatus">완료</button>
													</div>
												</td>
												<td onclick="javascript:toggleModalDetail('<%=oNum%>','<%=oDate%>','<%=orderType%>','<%=cAddress%>','<%=menuCombine%>','<%=countCombine%>','<%=mPriceCombine%>','<%=subTotalCombine%>','<%=totalCombineComma%>')">
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
												<td onclick="javascript:toggleModalDetail( '<%=oNum%>','<%=oDate%>','<%=orderType%>','<%=cAddress%>','<%=menuCombine%>','<%=countCombine%>','<%=mPriceCombine%>','<%=subTotalCombine%>','<%=totalCombineComma%>')">
														<%Vector<ordersBean> mlist = ordersMgr.menuList(oNum);
															for(int j = 0 ; j < mlist.size(); j++){
																ordersBean mbean = mlist.get(j);
														%>
																<%=mbean.getMenu()%><br>
														<%}%>
												</td>
												<td  onclick="javascript:toggleModalDetail( '<%=oNum%>','<%=oDate%>','<%=orderType%>','<%=cAddress%>','<%=menuCombine%>','<%=countCombine%>','<%=mPriceCombine%>','<%=subTotalCombine%>','<%=totalCombineComma%>')">
														<%Vector<ordersBean> clist = ordersMgr.menuList(oNum);
															for(int j = 0 ; j < clist.size(); j++){
																ordersBean mbean = mlist.get(j);
														%>
																<%=mbean.getCount() %>개<br>
														<%}%>
												</td>
												<td onclick="javascript:toggleModalDetail( '<%=oNum%>','<%=oDate%>','<%=orderType%>','<%=cAddress%>','<%=menuCombine%>','<%=countCombine%>','<%=mPriceCombine%>','<%=subTotalCombine%>','<%=totalCombineComma%>')"><%=orderType%></td>
												<td onclick="javascript:toggleModalDetail( '<%=oNum%>','<%=oDate%>','<%=orderType%>','<%=cAddress%>','<%=menuCombine%>','<%=countCombine%>','<%=mPriceCombine%>','<%=subTotalCombine%>','<%=totalCombineComma%>')"><%=oRequest%></td>
											</tr>	
										<%
												menuCombine ="";
												countCombine ="";
												mPriceCombine ="";
												subTotalCombine ="";
												totalCombineComma="";
												totalCombine =0;
												} //for%>
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
			<!-- 주문 알림 -->
			<div class="modal">
				<div class="modal-content" id="myModal">
					<span class="close-button">&times;</span> <img alt="없다." src="../img/Logo_2.png">
					<h1 align="center">배달가~ 주문~</h1>
					<!-- window 클릭시 발생하는 거임 -->
					<input type="hidden" id="cancel" value="취소">
				</div>
			</div>
			<!-- 주문 상세 모달 창 -->
			<div class="modal-detail" id="orderReceipt">
				<div class="modal-content-detail">
					<span class="close-button-detail">&times;</span>
					<h3 id="title" align="center">주문 상세내역</h3>
					<div id="content">
					<table border="1" align="center">
						<tr>
							<td width="200" align="center">가게 이름</td>
							<td width="500"><%=businessName %></td>
						</tr>
						<tr>
							<td align="center">주문 번호</td>
							<td id="oNum" ></td>
						</tr>
						<tr>
							<td align="center">주문 일시</td>
							<td id="oDate"></td>
						</tr>
						<tr>
							<td align="center">결제 수단</td>
							<td id="orderType"></td>
						</tr>
						<tr>
							<td align="center">배달 주소지</td>
							<td id="cAddress"></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<td colspan="4" align="center">주문 상품 내역</td>
						</tr>
						<tr>
							<td width="500" id="menuCombine" align="left"></td>
							<td width="200" id="mPriceCombine" align="right"></td>
							<td width="200" id="countCombine" align="right"></td>
							<td width="200" id="subTotalCombine" align="right"></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<td width="700"align="center">주문 총액</td>
						</tr>
						<tr>
							<td align="right" id="totalCombineComma" align="right"></td>
						</tr>
					</table>
					<br>
						<div align="center">
							<button value="Print" onclick="javascript:printIt(document.getElementById('orderReceipt').innerHTML)">출력하기</button>
						</div>
					</div>
				</div>
			</div>	
			<!-- 모달 창 끝 -->

			<!-- footer include -->
			<jsp:include page="../Merchant/footer.jsp" />
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
</body>
<script>
	var modal = document.querySelector(".modal");
	var modalDetail = document.querySelector(".modal-detail");
	var closeButton = document.querySelector(".close-button");
	var closeButtonDetail = document.querySelector(".close-button-detail");
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
	function toggleModal() {
		modal.classList.toggle("show-modal");
	}
	function toggleModalDetail(oNum, oDate, orderType, cAddress, menuCombine, countCombine, mPriceCombine, subTotalCombine, totalCombineComma) {
  	  	$('#oNum').text(oNum);
 	    $('#oDate').text(oDate);
 	    $('#orderType').text(orderType);
 	    $('#cAddress').text(cAddress);
 	    $('#menuCombine').html(menuCombine);
 	    $('#countCombine').html(countCombine);
 	    $('#mPriceCombine').html(mPriceCombine);
 	    $('#subTotalCombine').html(subTotalCombine);
 	    $('#totalCombineComma').html(totalCombineComma);
 	    modalDetail.classList.toggle("show-modal-detail"); 
	}
	function onMessage() {
		/* alert("주문이 도착하였습니다.\n"); */
		var modal = document.querySelector(".modal");
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
	function printIt(printThis)
	{
	    var win = null;
	    win = window.open();
	    self.focus();
	    win.document.open();
	    win.document.write(printThis);
	    win.document.close();
	    win.print();
	    win.close();
	}
	closeButton.addEventListener("click", function toggleModal() {
		modal.classList.toggle("show-modal");
		setTimeout(function(){
			location.reload();
		}, 100);
	});
	closeButtonDetail.addEventListener("click", function toggleModalDetail() {
		modalDetail.classList.toggle("show-modal-detail");
	});
	window.addEventListener("click", function windowOnClick(event) {
		if (event.target === modal) {
			modal.classList.toggle("show-modal");
			setTimeout(function(){
				location.reload();
			}, 100);
		}
	});
	window.addEventListener("click", function windowOnClick(event) {
		if (event.target === modalDetail) {
			modalDetail.classList.toggle("show-modal-detail");
		}
	});
</script>
</html>