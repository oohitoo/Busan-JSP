<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<title>Login</title>
</head>
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">　</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="storeMain.html" method="post">
                        
                        <!-- 로그인 -->
                            <h3 class="text-center text-primary" >Log in</h3>
                         <!-- Join Us -->
                            <div id="register-link" class="text-right">
                                <a href="storeSignUp.jsp" class="text-primary">가입하기</a>
                            </div>
                        <!-- 사용자 이름 -->
                            <div class="form-group">
                                <label for="username" class="text-primary">사업자 번호:</label><br>
                                <input type="text" name="username" id="username" class="form-control" required>
                            </div>
                            
                        <!-- 비밀번호 -->
                            <div class="form-group">
                                <label for="password" class="text-primary">비밀번호:</label><br>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                            
                        <!-- Remember me Check Box -->
                            <div class="form-group">
                                <label for="remember-me" class="text-primary"><span>기억하기</span> 
                                <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                        <!-- 로그인 -->
                                <input type="submit" name="submit" class="btn btn-primary btn-md" value="submit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>