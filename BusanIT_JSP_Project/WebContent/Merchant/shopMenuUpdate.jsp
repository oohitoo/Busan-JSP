<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%
String businessName = (String) session.getAttribute("name");
String businessId = (String) session.getAttribute("businessId");
String businessPhone = (String) session.getAttribute("phone");
String businessAddress = (String) session.getAttribute("address");
String businessCategory = (String) session.getAttribute("category");
if(businessName==null){%>
	<script>
	alert("로그인을 해 주세요");
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
		//request 초기화
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
<style>
.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0;}
.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
.btn-file{overflow:hidden;position:relative;vertical-align:middle;}.btn-file>input{position:absolute;top:0;right:0;margin:0;opacity:0;filter:alpha(opacity=0);transform:translate(-300px, 0) scale(4);font-size:23px;direction:ltr;cursor:pointer;}
.fileupload{margin-bottom:9px;}.fileupload .uneditable-input{display:inline-block;margin-bottom:0px;vertical-align:middle;cursor:text;}
.fileupload .thumbnail{overflow:hidden;display:inline-block;margin-bottom:5px;vertical-align:middle;text-align:center;}.fileupload .thumbnail>img{display:inline-block;vertical-align:middle;max-height:100%;}
.fileupload .btn{vertical-align:middle;}
.fileupload-exists .fileupload-new,.fileupload-new .fileupload-exists{display:none;}
.fileupload-inline .fileupload-controls{display:inline;}
.fileupload-new .input-append .btn-file{-webkit-border-radius:0 3px 3px 0;-moz-border-radius:0 3px 3px 0;border-radius:0 3px 3px 0;}
.thumbnail-borderless .thumbnail{border:none;padding:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;}
.fileupload-new.thumbnail-borderless .thumbnail{border:1px solid #ddd;}
</style>
<script>
function noEvent() { // 새로 고침 방지
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
		
		<!-- side bar include -->		
<jsp:include page="../Merchant/sidebar.jsp"/>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1></h1>
					<!-- 가게 이름 -->
					<h1 class="h3 mb-2 text-gray-800"><%=businessName %></h1>
					<div class="card shadow mb-4">
					<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">메뉴 목록</h6>
						</div>
						<div class="card-body">
					<!-- DataTales -->
					<!-- Menu List -->
				<table class="table table-bordered" id="list_table" width="100%" cellspacing="0" style="text-align: center;">
				<thead>
					<tr>
						<th class="text-primary" width="70">No</th>
						<th class="text-primary">메뉴 이름</th>
						<th class="text-primary">카테고리</th>
						<th class="text-primary">가격</th>
						<th class="text-primary">메뉴 설명</th>
						<th class="text-primary">메뉴 사진</th>
						<th class="text-primary">추가/삭제</th>
					</tr>
				</thead>
						<%
							Vector<menuBean> menuList = menuMgr.menuSelect(businessName);
							int listSize = menuList.size(), no=0;
							if(menuList.isEmpty()){
								out.println("등록된 메뉴가 없습니다.");
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
									<td><%=NumberFormat.getInstance().format(mPrice) %></td> <!-- 천단위 콤마 찍기 -->
									<td><%=mInfo %></td>
									<td>
									<% if(mImg != null){%>
										<img src="../img/menuImg/<%=mImg %>" alt="이미지 준비중" width="100px" height="100px">
									<%}else{ %>
										<img src="../img/menuImg/<%=mImg %>" alt="이미지 준비중" width="100px" height="100px">
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
					      <td>
							  	<div class="fileupload fileupload-new" data-provides="fileupload">
							    <span class="btn btn-primary btn-file">
							    <span class="fileupload-new">사진올리기</span>
							    <span class="fileupload-exists">사진 설정완료</span>         
							    <input type="file" />
							    </span>
							  	</div>
						  </td>
					      <input type="hidden" name="rName" value="<%=businessName %>">
					      <td><button type="submit" class="btn btn-success" value="항목추가"> + </button></td>
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