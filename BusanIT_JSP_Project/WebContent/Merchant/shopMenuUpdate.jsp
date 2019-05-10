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
		<%
	}
%>
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
    <div id="signup">
        <h3 class="text-center text-white pt-5">　</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="login-form" class="form" action="shopMenuUpdateProc.jsp"	method="post">
							
							
							<!-- menu1 -->
							<label for="scategories" class="text-primary">메뉴 업데이트:</label>
							
							<!-- 버튼 -->
							<div class="container">
							    <input type="button" id="add" class="btn btn-success" value="항목추가" />
							    <input type="button" id="clear" class="btn btn-primary" value="항목제거" />
							</div>    
							
							<script>
							$(document).ready(function(){
						        $('#add').click(function(){
						        	$('#table').append('<table><tr><td rowspan="3"><img id="logo" src="http://placehold.it/200x200" width="200" height="200"><input id="pic" class="pis" onchange="readURL(this);" type="file"></td><td width="400"><div class="form-group">메뉴 이름<input type="text" class="form-control"></div></td></tr><tr><td width="400"><div class="form-group">가격<input type="text" class="form-control" onkeyUp="this.value = SetComma(this.value)"></div></td></tr><tr><td width="400"><div class="form-group">메뉴 설명<input type="text" class="form-control"></div></td></tr></table>')
						        });
						 
						    $('#clear').click(function(){
						            $('#table').empty();
						        });
						 
						    });
						    
							$('.newbtn').bind("click", function() {
								$('#pic').click();
							});

							function readURL(input) {
								if (input.files && input.files[0]) {
									var reader = new FileReader();

									reader.onload = function(e) {
										$('#logo').attr('src',
												e.target.result);
									};

									reader.readAsDataURL(input.files[0]);
								}
							}

							function SetComma(str) {
								str = str.replace(/,/g, '');
								var retValue = "";
								if (isNaN(str) == false) {
									for (i = 1; i <= str.length; i++) {
										if (i > 1 && (i % 3) == 1)
											retValue = str.charAt(str.length - i) + "," + retValue;
										else
											retValue = str.charAt(str.length - i) + retValue;
									}
								} else
									alert("숫자만 입력 가능합니다 숫자만 입력 해주세요");
								return retValue;
							}
							</script>
							<style>
								#pic {display: none;}.newbtn {cursor: pointer;}
								#blah {
									max-width: 100px;
									height: 100px;
									margin-top: 20px;
								}
							</style>
							
							<!-- 메뉴 이름, 가격, 설명 table-->
							<div class="container" width="500">
									<table>
											<tr>
												<td rowspan="3">
													<img id="logo" src="http://placehold.it/200x200" width="200" height="200">
													<input id="pic" class='pis' onchange="readURL(this);" type="file">
												</td>
												<td width="400">
													<div class="form-group">
													메뉴 이름
													<input type="text" class="form-control">
													</div>
												</td>
											</tr>
											<tr>
												<td width="400">
													<div class="form-group">
													가격
													<input type="text" class="form-control" onkeyUp="this.value = SetComma(this.value)">
													</div>
												</td>
											</tr>
											<tr>
												<td width="400">
													<div class="form-group">
													메뉴 설명
													<input type="text" class="form-control">
													</div>
												</td>
											</tr>
										</table>
							</div>
							<div class="table" id="table" width="500"></div>
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