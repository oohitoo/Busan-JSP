<%@page import="MenuList.menu_listBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	String menu = request.getParameter("menu");
%>
<jsp:useBean id="mgr" class="MenuList.menuMgr"/>
<%
	Vector<menu_listBean> list= mgr.menuSelect(menu);
%>

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
					<a href="../login/login.jsp">�ֹ�����</a>
				</div>
				<div class="main_2 main_common">
					<a href="../login/member.html">ȸ������</a>
				</div>
				<div class="main_3 main_common">
					<a href="../login/login.html">�α���</a>
				</div>
			</div>
			<% }
				else{
			%>
				<div class="main_1 main_common">
					<a href="../login/logout.jsp">�α׾ƿ�</a>
				</div>				
				<div class="main_1 main_common">
					<a href="#">��ٱ���</a>
				</div>
				<div class="main_2 main_common">
					<a href="../login/memberUpdate.jsp">ȸ����������</a>
				</div>
				<div class="main_3 main_common" style="width: 130px">
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
						<a class="nav-link" href="itemProc.jsp?menu=�߽�">
							<span>�߽�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemProc.jsp?menu=�ѽ�">
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
						<a class="nav-link" href="itemList.jsp?menu=�н�ƮǪ��">
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
							<span>������</span>
						</a>
					</li>	

					<!-- Divider -->
					<hr class="sidebar-divider">

				</ul>
				<!-- End of Sidebar -->
				<!-- ���� �޴��� ���� -->
				<!-- ������ ���� �κ� ���� -->
				<table style="margin-left: 150px;">
				<%
					if(list.isEmpty()){
						%>
						<tr>
							<td align="center"><br> �˻������ �����ϴ�.</td>
						</tr>
						<%
					}
					else{
						%>
						
						<%
						for(int i = 0; i < list.size(); ++i){
							menu_listBean bean = list.get(i);
							/* String StoreCond = bean.getStoreCond(); // ī�װ� */
							String StoreImage = bean.getRestImg(); // ���� ��ǥ �̹���
							String StoreName= bean.getStorename(); // ���Ը�
							String StoreAddrs1 = bean.getStoreaddr1(); //���θ��ּ�
							String tel = bean.getTel(); //��ȭ��ȣ
							String BestMenu = bean.getBestmenu();
						%>
						<tr>
							<td rowspan="3" width="140px" height="130px" align="center">
							<% if(StoreImage != null){%>
								<img alt="�̹����غ���" width="100px" height="100px" src="../img/storeImage/<%=StoreImage%>">
							<%}%>
							</td>
							<td colspan="2" ><%= StoreName %></td>
						</tr>
						
						<tr>
							<td><%= StoreAddrs1 %></td>
							<td align="center"><%= tel %></td>
						</tr>
						
						<tr>
							<td colspan="2">��ǥ�޴� : <%= BestMenu %></td>
						</tr>
						<%
							}
						}
				%>
				</table>
			</div>
			<!-- ���� �κ� �ȿ� ��ư�� �κ� ���� -->
		</div>
	</div>
	<!-- ������ ���� �κ� ���� -->
</body>
