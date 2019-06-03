<%@page import="Service.UtilMgr"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="menu.ordersBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />
<%
	String businessName = (String) session.getAttribute("name");
	request.setCharacterEncoding("EUC-KR");
	int month = Integer.parseInt(request.getParameter("month"));
	int year = Integer.parseInt(request.getParameter("year"));
	int subtotal, yeartotal = 0;
	int card = 0, cash = 0, directpay = 0;
	/* 소켓을 위하여 세션 값 저장 */
	session.setAttribute("shop", businessName);
	if (businessName == null) {
%>
<script>
	alert("로그인을 해 주세요");
	location.href = "shopLogin.jsp";
</script>
<%
	}
%>
<html>
<head>
<link rel="stylesheet" href="../css/MainIndex.css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
	function back() {
		history.back();
	}
	function previous(year, month) {
		var int_month = Number(month);
		var int_year = Number(year);
		previous_year = int_year
		previous_month = int_month - 1
		if (previous_month == 0) {
			previous_month = 12;
			previous_year = int_year - 1
		}
		location.href = "daysales.jsp?year=" + previous_year + "&month="
				+ previous_month;
	}
	function next(year, month) {
		var int_month = Number(month);
		var int_year = Number(year);
		previous_year = int_year
		next_month = int_month + 1
		if (next_month == 13) {
			next_month = 1;
			previous_year = int_year + 1
		}
		location.href = "daysales.jsp?year=" + previous_year + "&month="
				+ next_month;
	}
	function main() {
		location.replace("shopMain.jsp");
	}
</script>
</head>
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
					<div id="badal">
						<table class="baedalga table-hover">
							<tr>
								<td>
									<div>
										<button align="left" type="button" class="btn btn-primary"
											onclick="javascript:previous('<%=year%>','<%=month%>')">이&nbsp;전&nbsp;달</button>
									</div>
								</td>
								<td colspan="4">
									<h2 align="center"><%=month%>월 일별 매출 조회
									</h2>
								</td>
								<td>
									<div style="float: right; margin-right: 50px;">
										<button align="left" type="button" class="btn btn-primary"
											onclick="javascript:next('<%=year%>','<%=month%>')">다&nbsp;음&nbsp;달</button>
									</div>
							</tr>
						</table>
						<table class="baedalga table-hover ">
							<tr style="background: #4e73df 10%">
								<td class="text-center">일</td>
								<td class="text-center">만나서카드</td>
								<td class="text-center">만나서현금</td>
								<td class="text-center">바로결제</td>
								<td class="text-center">총액</td>
							</tr>

							<!-- 월별 나오게 하기 -->
							<%
								for (int i = 1; i <= 31; ++i) {
									subtotal = 0;
									Vector<ordersBean> olist = mgr.daysales(businessName, i, month, year);
									HashMap<String, Integer> order = new HashMap<>();

									for (int l = 0; l < olist.size(); l++) {
										ordersBean bean = olist.get(l);
										order.put(bean.getOrderType(), bean.getTotalPrice());
									}
							%>
							<tr align="center">
								<td><%=i%>일</td>
								<!-- 월 출력 -->
								<%
									if (order.containsKey("만나서 카드결제")) {
											/* 달 총액 */
											subtotal += order.get("만나서 카드결제");
											/* 년 총액 */
											card += order.get("만나서 카드결제");
								%>
								<td><%=UtilMgr.monFormat(order.get("만나서 카드결제"))%>원</td>
								<%
									} else {
								%>
								<td>-</td>
								<%
									}
										if (order.containsKey("만나서 현금결제")) {
											/* 달 총액 */
											subtotal += order.get("만나서 현금결제");
											/* 년 총액 */
											cash += order.get("만나서 현금결제");
								%>
								<td><%=UtilMgr.monFormat(order.get("만나서 현금결제"))%>원</td>
								<%
									} else {
								%>
								<td>-</td>
								<%
									}
										if (order.containsKey("바로 결제")) {
											/* 달 총액 */
											subtotal += order.get("바로 결제");
											/* 년 총액 */
											directpay += order.get("바로 결제");
								%>
								<td><%=UtilMgr.monFormat(order.get("바로 결제"))%>원</td>
								<%
									} else {
								%>
								<td>-</td>
								<%
									}
										yeartotal += subtotal;

										//--olist for
								%>

								<!-- 모든 달 출력 부 -->
								<td><font color="#3a3b45"><b><%=subtotal%>원</b></font></td>
							</tr>
							<%
								} //--월별for
							%>
							<tr class="impact">
								<td align="center">합계</td>
								<td align="center"><%=UtilMgr.monFormat(card)%></td>
								<td align="center"><%=UtilMgr.monFormat(cash)%></td>
								<td align="center"><%=UtilMgr.monFormat(directpay)%></td>
								<td colspan="3" align="center"><%=  UtilMgr.monFormat(yeartotal) %>원</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- footer include -->
		<jsp:include page="../Merchant/footer.jsp" />
	</div>
</body>
</html>