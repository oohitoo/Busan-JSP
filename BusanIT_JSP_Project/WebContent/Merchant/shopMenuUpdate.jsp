<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%
String businessName = (String) session.getAttribute("name");
String businessId = (String) session.getAttribute("businessId");
String businessPhone = (String) session.getAttribute("phone");
String businessAddress = (String) session.getAttribute("address");
String businessCategory = (String) session.getAttribute("category");
if(businessName==null){%>
	<script>
	alert("�α����� �� �ּ���");
	location.href = "shopLogin.jsp";
	</script>
	<%}%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="menu.menuMgr"%>
<%@ page import="menu.menuBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.text.NumberFormat"%>
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>
<jsp:useBean id="mBean" class="menu.menuBean"/>
<jsp:setProperty property="*" name="mBean"/>
<%
	int add_no = 0;
	if (request.getParameter("add_no") != null) {
		add_no = Integer.parseInt(request.getParameter("add_no"));
		}
	
	if (add_no != 0) {
		menuMgr.insertMenu(mBean);
		//request �ʱ�ȭ
		request.removeAttribute("add_no");
	}
%>
<head>
<meta charset="EUC-KR">
<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script>
function noEvent() { // ���� ��ħ ����
    if (event.keyCode == 116) {
        event.keyCode = 2;
        return false;
    } else if (event.ctrlKey
            && (event.keyCode == 78 || event.keyCode == 82)) {
        return false;
    }
}
document.onkeydown = noEvent;
function del(idx){
	location.href = "shopMenuUpdateProc.jsp?idx="+idx;
}
</script>
<title>Update Menu</title>
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
			<hr class="sidebar-divider d-none d-md-block">
			<hr class="sidebar-divider d-none d-md-block">

			<!-- ��� ���� -->
			<div class="sidebar-heading">��� ����</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link" href="shopPaidList.jsp"> <span>���� �Ϸ�</span></a></li>
			<li class="nav-item active"><a class="nav-link" href="shopDeliveredList.jsp"> <span>��� �Ϸ�</span></a></li>
			<li class="nav-item active"><a class="nav-link" href="shopReservationList.jsp"> <span>����</span></a></li>
			<li class="nav-item active"><a class="nav-link" href="shopServedList.jsp"> <span>�Ϸ�</span></a></li>

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
					<div class="card shadow mb-4">
					<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">�޴� ���</h6>
						</div>
						<div class="card-body">
					<!-- DataTales -->
					<!-- Menu List -->
				<table class="table table-bordered" id="list_table" width="100%" cellspacing="0" style="text-align: center;">
				<thead>
					<tr>
						<th class="text-primary" width="70">No</th>
						<th class="text-primary">�޴� �̸�</th>
						<th class="text-primary">ī�װ�</th>
						<th class="text-primary">����</th>
						<th class="text-primary">�޴� ����</th>
						<th class="text-primary">�޴� ����</th>
						<th class="text-primary">�߰�/����</th>
					</tr>
				</thead>
						<%
							Vector<menuBean> menuList = menuMgr.menuSelect(businessName);
							int listSize = menuList.size(), no=0;
							if(menuList.isEmpty()){
								out.println("��ϵ� �޴��� �����ϴ�.");
							}else{
								for(int i=0; i<menuList.size(); i++){
									if (i==menuList.size()) break;
									menuBean bean = menuList.get(i);
									int idx = bean.getIdx();
									String menu = bean.getMenu();
									String mCategory = bean.getCategory();
									int mPrice = bean.getmPrice();
									String mInfo = bean.getmInfo();
									String mImg = bean.getmImg();
									no++;
						%>
								<tr>
									<td><%=no %></td>
									<td><%=menu %></td>
									<td><%=mCategory %></td>
									<td><%=NumberFormat.getInstance().format(mPrice) %></td> <!-- õ���� �޸� ��� -->
									<td><%=mInfo %></td>
									<td>
									<% if(mImg != null){%>
										<img src="../img/menuImg/<%=mImg %>" alt="�̹��� �غ���" width="100px" height="100px">
									<%}else{ %>
										<img src="../img/menuImg/<%=mImg %>" alt="�̹��� �غ���" width="100px" height="100px">
									<%} %> 
									</td>
									<td><button type="button" class="btn btn-danger" onclick="javascript:del(<%=idx%>)">-</button></td>
								</tr>
								<% } //for%>
							<% } //else%>
							<tbody>
					   <form name="frm" method="post" action="">
					   <tr style="text-align: center;">
					      <td><input type="text" name="add_no" class="form-control" value="<%=no+1 %>" style="text-align: center;"/>
					      <td><input type="text" name="menu" class="form-control"></td>
					      <td><input type="text" name="category" class="form-control"></td>
					      <td><input type="text" name="mPrice" class="form-control"></td>
					      <td><input type="text" name="mInfo" class="form-control"></td>
					      <td><input type="file" name="mImg" class="upload-hidden" ></td>
					      <input type="hidden" name="rName" value="<%=businessName %>">
					      <td><button type="submit" class="btn btn-success" value="�׸��߰�"> + </button></td>
					   </tr>
					   </form>
					</tbody>
				</table>
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