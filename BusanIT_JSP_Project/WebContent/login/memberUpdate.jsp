<%@page import="login.LoginBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	LoginBean bean = mgr.getCustomer(id);
%>
<script>
	function menulist(menu) {
		console.log(menu);
		location.href = 'item/itemProc.jsp?menu='+menu;
	}
</script>
<title>������ ������</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet" href="../css/MainIndex.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<body id="page-top">
	<!-- ��� �̹��� �� �ش� �̹��� -->
	<div class="container"><br>
		<a href="../Index.jsp">
			<img src="../img/Logo_2.png" width="200px" height="200px" alt="Logo�̹���"/>
		</a>
		<a href="../Index.jsp">
			<img src="../img/Logo_1.png" width="500px" height="150px" alt="Logo�̹���" style="margin-left: 150px;margin-right: 50px;"/>
		</a>
	</div>
	<!-- ��� �̹��� �� ��� ���� -->
	<hr>
	<!-- ���̵� �� �α��� �� ���õ� ���� -->
	<div class="container">
		<div class="Maincontainer">
			<% if(id == null){ %>
			<div class="main">
				<div class="main_1 main_common">
					<a href="login.jsp">�ֹ�����</a>
				</div>
				<div class="main_2 main_common">
					<a href="member.html">ȸ������</a>
				</div>
				<div class="main_3 main_common">
					<a href="login.html">�α���</a>
				</div>
			</div>
			<% }
				else{
			%>
				<div class="main_1 main_common">
					<a href="logout.jsp">�α׾ƿ�</a>
				</div>				
				<div class="main_1 main_common">
					<a href="#">��ٱ���</a>
				</div>
				<div class="main_2 main_common">
					<a href="memberUpdate">ȸ����������</a>
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
						<img src="../img/Logo_1.png" width="200px" height="50px" alt="Logo�̹���"/>
					</a>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item">
						<a class="nav-link" href="../Index.jsp">
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
						<a class="nav-link" href="../item/itemProc.jsp?menu=�߽�">
							<span>�߽�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemProc.jsp?menu=�ѽ�">
							<span>�ѽ�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../tables.html">
							<span>����</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../tables.html">
							<span>ġŲ</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../tables.html">
							<span>�н�ƮǪ��</span>
						</a>
					</li>
					
					<!-- Divider -->
					<hr class="sidebar-divider">
					
					<!-- Heading -->
					<div class="sidebar-heading">������</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<a class="nav-link" href="../tables.html">
							<span>ȸ������</span>
						</a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="../tables.html">
							<span>���� ���� ����</span>
						</a>
					</li>	
					
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item active">
						<a class="nav-link" href="../tables.html">
							<span>������</span>
						</a>
					</li>	

					<!-- Divider -->
					<hr class="sidebar-divider">

				</ul>
				<!-- End of Sidebar -->
				<!-- ���� �޴��� ���� -->
				<!-- ������ ���� �κ� ���� -->
				
<!-- 				���⿡ ���κκ�!!! -->
						<div align="center">
				<br /> <br />
				<form name="regFrm" method="post" action="memberUpdateProc.jsp">
					<table align="center" cellpadding="5" >
						<tr>
							<td align="center" valign="middle" bgcolor="#FFFFCC">
								<table border="1" cellpadding="2" align="center" width="600">
									<tr align="center" bgcolor="#996600">
										<td colspan="3"><font color="#FFFFFF"><b>ȸ�� ����</b></font></td>
									</tr>
									<tr>
										<td width="20%">���̵�</td>
										<td width="80%"><input name="id" size="15"
											value="<%=bean.getId() %>" readonly></td>
									</tr>
									<tr>
										<td>�н�����</td>
										<td><input type="password" name="pwd" size="15"
											value="<%=bean.getPwd()%>"></td>
									</tr>
									<tr>
										<td>�н�����Ȯ��</td>
										<td><input type="password" name="repwd" size="15"
											></td>
									</tr>
									<tr>
										<td>�̸�</td>
										<td><input name="name" size="15"
											value="<%=bean.getName()%>"></td>
									</tr>
									
									<tr>
										<td>�г���</td>
										<td><input name="cNick" size="15"
											value="<%=bean.getcNick()%>"></td>
									</tr>									
									
									<tr>
										<td>�����ȣ</td>
										<td><input name="zipcode" size="5"
											value="<%=bean.getcPost()%>" readonly> <input
											type="button" value="�����ȣã��" onClick="zipCheck()"></td>
									</tr>
									<tr>
										<td>�ּ�</td>
										<td><input name="address" size="45" value="<%=bean.getcAddress() %>"></td>
									</tr>
									
									<tr>
										<td colspan="3" align="center">
										<input type="submit" value="�����Ϸ�"> &nbsp; &nbsp; 
										<input type="reset" value="�ٽþ���"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>
				
			</div>
			
			<!-- ���� �κ� �ȿ� ��ư�� �κ� ���� -->
		</div>
	</div>
	<!-- ������ ���� �κ� ���� -->
</body>