<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="review.reviewMgr"%>
<%@page import="review.reviewBean"%>
<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />

<%@page import="java.text.NumberFormat"%>
<%@page import="shoplogin.loginMgr"%>
<%@page import="menu.ordersBean"%>
<%@page import="shoplogin.loginBean"%>
<%@page import="java.util.Vector"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="ordersMgr" class="menu.ordersMgr" />
<jsp:setProperty property="*" name="oBean" />
<%
	String menuCombine = "";
	String countCombine = "";
	String mPriceCombine = "";
	String subTotalCombine = "";
	String totalCombineComma = "";
	int totalCombine = 0;
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
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- side bar include -->
		<jsp:include page="../Merchant/sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<%
				request.setCharacterEncoding("EUC-KR");
				String shopName = request.getParameter("store");

				int num = 0;
				String content = null;
				String regdate = null;
				String rid = (String) session.getAttribute("idKey");
			%>
			<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
			<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
			<script type="text/javascript">
    
    function reviewInsert(number,odate){
    	
    	console.log(document.getElementById("sajangcomment"+number));
    		var comment = document.getElementById("sajangcomment"+number);
    		
    		location.href="../review/reviewshopInsert.jsp?comment="+comment.value+"&oDate="+odate;
    	}
    function reviewDelete(number){
      location.href ="../review/reviewDelete.jsp?rnum="+number;
    }
     function doDisplay(i){
          var con = document.getElementById("myDIV"+i);
          if(con.style.display=='block'){
              con.style.display = 'none';
          }else{
              con.style.display = 'block';
          }
      } 
     function reviewRevise(number){    	 
    	 var inputshow = document.getElementById("recontent"+number);
    	 var inputhidden = document.getElementById("content"+number);
    	 if ( inputshow.style.display== "none" ){
    		 //수정화면 보이기 true
    		 inputhidden.style.display= "none";
    		 inputshow.style.display= "block";
    	 } else {
    		//수정화면 안보이기 false
    		 inputhidden.style.display= "block";
    		 inputshow.style.display= "none";
			 location.href = "reviewUpdate.jsp?rnum="+number+"&content="+inputshow.value;    		 
    		 /* alert(inputshow.value); // 원래값
    		 alert("수정완료되었습니다."); */
    	 }
     }
     function orderdetail(onum) {
    	 location.href = "../orderdetail/orderdetail.jsp?oNum=" +onum;
     }
     
</script>
<div id="wrapper">
			<div class="container-fluid">
				<div class="panel panel-success" style="margin-left: 10px; margin-top: 50px;" align="left">
					<div class="panel-heading">
						
						<div class="col-xs-12 col-sm-12 col-md-3"  align = "left">
								<h2 class="text-left" >
									<span style="color: navy"><strong>리뷰 내역</strong></span>
								</h2>
							</div>
					</div>
					<table id="js-load" class="type04 main" name="insert">
						<%
							Vector<reviewBean> vlist = mgr.reviewShop(businessName);
							int listSize = vlist.size();
							if (vlist.isEmpty()) {
						%>
						<tr>
							<td>등록된 리뷰가 없습니다</td>
						</tr>
						<%} else {%>
						<hr />
							<%for (int i = 0; i < vlist.size(); i++) {
									reviewBean pbean = vlist.get(i);
									String comment = mgr.shopComment(pbean.getoDate(), pbean.getShopName());
									int rnum = pbean.getrNum();
									String id = pbean.getrId();
									int rStar = pbean.getrStar();
									String rcontent = pbean.getrContent();
									String rregdate = pbean.getrRegdate().substring(0, 10);
									String rNick = pbean.getrNick();
									String oDate = pbean.getoDate();
									num = i;
							%>
						<tr>
							<td rowspan="3" width="70" align="center" style="height: 5px; width: 5px;">
								<img src="../img/Logo_21.png" width="height=66px" style="padding-top: 18px;width: 60px;margin-top: 0px;margin-left: 5px;margin-right: 5px;margin-bottom: 0px;">
							</td>
							<td colspan="2">
									<h4 style="padding-top: 10px; color : #4e73df"><%=pbean.getrNick()%><span style="font-size : 0.7em">님</span></h4>
							</td>
							<td align="right" width="120">
								<% if (rStar == 1) {%>★☆☆☆☆<%}%> 
								<% if (rStar == 2) {%>★★☆☆☆<%}%> 
								<% if (rStar == 3) {%>★★★☆☆<%}%> 
								<% if (rStar == 4) {%>★★★★☆<%}%> 
								<% if (rStar == 5) {%>★★★★★<%}%>
							</td>
							<td align="right" width="120"><%=rregdate%>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="4">
								<p colspan="3" id="content<%=rnum%>"><%=rcontent%></p> 
								<input id="recontent<%=rnum%>" value="<%=rcontent%>" class="form-control" style="display: none; height: auto">
							</td>
						</tr>
						<%if(comment == null){ %>
							<tr>
								<td colspan="3">	
									<input type="text" id="sajangcomment<%=num %>" style="text-align:left; width:600px; height:60px;">
								</td>
								<td align="center" style="padding-top: 0px;">
									<button class="btn btn-primary" id="answer<%=num %>" onClick="javascript:reviewInsert('<%=num %>','<%=oDate %>')" style="cursor: pointer">답&nbsp;글</button>
								</td>
							</tr>
						<%} else {%>
							<tr>
								<td colspan="4">사장님 답글 : <%=comment %></td>
							</tr>
						<%}%>
						<tr>
							<td colspan="6">
								<hr />
							</td>
						</tr>						
						<%} //--for%>
					</table>
					<%} //else%>
				</div>
				<!-- footer include -->
				<jsp:include page="../Merchant/footer.jsp" />
			</div>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	<!-- 주문 알림 -->
	<div class="modal">
		<div class="modal-content" id="myModal">
			<span class="close-button">&times;</span> 
			<img alt="없다." src="../img/Logo_2.png">
			<h1 align="center">배달가~ 주문~</h1>
			
			<!-- window 클릭시 발생하는 거임 -->
			<input type="hidden" id="cancel" value="취소">
		</div>

	</div>
	</div>
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
	function toggleModal() {
		modal.classList.toggle("show-modal");
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
	window.addEventListener("click", function windowOnClick(event) {
		if (event.target === modal) {
			modal.classList.toggle("show-modal");
			setTimeout(function(){
				location.reload();
			}, 100);
		}
	});
</script>
</html>