<%
String businessName = (String) session.getAttribute("name");
String businessId = (String) session.getAttribute("businessId");
String businessPhone = (String) session.getAttribute("phone");
String businessAddress = (String) session.getAttribute("address");
String businessCategory = (String) session.getAttribute("category");
if(businessName==null){
		%>
		<script>
		alert("로그인을 해 주세요");
		location.href = "shopLogin.jsp";
		</script>
		<%}%>
		
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
							
							<!-- menu1 -->
							<label for="scategories" class="text-primary">메뉴 업데이트:</label>
							
							<!-- 메뉴 이름, 가격, 설명 table-->
							<table class="table table-bordered" id="list_table" width="100%" cellspacing="0">
							
								<thead>
									<tr>
										<th class="text-primary" style="text-align: center;">No</th>
										<th class="text-primary" style="text-align: center;">메뉴 이름</th>
										<th class="text-primary" style="text-align: center;">가격</th>
										<th class="text-primary" style="text-align: center;">메뉴 설명</th>
										<th class="text-primary" style="text-align: center;">삭제</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									<tr>
										<td style="text-align: center;">
										<%
											int i =1;
											out.print(i);
										%>
										</td>
										<td style="text-align: center;">park</td>
										<td style="text-align: center;">930917</td>
										<td style="text-align: center;">설명설명</td>
										<td style="text-align: center;"><a href="#" class="delete-link">Delete</a></td>
									</tr>
								</tbody>
							</table>
							
							<h3>추가 입력 테이블</h3>
							
							<table class="table table-bordered" "append_table" width="100%" cellspacing="0">

							<thead>
							   <tr>
							      <th style="text-align: center;"><label for="add_no">No.</label></th>
							      <th style="text-align: center;">메뉴 이름</th>
							      <th style="text-align: center;">가  격</th>
							      <th style="text-align: center;">메뉴 설명</th>
							      <th style="text-align: center;">추가</th>
							   </tr>
							</thead>
							
							<tbody>
							   <tr style="text-align: center;">
							      <td>
							      <id="add_no" class="form-control">
							      	<% 
							      		i++;
							      		out.print(i); 
							      	%>
							      </td>
							      <td><input type="text" id="add_menuName" class="form-control"></td>
							      <td><input type="text" id="add_price" class="form-control" onchange="getNumber(this);" onkeyup="getNumber(this);"></td>
							      <td><input type="text" id="explaination" class="form-control"></td>
							      <td><button type="button" id="append_row" class="btn btn-success" value="항목추가">+</button></td>
							   </tr>
							</tbody>
							</table>

<script type="text/javascript">
//추가
$("#append_row").on(
        "click",
        function() {
            $("#list_table").append(
                    $("<tr>").append(
                            $("<td>").append($("#add_no").val()),
                            $("<td>").append($("#add_menuName").val()),
                            $("<td>").append($("#add_price").val()),
                            $("<td>").append($("#explaination").val()),
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