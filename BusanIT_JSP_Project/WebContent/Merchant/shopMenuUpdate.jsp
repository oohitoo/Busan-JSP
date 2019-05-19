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

<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Update Info</title>
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
</head>
<body>
    <div>
        <h3 class="text-center text-white pt-5">　</h3>
        <div class="container">
            <div class="row justify-content-center align-items-center">

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
												<td><%=mCategory %></td>
												<td><%=menu %></td>
												<td><%=NumberFormat.getInstance().format(mPrice) %></td> <!-- 천단위 콤마 찍기 -->
												<td><%=mInfo %></td>
												<td><%=mImg %></td>
												<td><button type="button" class="btn btn-danger" onclick="javascript:del(<%=idx%>)">-</button></td>
											</tr>
											<% }%>
										<% }%>
										<tbody>
								   <form name="frm" method="post" action="">
								   <tr style="text-align: center;">
								      <td><input type="text" name="add_no" class="form-control" value="<%=no+1 %>" style="text-align: center;"/>
								      <td><input type="text" name="menu" class="form-control"></td>
								      <td><input type="text" name="category" class="form-control"></td>
								      <td><input type="text" name="mPrice" class="form-control"></td>
								      <td><input type="text" name="mInfo" class="form-control"></td>
								      <td><input type="text" name="mImg" class="form-control" placeholder="null"></td>
								      <input type="hidden" name="rName" value="<%=businessName %>">
								      <td><button type="submit" class="btn btn-success" value="항목추가"> + </button></td>
								   </tr>
								   </form>
								</tbody>
							</table>
            </div>
        </div>
    </div>
</body>
</html>