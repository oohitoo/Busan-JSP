<%@page import="Service.UtilMgr"%>
<%@page import="menu.ordersMgr"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />
<%
	String businessName = (String) session.getAttribute("name");
	request.setCharacterEncoding("EUC-KR");
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	int subtotal = 0, totalprice = 0, dailytotal = 0;
	String date = "";
	/* ������ ���Ͽ� ���� �� ���� */
	session.setAttribute("shop", businessName);
	if (businessName == null) {
%>
<script>
	alert("�α����� �� �ּ���");
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
	function previous(year, month, day) {
		var int_year = Number(year);
		var int_month = Number(month);
		var int_day = Number(day);
		previous_year = int_year;
		previous_month = int_month;
		previous_day = int_day - 1;
		if (previous_day == 0) {
			previous_month = int_month - 1;
			if(previous_month == 4 ||previous_month == 6||previous_month == 9||previous_month == 11){
				previous_day = 30;	
			}
			else if(previous_month == 2){
				previous_day = 28;
			}
			else{
				previous_day = 31;
			}
			if(previous_month == 0){
				previous_year = int_year-1;	
			}
		}
		location.href = "dailysales.jsp?year=" + previous_year + "&month=" + previous_month + "&day=" + previous_day;
	}
	function next(year, month, day) {
		var int_year = Number(year);
		var int_month = Number(month);
		var int_day = Number(day);
		next_year = int_year;
		next_month = int_month;
		next_day = int_day+1;
		if(next_day == 29 && next_month==2) {
			next_month++;
			next_day = 1;
		}
		if(next_day == 31){
			if(next_month == 4 || next_month == 6 || next_month == 9 || next_month == 11){
				next_month++;
				next_day = 1;
			}
		}
		if(next_day == 32){
			if(next_month == 1 || next_month == 3 || next_month == 5 || next_month == 7 || next_month == 8 || next_month == 10){
				next_month++;
				next_day = 1;
			}
			if(next_month == 12){
				next_month = 1;
				next_day = 1;
				next_year++;
			}
		}
		location.href = "dailysales.jsp?year=" + next_year + "&month=" + next_month + "&day=" + next_day;
	}
	function main() {
		location.replace("shopMain.jsp");
	}
	function no(year, month,day) {
		location.href = "dailysales.jsp?year=" + year + "&month=" + month +"&day=" + day;

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
					<!-- ���� �̸� -->
					<h1 class="h3 mb-2 text-gray-800"><%=businessName%></h1>
					<div id="badal" >
						<table class="baedalga table-hover">
							<tr>
								<td>
									<div>
										<button align="left" type="button" class="btn btn-primary"
											onclick="javascript:previous('<%=year%>','<%=month%>','<%=day%>')">��&nbsp;��&nbsp;��</button>
									</div>
								</td>
								<td>
									<h2 align="center"><%=month%>��
										<%=day%>�� ���� ��ȸ
									</h2>
								</td>
								<td align="right">
									<div style="float: right; margin-right: 50px;">
										<button align="left" type="button" class="btn btn-primary"
											onclick="javascript:next('<%=year%>','<%=month%>','<%=day%>')">��&nbsp;��&nbsp;��</button>
									</div>
								</td>
							</tr>
						</table>
						<table class="baedalga table-hover" align="center" width="75%">
							<tr style="background: #4e73df 10%">
								<td class="text-center" width="20">��ȣ</td>
								<td class="text-center">�ֹ���¥</td>
								<td class="text-center">�ֹ���ȣ</td>
								<td class="text-center">�޴�</td>
								<td class="text-center">�ܰ�</td>
								<td class="text-center">����</td>
								<td class="text-center">�Ұ�</td>
								<td class="text-center">�������</td>
								<td class="text-center">�ֹ��ݾ�</td>
							</tr>
							<%
									Vector<ordersBean> olist = mgr.dailySales(businessName, day, month, year);
									int no = 1;
									for (int i = 0; i < olist.size(); i++) {
										ordersBean bean = olist.get(i);
										totalprice = 0;
								%>
							<tr align="center">

								<td><%=no%></td>
								<td><%=bean.getoDate()%></td>
								<td><%=bean.getoNum()%></td>
								<td align="left">
									<%
											Vector<ordersBean> mlist = mgr.menuList(bean.getoNum());
												for (int j = 0; j < mlist.size(); j++) {
													ordersBean mbean = mlist.get(j);
										%> <%=mbean.getMenu()%><br> <%}%>
								</td>
								<td>
									<%
											for (int j = 0; j < mlist.size(); j++) {
													ordersBean mbean = mlist.get(j);
										%> <%=UtilMgr.monFormat(mbean.getmPrice())%>��<br> <%}%>
								</td>
								<td>
									<%
											for (int j = 0; j < mlist.size(); j++) {
													ordersBean mbean = mlist.get(j);
										%> <%=mbean.getCount()%> <br> <% 	} %>
								</td>
								<td>
									<%
											for (int j = 0; j < mlist.size(); j++) {
													ordersBean mbean = mlist.get(j);
										%> <%=UtilMgr.monFormat(mbean.getTotalPrice())%>�� <br> <% totalprice += mbean.getTotalPrice();
 										}%>
								</td>

								<td><%=bean.getOrderType()%></td>
								<%
										
									%>
								<td><font color="#3a3b45"><b><%=UtilMgr.monFormat(totalprice)%>��</b></font></td>
							</tr>
							<%
									dailytotal += totalprice;
										no++;
									} //--for
								%>
							<tr class="impact">
								<td align="center">�հ�</td>
								<td colspan="8" align="center"><%=UtilMgr.monFormat(dailytotal)%>��</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- footer include -->
				<jsp:include page="../Merchant/footer.jsp" />
			</div>
		</div>
	</div>
</body>
</html>