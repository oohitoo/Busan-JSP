<%@ page contentType="text/html; charset=UTF-8" %>
<%	request.setCharacterEncoding("UTF-8");	%>
<%-- <jsp:useBean id="mgr" class="login.loginMgr"/> --%>
<%
	
%>

<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Find Id & Password</title>

</head>
<script type="text/javascript">
	
</script>
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="loginProc.jsp" method="post">
                        
                        <!-- 아이디 찾기 -->
                            <h3 class="text-center text-info">Find ID</h3>
                        
                        <!-- 사용자 이름 -->
                            <div class="form-group">
                                <label for="username" class="text-info">사용자 이름:</label><br>
                                <input type="text" name="id" id="username" class="form-control">
                            </div>
                            
                        <!-- 사용자 전화번호 -->
                            <div class="form-group">
                                <label for="password" class="text-info">사용자 전화번호</label><br>
                                <input type="text" name="phone" id="userphone" class="form-control">
                            </div>
                            
                        <!-- ID찾기 submit  -->
                            <div class="form-group">
                                
                                <input type="submit" name="Idsubmit" class="btn btn-info btn-md" value="FindId" onclick="javascript:location.href=FindIdProc.jsp" >
                            </div>
                            
                        <br/><br/><br/>
                        <!-- 비밀번호 찾기 -->
                            <h3 class="text-center text-info">Find Password</h3>
                        
                        <!-- 사용자 아이디 -->
                            <div class="form-group">
                                <label for="username" class="text-info">사용자 아이디:</label><br>
                                <input type="text" name="id" id="username" class="form-control">
                            </div>
                            
                        <!-- 사용자 이름 -->
                            <div class="form-group">
                                <label for="username" class="text-info">사용자 이름:</label><br>
                                <input type="text" name="phone" id="username" class="form-control" >
                            </div>
                            
                            <div class="form-group">
                                <label for="username" class="text-info">사용자 전화번호:</label><br>
                                <input type="text" name="phone" id="username" class="form-control" >
                            </div>
                            
                            
                        <!-- Remember me Check Box -->
                            <div class="form-group">
                                
                                <input type="submit" name="Pwdsubmit" class="btn btn-info btn-md" value="FindPwd" onclick="javascript:location.href=FindPwdProc.jsp" >
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