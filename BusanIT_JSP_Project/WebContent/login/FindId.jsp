<%@ page contentType="text/html; charset=EUC-KR" %>
<%	request.setCharacterEncoding("EUC-KR");	%>

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
                        
                        <!-- ���̵� ã�� -->
                            <h3 class="text-center text-info">Find ID</h3>
                        
                        <!-- ����� �̸� -->
                            <div class="form-group">
                                <label for="username" class="text-info">����� �̸�:</label><br>
                                <input type="text" name="id" id="username" class="form-control">
                            </div>
                            
                        <!-- ����� ��ȭ��ȣ -->
                            <div class="form-group">
                                <label for="password" class="text-info">����� ��ȭ��ȣ</label><br>
                                <input type="text" name="phonenumber" id="userphone" class="form-control">
                            </div>
                            
                        <!-- IDã�� submit  -->
                            <div class="form-group">                                
                                <input type="submit" name="Idsubmit" class="btn btn-info btn-md" value="FindId" onclick="javascript:location.href=FindIdProc.jsp" >
                            </div>
                            
                        <br/><br/><br/>
                        <!-- ��й�ȣ ã�� -->
                            <h3 class="text-center text-info">Find Password</h3>
                        
                        <!-- ����� ���̵� -->
                            <div class="form-group">
                                <label for="username" class="text-info">����� ���̵�:</label><br>
                                <input type="text" name="id" id="userid" class="form-control">
                            </div>
                            
                        <!-- ����� �̸� -->
                            <div class="form-group">
                                <label for="username" class="text-info">����� �̸�:</label><br>
                                <input type="text" name="phone" id="username" class="form-control" >
                            </div>
                        
                        <!-- ����� ��ȭ��ȣ -->    
                            <div class="form-group">
                                <label for="username" class="text-info">����� ��ȭ��ȣ:</label><br>
                                <input type="text" name="phonenumber" id="userphone" class="form-control" >
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