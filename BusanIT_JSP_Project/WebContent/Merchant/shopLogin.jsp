<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<title>Login</title>
</head>
<body>
	<div id="login">
        <h3 class="text-center text-white pt-5"></h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
						<form id="login-form" class="form" action="shopLoginProc.jsp" method="post">
							
								<!-- �α��� -->
								<h3 class="text-center text-primary">Log in</h3>
								
								<!-- Join Us -->
								<div id="register-link" class="text-right">
									<a href="shopSignUp.jsp" class="text-primary">���Թ���</a>
								</div>
								
								<!-- ����� �̸� -->
								<div class="form-group">
									<label for="username" class="text-primary">����� ��ȣ:</label><br>
								<input type="number" name="businessid" min="0" id="username" oninput="validity.valid||(value='');" class="form-control" placeholder="xxx-xx-xxxxx" value="0000001001">
									</div>

								<!-- ��й�ȣ -->
								<div class="form-group">
									<label for="password" class="text-primary">��й�ȣ:</label><br>
									<input type="password" name="pwd" id="password" class="form-control" required value="1234">
								</div>

								<!-- Remember me Check Box -->
								<div class="form-group">
									<label for="remember-me" class="text-primary"><span>����ϱ�</span> 
										<span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
								
								<!-- �α��� -->
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