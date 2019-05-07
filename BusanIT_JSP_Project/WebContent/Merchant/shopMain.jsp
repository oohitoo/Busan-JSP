<%@page import="shoplogin.loginBean"%>
<%@page import="java.util.Vector"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<%
	String businessName = (String) session.getAttribute("name");
	if(businessName==null){
		%>
		<script>
		alert("�α����� �� �ּ���");
		location.href = "shopLogin.jsp";
		</script>
		<%
	}
String business= null;
Vector<loginBean> shopname = mgr.shopInfo(business); %>
<head>
<meta charset="EUC-KR">
<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<title>�Ǹ��� ������</title>
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
					<img src="../img/Logo_1.png" alt="logo�̹���" width="220px" height="70px" style="padding: 10px;" href="shopMain.jsp">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="#" onclick="window.location.reload(true);"> 
			<!-- Ŭ���� refresh --> <span>�Ǹ� ����</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- ��� ���� -->
			<div class="sidebar-heading">��� ����</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item active">
			<a class="nav-link"	href=""> 
			<span>���� ���</span></a></li>

			<li class="nav-item active">
			<a class="nav-link"	href=""> 
			<span>���� �Ϸ�</span></a></li>

			<li class="nav-item active">
			<a class="nav-link"	href=""> 
			<span>��� �Ϸ�</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Heading -->
			<div class="sidebar-heading">������ ������</div>

			<li class="nav-item active">
			<a class="nav-link"	href="shopInfoUpdate.jsp">
			<span>�޴� ����</span></a></li>

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
					<!-- ���� �̸� -->
					<h1 class="h3 mb-2 text-gray-800"><%= businessName %></h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">�ֹ� ���</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
									<thead>
										<tr>
											<th>��ȣ</th>
											<th>����ð�</th>
											<th>�Ⱦ�/���</th>
											<th>��޻���</th>
											<th>�� ��û����</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>01</td>
											<td>10��</td>
											<td>�Ⱦ�</td>
											<td>���</td>
											<td>�ʰ� ����� �ּ���</td>
										</tr>

										<tr>
											<td>02</td>
											<td>25��</td>
											<td>���</td>
											<td>��޿Ϸ�</td>
											<td>������ �����ϰ� ì���ּ���</td>
										</tr>
										<tr>
											<td>03
											<td>55��</td>
											<td>���</td>
											<td>��� ���</td>
											<td>���� ������ �ּ���</td>
										</tr>
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