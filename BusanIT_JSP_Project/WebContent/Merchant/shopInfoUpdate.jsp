<%@page import="shoplogin.loginBean"%>
<jsp:useBean id="mgr" class="shoplogin.loginMgr" />
<jsp:useBean id="ordersMgr" class="orders.ordersMgr" />
<%
String businessName = (String) session.getAttribute("name");
String businessid = (String) session.getAttribute("businessid");
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
	
	function pwdCheck(){
		if(document.getElementById("pwd").value == document.getElementById("pwd2").value){
			if(confirm("수정하시겠습니까?")){
				document.form.action=location.href="shopInfoUpdateProc.jsp";
			}
		}else{
			alert("비밀번호가 일치하지 않습니다.");
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
<%loginBean bean = mgr.shopInfo(businessid); %>
</head>
<body>
    <div id="signup">
        <h3 class="text-center text-white pt-5">　</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="form" class="form" action="javascript:pwdCheck()" method="post" enctype="multipart/form-data">

							<!-- 회원정보수정 -->
							<h3 class="text-center text-primary">Shop Info Update</h3>
							<br />
							<!-- 사업자 번호 -->
							<div class="form-group">
								<label for="sregnumber" class="text-primary">사업자 번호:</label><br>
								<input type="number" id="username"
									oninput="validity.valid||(value='');" class="form-control" placeholder=<%=businessid%> readonly>
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
								<input type="text" class="form-control"	placeholder="<%=bean.getTel()%>" readonly>
							</div>
							<!-- 주소 -->
							<div class="form-group">
								<label for="saddress" class="text-primary">업장 주소:</label><br>
								<input type="text" name="username" id="username"
									class="form-control" placeholder="<%=bean.getAddrRoad()%>" readonly>
							</div>
							<!-- 식당 분류 -->
							<div class="form-group">
								<label for="scategories" class="text-primary">음식 종류:</label><br>
								<select class="form-control" name="scategories" id="scategories">
									<option>한식</option>
									<option>중식</option>
									<option>일식</option>
									<option>양식</option>
									<option>패스트푸드</option>
								</select>
							</div>

							<!-- image upload -->
							<div class="form-group">
								<label for="scategories" class="text-primary">식당 로고 선택:</label><br>
								<div class="row">
									<div>
										<label class=newbtn> 
										<img id="logo" src="http://placehold.it/60x60" width="60" height="60">
											<input type="file" name="pic" id="pic" class="pic" onchange="readURL(this);" value="<%=bean.getRestImg()%>">
										</label>
									</div>
								</div>
							</div>
							<input type="hidden" name="businessId" value="<%=businessid %>">
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