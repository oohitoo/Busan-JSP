<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey"); 
%>
<title>������ ������</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet" href="css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- �˾� ó�� �ϱ� ���� -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#close').click(function() {
			$('#pop').hide();
		});
	});
</script>

<body id="page-top">
	<!-- ��� �̹��� �� �ش� �̹��� -->
	<div class="container">
		<a href="Index.jsp">
			<img src="img/Logo_2.png" width="200px" height="200px" alt="Logo�̹���"/>
		</a>
		<a href="Index.jsp">
			<img src="img/Logo_1.png" width="500px" height="150px" alt="Logo�̹���" style="margin-left: 150px;margin-right: 50px;"/>
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
					<a href="cart/cartView.jsp">�ֹ�����</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/member.html">ȸ������</a>
				</div>
				<div class="main_3 main_common">
					<a href="login/login.jsp">�α���</a>
				</div>
			</div>
			<% } else{ %>
				<div class="main_1 main_common">
					<a href="login/logout.jsp">�α׾ƿ�</a>
				</div>				
				<div class="main_1 main_common">
					<a href="cart/cartView.jsp">��ٱ���</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/memberUpdate.jsp">ȸ����������</a>
				</div>
				<div class="main_3 main_common" style="width: 150px">
					<a href="login/memberUpdate.jsp"><%= id %>��</a>
				</div>
			<%}	%>
		</div>
	</div>
	<!-- ���̵� �� �α��� �� ���õ� ���� ���� -->
	<!-- ��� �κ� ����  -->
	<br>
	<hr>
	<div class="container">
		<div class="row">
			<div id="wrapper">
				<!-- ���� �޴��� -->
				<ul	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="Index.jsp">
						<div class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-laugh-wink"></i>
						</div>
						<img src="img/Logo_1.png" width="200px" height="50px" alt="Logo�̹���"/>
					</a>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item">
						<a class="nav-link" href="Index.jsp">
							<span>�ֹ��� ������ ���ÿ� ��� ʫ</span>
						</a>
					</li>
					<!-- ���� -->
					<hr class="sidebar-divider">

					<!-- �޴� �׸� -->
					<!-- Heading -->
					<div class="sidebar-heading">�޴� �׸�</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=�߽�&nowPage=1">
							<span>�߽�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=�ѽ�&nowPage=1">
							<span>�ѽ�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=����&nowPage=1">
							<span>����</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=ġŲ&nowPage=1">
							<span>ġŲ</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="item/itemList.jsp?menu=�н�ƮǪ��&nowPage=1">
							<span>�н�ƮǪ��</span>
						</a>
					</li>
					
					<!-- ���� -->
					<hr class="sidebar-divider">
					
					<!-- �α��� �� ���¿����� ������ �޴� -->
					<% if(id == null){%>
					<li class="nav-item active">
						<a class="nav-link" href="Service/ServiceMain.jsp">
							<span>������</span>
						</a>
					</li>
					<% }else{ %>
					<div class="sidebar-heading">������</div>
					
					<li class="nav-item active">
						<a class="nav-link" href="login/memberUpdate.jsp">
							<span>ȸ������</span>
						</a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="review/reviewAll.jsp">
							<span>���� ����</span>
						</a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="orderdetail/orderList.jsp">
							<span>�ֹ� ����</span>
						</a>
					</li>	
					
					<li class="nav-item active">
						<a class="nav-link" href="orderdetail/reserveList.jsp">
							<span>���� ����</span>
						</a>
					</li>
					<!-- ���� -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item active">
						<a class="nav-link" href="Service/ServiceMain.jsp">
							<span>������</span>
						</a>
					</li>						
					<hr class="sidebar-divider">
					<% } %>
					<!-- Divider -->
				</ul>
				<!-- ���� �޴��� ���� -->
				<!-- ������ ���� �κ� ���� -->
				<table style="margin-left: 150px; margin-top: 100px; width: 700px; height: 500px; text-align: center; border-spacing: 30px;">
					<tr>
						<td colspan="2"><h2 class="panel-title" style="color: #486CDA;"><strong>�޴� ���</strong></h2></td>
					</tr>
					<tr>
						<td>
							<div class="alert alert-success" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=�߽�&nowPage=1">
								<h3>�߽ĸ޴�</h3>
								</a>
							</div>
						</td>
						<td>
							<div class="alert alert-dark" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=�ѽ�&nowPage=1">
								<h3>�ѽĸ޴�</h3>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="alert alert-danger" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=����&nowPage=1">
								<h3>���ڸ޴�</h3>
								</a>
							</div>
						</td>
						<td>
							<div class="alert alert-warning" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=ġŲ&nowPage=1">
								<h3>ġŲ�޴�</h3>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="alert alert-info" style="margin: 10px;">
								<a class="nav-link" href="item/itemList.jsp?menu=�н�ƮǪ��&nowPage=1">
								<h3>�н�ƮǪ��</h3>
								</a>
							</div>							 
						</td>
					</tr>
				</table>				
			</div>
			<!-- ���� �κ� �ȿ� ��ư�� �κ� ���� -->
		</div>
	</div>
	<!-- ������ ���� �κ� ���� -->
	<div id ="pop" style=" z-index: 1">
		<div style="height: 370px;" >
			<img alt="�̹��� ����" src="img/Logo_1.png" width="300px;">
			���� �� ����� �Բ� �ϴ� ���ʫ �Դϴ�.<br>
			
			<p>����� ���ǻ���</p><br>
				- ������ ���ҽ� �޴��� Ŭ���Ͻ��� ���ð� �����Ͽ� �ֽñ� �ٶ��ϴ�.<br>
			��޽� ���ǻ���<br>
				- �ֹ���Ҹ� ���ҽ� ���� ���Կ� �����Ͽ� ��� �Ͻñ� �ٶ��ϴ�.<br>			
		</div>
		<div>
			<div id="close" style="width: 100px; margin: auto;">close</div>
		</div>
	</div>
</body>