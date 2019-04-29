<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<title>Sign Up</title>
</head>
<body>
    <div id="signup">
        <h3 class="text-center text-white pt-5">　</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="shopMain.html" method="post">
                        
                        <!-- 회원가입 -->
                            <h3 class="text-center text-primary" >Sign Up</h3>
                        	<div align="right">
                                <label for="username" class="text-primary"><a href="shopLogIn.jsp">Log In</a></label><br>
                            </div><br/>
                        <!-- 사업자 번호 -->
                            <div class="form-group">
                                <label for="sregnumber" class="text-primary">사업자 번호:</label><br>
                                <input type="number" min="0" id="username" oninput="validity.valid||(value='');" class="form-control" placeholder="xxx-xx-xxxxx">
                            </div>
                        <!-- 비밀번호 -->
                            <div class="form-group">
                                <label for="password" class="text-primary">비밀번호:</label><br>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                       <!-- 가게 이름 -->
                            <div class="form-group">
                                <label for="shopname" class="text-primary">상호 명:</label><br>
                                <input type="text" name="username" id="shopname" class="form-control" required>
                            </div>
                        <!-- 전화 번호 -->
                            <div class="form-group">
                                <label for="sphone" class="text-primary">전화 번호:</label><br>
                                <input type="tel" class="form-control" pattern="^\d{3}-\d{4}-\d{4}$" placeholder="xxx-xxxx-xxxx" required >
                            </div>
                        <!-- 주소 -->
                            <div class="form-group">
                                <label for="saddress" class="text-primary">업장 주소:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
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
							
								<!-- 가입하기 Submit -->
								<div id="register-link" class="text-right">
									<input type="submit" name="submit" class="btn btn-primary btn-md" value="가입하기">
								</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>