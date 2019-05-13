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
		
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="menu.menuMgr"%>
<%@ page import="menu.menuBean"%>
<%@ page import="java.util.Vector"%>
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Update Info</title>
</head>
<body>
    <div>
        <h3 class="text-center text-white pt-5">　</h3>
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-md-6">
					<div class="col-md-12">
						<form class="form" action="shopMenuUpdateProc.jsp"	method="post">
							
							<!-- Menu List -->
							<table class="table table-bordered" id="list_table" width="100%" cellspacing="0" style="text-align: center;">
							<thead>
								<tr>
									<th class="text-primary">No</th>
									<th class="text-primary">메뉴 이름</th>
									<th class="text-primary">가격</th>
									<th class="text-primary">메뉴 설명</th>
									<th class="text-primary">메뉴 사진</th>
								</tr>
							</thead>
									<%
										Vector<menuBean> menuList = menuMgr.menuSelect(businessName);
										int listSize = menuList.size();
										int no=0;
										if(menuList.isEmpty()){
											out.println("등록된 메뉴가 없습니다.");
										}else{
											for(int i=0; i<menuList.size(); i++){
												if (i==menuList.size()) break;
												menuBean bean = menuList.get(i);
												String menu = bean.getMenu();
												int mPrice = bean.getmPrice();
												String mInfo = bean.getmInfo();
												String mImg = bean.getmImg();
												no++;
									%>
											<tr>
												<td><%=no %></td>
												<td><%=menu %></td>
												<td><%=mPrice %></td> <!-- 천단위 콤마 찍기 구현하기 -->
												
												<td><%=mInfo %></td>
												<td><%=mImg %></td>
												<td><button type="button" class="btn btn-primary">-</button></td>
											</tr>
											<% }%>
										<% }%>
										<tbody>
								   <tr style="text-align: center;">
								      <!-- DB insert delete 구현 후, 아래 ID값 다 지우고 script 날리기 -->
								      <td><input type="text" id="add_no" class="form-control" value="<%=no+1 %>" style="text-align: center;"/>
								      <td><input type="text" id="add_menu" class="form-control"></td>
								      <td><input type="text" id="add_price" class="form-control" onchange="getNumber(this);" onkeyup="getNumber(this);"></td>
								      <td><input type="text" id="explaination" class="form-control"></td>
								      <td><input type="text" id="img" class="form-control" placeholder="null"></td>
								      <td><button type="button" id="append_row" class="btn btn-success" value="항목추가">+</button></td>
								   </tr>
								</tbody>
							</table>

<!-- 삭제할 스크립트 -->
<script type="text/javascript">
//추가
$("#append_row").on(
        "click",
        function() {
            $("#list_table").append(
                    $("<tr>").append(
                            $("<td>").append($("#add_no").val()),
                            $("<td>").append($("#add_menu").val()),
                            $("<td>").append($("#add_price").val()),
                            $("<td>").append($("#explaination").val()),
                            $("<td>").append($("#img").val()),
                            $("<td>").append(
                                    $("<a>").prop("href", "#")
                                            .addClass("delete-link btn btn-primary")
                                            .append("-"))));
        });

// 삭제
$("#list_table").on("click", ".delete-link", function() {
    $(this).parent().parent().remove();
});

function getNumber(obj){
	var num01;
	var num02;
	num01 = obj.value;
	num02 = num01.replace(/\D/g,""); //숫자가 아닌것을 제거, 
	                                 //즉 [0-9]를 제외한 문자 제거; /[^0-9]/g 와 같은 표현
	num01 = setComma(num02); //콤마 찍기
	obj.value =  num01;
    }
    
function setComma(n) {
     var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
     n += '';                          // 숫자를 문자열로 변환         
     while (reg.test(n)) {
        n = n.replace(reg, '$1' + ',' + '$2');
     }         
     return n;
    }
</script>
	
							<!-- Update Submit -->
							<div id="register-link" class="text-right">
								<input type="submit" name="submit" class="btn btn-primary btn-md" value="수정하기">
							</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>