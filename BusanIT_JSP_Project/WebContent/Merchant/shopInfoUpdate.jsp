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
						<form id="login-form" class="form" action="shopInfoUpdateProc.jsp"
							method="post">

							<!-- 회원정보수정 -->
							<h3 class="text-center text-primary">Shop Info Update</h3>
							<br />
							<!-- 사업자 번호 -->
							<div class="form-group">
								<label for="sregnumber" class="text-primary">사업자 번호:</label><br>
								<input type="number" min="0" id="username"
									oninput="validity.valid||(value='');" class="form-control" placeholder=<%=businessId%> readonly>
							</div>
							<!-- 비밀번호 -->
							<div class="form-group">
								<label for="password" class="text-primary">비밀번호:</label><br>
								<input type="password" name="pwd" id="pwd" class="form-control"required>
							</div>
							<!-- 비밀번호  확인-->
							<div class="form-group">
								<label for="password" class="text-primary">비밀번호 확인:</label><br>
								<input type="password" name="pwd2" id="pwd2" class="form-control" required>
							</div>

							<!-- 가게 이름 -->
							<div class="form-group">
								<label for="shopname" class="text-primary">상호 명:</label><br>
								<input type="text" name="username" id="shopname"
									class="form-control" placeholder="<%=businessName%>" readonly>
							</div>
							<!-- 전화 번호 -->
							<div class="form-group">
								<label for="sphone" class="text-primary">전화 번호:</label><br>
								<input type="tel" class="form-control"
									pattern="^\d{3}-\d{4}-\d{4}$" placeholder=<%=businessPhone%>
									readonly>
							</div>
							<!-- 주소 -->
							<div class="form-group">
								<label for="saddress" class="text-primary">업장 주소:</label><br>
								<input type="text" name="username" id="username"
									class="form-control" placeholder=<%=businessAddress%> readonly>
							</div>
							<!-- 식당 분류 -->
							<div class="form-group">
								<label for="scategories" class="text-primary">음식 종류:</label><br>
								<select class="form-control" id="sel1">
									<option>한식</option>
									<option>중식</option>
									<option>일식</option>
									<option>양식</option>
									<option>기타</option>
								</select>
							</div>

							<!-- image upload -->
							<label for="scategories" class="text-primary">식당   로고 선택:</label>
							<div class="row">
								<div>
									<label class=newbtn> 
									<img id="logo" src="http://placehold.it/100x100" width="100" height="100"> 
									<input id="pic"	class='pis' onchange="readURL(this);" type="file">
									</label>
								</div>
							</div>
							<script>
								$('.newbtn').bind("click", function() 
										{$('#pic').click();});

								function readURL(input) {
									if (input.files && input.files[0]) {
										var reader = new FileReader();

										reader.onload = function(e) {
											$('#logo').attr('src', e.target.result);
										};

										reader.readAsDataURL(input.files[0]);
									}
								}
							</script>
							<style>
								#pic {display: none;}
								.newbtn {cursor: pointer;}
								#blah {
										max-width: 100px;
										height: 100px;
										margin-top: 20px;
										}
							</style>

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