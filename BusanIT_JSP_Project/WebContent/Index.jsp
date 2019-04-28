<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<title>������ ������</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet" href="css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<body id="page-top">
	<!-- ��� �̹��� �� �ش� �̹��� -->
	<div class="container">
		<a href="index.jsp"><img src=" " alt="Logo�̹���" /></a>
		<a href="index.jsp"><img src=" " alt="Logo�̹���" /></a>
	</div>
	<!-- ��� �̹��� �� ��� ���� -->
	<hr>
	<!-- ���̵� �� �α��� �� ���õ� ���� -->
	<div class="container">
		<div class="Maincontainer">
			<% if(id == null){ %>
			<div class="main">
				<div class="main_1 main_common">
					<a href="login/login.jsp">�ֹ�����</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/member.jsp">ȸ������</a>
				</div>
				<div class="main_3 main_common">
					<a href="login/login.jsp">�α���</a>
				</div>
			</div>
			<% }
				else{
			%>
				<div class="main_1 main_common">
					<a href="login/logout.jsp">�α׾ƿ�</a>
				</div>				
				<div class="main_1 main_common">
					<a href="#">��ٱ���</a>
				</div>
				<div class="main_2 main_common">
					<a href="#">ȸ����������</a>
				</div>
				<div class="main_3 main_common">
					<a href="#"><%= id %>��</a>
				</div>
			<%
				}
			%>
		</div>
	</div>
	<!-- ���̵� �� �α��� �� ���õ� ���� ���� -->
	<!-- ��� �κ� ����  -->
	<br>
	<hr>
	<div class="container">
		<div class="row">
			<!-- Page Wrapper -->
			<div id="wrapper">
				<!-- Sidebar -->
				<ul	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
					<!-- Sidebar - Brand -->
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
						<div class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-laugh-wink"></i>
						</div>
						��ް�
					</a>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item">
						<a class="nav-link" href="Index.html">
							<span>�Ǹ� ����</span>
						</a>
					</li>

					<!-- Divider -->
					<hr class="sidebar-divider">

					<!-- ���� ���� -->
					<!-- Heading -->
					<div class="sidebar-heading">�޴� �׸�</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>�߽�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>�ѽ�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>����</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>ġŲ</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>�н�ƮǪ��</span>
						</a>
					</li>
					
					<!-- Divider -->
					<hr class="sidebar-divider">
					
					<!-- Heading -->
					<div class="sidebar-heading">������</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>ȸ������</span>
						</a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>���� ���� ����</span>
						</a>
					</li>	
					
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>��������</span>
						</a>
					</li>	

					<!-- Divider -->
					<hr class="sidebar-divider">

				</ul>
				<!-- End of Sidebar -->
				<!-- ���� �޴��� ���� -->
				<!-- ������ ���� �κ� ���� -->
				<table
					style="margin-left: 150px; margin-top: 100px; width: 700px; height: 500px; text-align: center; border-spacing: 30px;">
					<tr>
						<td colspan="2"><h3 class="panel-title">�޴� ���</h3></td>
					</tr>
					<tr>
						<td>
							<div class="alert alert-success" style="margin: 10px;">
								<h3>�߽ĸ޴�</h3>
							</div>
						</td>
						<td>
							<div class="alert alert-dark" style="margin: 10px;">
								<h3>�ѽĸ޴�</h3>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="alert alert-danger" style="margin: 10px;">
								<h3>���ڸ޴�</h3>
							</div>
						</td>
						<td>
							<div class="alert alert-warning" style="margin: 10px;">
								<h3>ġŲ�޴�</h3>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="alert alert-info" style="margin: 10px;">
								<h3>�н�ƮǪ��</h3>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<!-- ���� �κ� �ȿ� ��ư�� �κ� ���� -->
		</div>
	</div>
	<!-- ������ ���� �κ� ���� -->
</body>