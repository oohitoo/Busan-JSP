<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Login</title>
<style>
	br, div {
		border-color: red;
	}
</style>
</head>
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("Input your Id");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			alert("Input your Pwd");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" name="loginFrm" class="form" action="loginProc.jsp" method="post">
                        
                        <!-- 로그인 -->
                            <h3 class="text-center text-info">Login</h3>
                        
                        <!-- 사용자 이름 -->
                            <div class="form-group">
                                <label for="username" class="text-info">사용자 이름:</label><br>
                                <input type="text" name="id" id="username" class="form-control">
                            </div>
                            
                        <!-- 비밀번호 -->
                            <div class="form-group">
                                <label for="password" class="text-info">비밀번호:</label><br>
                                <input type="password" name="pwd" id="password" class="form-control">
                            </div>
                            
                        <!-- Remember me Check Box -->
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span><b>기억하기</b></span>
                                <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="login" onclick="loginCheck()" >
                            </div>
                            <br/>

							<table style="margin: auto;">
								<tr>
									<td class="text-left" style="padding-right: 50px;">
										<input type="button" class="btn btn-info btn-md" value="Find Id" onClick="javascript:location.href='FindID.jsp'">
									</td>
									<td class="text-center" style="padding-right: 50px;">
										<input type="button" class="btn btn-info btn-md" value="Find Pwd" onClick="javascript:location.href='FindPwd.jsp'">
									</td>
									<td class="text-right"><a href="member.jsp"
										class="text-info">가입하기</a></td>
								</tr>
							</table>

						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
