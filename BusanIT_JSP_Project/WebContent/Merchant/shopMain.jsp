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
	alert("�α����� �� �ּ���");
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
<title>�Ǹ��� ������</title>
<script>
function orderStatusUpdate(){
	locaion.href = "shopOrderStatusProc.jsp?oNum="+oNum
}
</script>
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
					<!-- �� �̸� -->
					<!-- logo Image -->
					<img src="../img/Logo_1.png" alt="logo�̹���" width="220px"
						height="70px" style="padding: 10px;" href="shopMain.jsp">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item">
			<a class="nav-link" href="#" onclick="window.location.reload(true);"> <!-- Ŭ���� refresh --> 
			<span>�Ǹ� ����</span>
			</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- ��� ���� -->
			<div class="sidebar-heading">��� ����</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link" href=""> <span>���� ���</span></a></li>

			<li class="nav-item active"><a class="nav-link" href=""> <span>���� �Ϸ�</span></a></li>

			<li class="nav-item active"><a class="nav-link" href=""> <span>��� �Ϸ�</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Heading -->
			<div class="sidebar-heading">������ ������</div>

			<li class="nav-item active">
				<a class="nav-link" href="shopMenuUpdate.jsp"> 
					<span>�޴� ����</span>
				</a>
			</li>

			<li class="nav-item active">
				<a class="nav-link" href="shopInfoUpdate.jsp"> 
					<span>���� ����</span>
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
					<!-- ���� �̸� -->
					<h1 class="h3 mb-2 text-gray-800"><%=businessName %></h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">�ֹ� ���</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
									<thead style="text-align: center;">
										<tr class="text-primary">
											<th>��ȣ</th>
											<th>��޻���</th>
											<th>����ð�</th>
											<th>�ֹ��޴�</th>
											<th>����</th>
											<th>�Ⱦ�/���</th>
											<th>�� ��û ����</th>
										</tr>
									</thead>
									<tbody style="text-align: center;">
										<!--�ڵ����̺� -->
										<tr>
											<%
											Vector<ordersBean> orderList = ordersMgr.orderList(businessName);
											int listSize = orderList.size(), no=1;
											String oNumTest = "null";/* oNum ������ test */
											if(orderList.isEmpty()){
												%>
											<th colspan="7" class="text-primary">
												<%out.println("���� �ֹ��� ���׿�. ȫ���� ���� �� �غ����?"); %>
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
													//�ֹ� �ð� �� ����ð�
													SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
													// oDate;
													Date curDate = new Date();
													
										%>
											<td>
													<%
													if(oNumTest.equals(oNum)){%>
													<%}else{%>
														<%=no %>
													<%} %>
											</td>
											<td>
													<%
													if(oNumTest.equals(oNum)){%>
													<%}else{%>
													<!-- �̿ϼ� -->
														<form method="post" action="">
															<select onchange='javascript:orderStatusUpdate("<%=oNum %>")' name="oStatus">
																<option value="0"><%=orderStatus %>
																<option value="1">�ϳ�
																<option value="2">��
																<option value="3">��
																<option value="4">�� 
																<input type="hidden" name="oNum" value="<%=oNum %>">
															</select>
												</form>
													<%} %>
											</td>
											<td>
												<%
													if(oNumTest.equals(oNum)){%>
													<%}else{%>
														<%
														//�ð� �� ��ȯ
														String cDate = dateFormat.format(curDate);
														Date oD = dateFormat.parse(oDate);
														Date cD = dateFormat.parse(cDate);
														//�ð� ����
														long diff = Math.abs(oD.getTime() - cD.getTime());
														long sec = diff / 1000;
														long min = diff / (1000*60);
														long hour = diff / (1000*60*60);
														long day = diff / (1000*60*60*24);
														if(0<sec&&sec<60){%> 
															<%=sec %>�� �� 
														<%}else if(0<min&&min<60){%>
															<%=min %>�� ��
													 	<%}else if(0<hour&&hour<24){%> 
													 		<%=hour %>�ð� �� 
													 	<%}else{%>
															<%=day %>�� ��
														<%}%>
													<%} %>
											</td>
											<td><%=menu %></td>
											<td><%=count %></td>
											<td>
												<%
												if(oNumTest.equals(oNum)){no--;%>
												<%}else{%>
													<%=orderType %>
												<%} %>
											</td>
											<td style="text-align: left;">
												<%
												if(oNumTest.equals(oNum)){%>
												<%}else{%>
													<%=oRequest %>
												<%} %>
											</td>
										</tr>
										<%oNumTest=oNum; no++;%>
										<%}//for%>
										<%} //if else%>
										<!-- �ڵ� ���̺� -->
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