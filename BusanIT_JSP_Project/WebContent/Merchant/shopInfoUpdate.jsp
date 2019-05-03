<%
String businessName = (String) session.getAttribute("name");
String businessId = (String) session.getAttribute("businessId");
String businessPhone = (String) session.getAttribute("phone");
String businessAddress = (String) session.getAttribute("address");
String businessCategory = (String) session.getAttribute("category");
if(businessName==null){
		%>
		<script>
		alert("�α����� �� �ּ���");
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
<title>Update Info</title>
</head>
<body>
    <div id="signup">
        <h3 class="text-center text-white pt-5">��</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="shopUpdateProc.jsp" method="post">
                        
                        <!-- ȸ������ -->
                            <h3 class="text-center text-primary" >Sign Up</h3>
                        	<div align="right">
                                <label for="username" class="text-primary"><a href="shopLogIn.jsp">Log In</a></label><br>
                            </div><br/>
                        <!-- ����� ��ȣ -->
                            <div class="form-group">
                                <label for="sregnumber" class="text-primary">����� ��ȣ:</label><br>
                                <input type="number" min="0" id="username" oninput="validity.valid||(value='');" class="form-control" placeholder=<%=businessId%> readonly>
                            </div>
                        <!-- ��й�ȣ -->
                            <div class="form-group">
                                <label for="password" class="text-primary">��й�ȣ:</label><br>
                                <input type="password" name="password1" id="password1" class="form-control" required>
                            </div>
                       <!-- ��й�ȣ  Ȯ��-->
                            <div class="form-group">
                                <label for="password" class="text-primary">��й�ȣ Ȯ��:</label><br>
                                <input type="password" name="password2" id="password2" class="form-control" required>
                            </div>     
                            
                       <!-- ���� �̸� -->
                            <div class="form-group">
                                <label for="shopname" class="text-primary">��ȣ ��:</label><br>
                                <input type="text" name="username" id="shopname" class="form-control" placeholder=<%=businessName%> readonly>
                            </div>
                        <!-- ��ȭ ��ȣ -->
                            <div class="form-group">
                                <label for="sphone" class="text-primary">��ȭ ��ȣ:</label><br>
                                <input type="tel" class="form-control" pattern="^\d{3}-\d{4}-\d{4}$" placeholder=<%=businessPhone%> readonly>
                            </div>
                        <!-- �ּ� -->
                            <div class="form-group">
                                <label for="saddress" class="text-primary">���� �ּ�:</label><br>
                                <input type="text" name="username" id="username" class="form-control" placeholder=<%=businessAddress%> readonly>
                            </div>
						<!-- �Ĵ� �з� -->

							<div class="form-group">
								<label for="scategories" class="text-primary">���� ����:</label><br> 
								<select class="form-control" id="sel1">
									<option>�ѽ�</option>
									<option>�߽�</option>
									<option>�Ͻ�</option>
									<option>���</option>
									<option>��Ÿ</option>
								</select>
								</div>
							
								<!-- �����ϱ� Submit -->
								<div id="register-link" class="text-right">
									<input type="submit" name="submit" class="btn btn-primary btn-md" value="�����ϱ�">
								</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>