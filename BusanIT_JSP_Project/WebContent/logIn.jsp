<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>로그인하기</title>
</head>
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                        
                        <!-- 로그인 -->
                            <h3 class="text-center text-info">Login</h3>
                        
                        <!-- 사용자 이름 -->
                            <div class="form-group">
                                <label for="username" class="text-info">사용자 이름:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                            
                        <!-- 비밀번호 -->
                            <div class="form-group">
                                <label for="password" class="text-info">비밀번호:</label><br>
                                <input type="text" name="password" id="password" class="form-control">
                            </div>
                            
                        <!-- Remember me Check Box -->
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>기억하기</span> 
                                <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                        <!-- Join Us -->
                            <div id="register-link" class="text-right">
                                <a href="#" class="text-info">가입하기</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>



</html>

