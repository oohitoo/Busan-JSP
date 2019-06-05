<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	Date d = new Date();
	SimpleDateFormat SDF_DATE = new SimpleDateFormat("yyyy");
	String year = SDF_DATE.format(d);
%>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">
	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="shopMain.jsp">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			<!-- 앱 이름 -->
			<!-- logo Image -->
			<img src="../img/Logo_1.png" alt="logo이미지" width="220px"
				height="70px" style="padding: 10px;" href="shopMain.jsp">
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	<hr class="sidebar-divider d-none d-md-block">

	<!-- 배달 상태 -->
	<div class="sidebar-heading">배달 상태</div>

	<!-- Nav Item - Tables -->
	<li class="nav-item active"><a class="nav-link"
		href="shopPaidList.jsp"> <span>결재 완료</span>
	</a></li>
	<li class="nav-item active"><a class="nav-link"
		href="shopDeliveredList.jsp"> <span>배달 완료</span>
	</a></li>
	<li class="nav-item active"><a class="nav-link"
		href="shopReservationList.jsp"> <span>예약</span>
	</a></li>
	<li class="nav-item active"><a class="nav-link"
		href="shopServedList.jsp"> <span>완료</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Heading -->
	<div class="sidebar-heading">관리자 페이지</div>

	<li class="nav-item active"><a class="nav-link"
		href="shopMenuUpdate.jsp"> <span>메뉴 수정</span>
	</a></li>

	<li class="nav-item active">
	<a class="nav-link" href="shopInfoUpdate.jsp">
		 <span>정보 수정</span>
	</a>
	</li>
	
	<li class="nav-item active">
	<a class="nav-link" href="annualSales.jsp?year=<%=year%>">
		 <span>매출 조회</span>
	</a>
	</li>
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	<hr class="sidebar-divider d-none d-md-block">
	<!-- log out -->
	<li class="nav-item active"><a class="nav-link"
		href="shopLogOut.jsp"> <span>Log Out</span></a></li>
</ul>
<!-- End of Sidebar -->