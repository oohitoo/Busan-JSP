<<<<<<< HEAD
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
=======
<!-- login.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
%>
<link href="style.css" rel="stylesheet" type="text/css">
>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b
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
<<<<<<< HEAD
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" name="loginFrm" class="form" action="loginProc.jsp" method="post">
                        
                        <!-- �α��� -->
                            <h3 class="text-center text-info">Login</h3>
                        
                        <!-- ����� �̸� -->
                            <div class="form-group">
                                <label for="username" class="text-info">����� �̸�:</label><br>
                                <input type="text" name="id" id="username" class="form-control">
                            </div>
                            
                        <!-- ��й�ȣ -->
                            <div class="form-group">
                                <label for="password" class="text-info">��й�ȣ:</label><br>
                                <input type="password" name="pwd" id="password" class="form-control">
                            </div>
                            
                        <!-- Remember me Check Box -->
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span><b>����ϱ�</b></span>
                                <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="login" onclick="loginCheck()" >
                            </div>
                            <br/>
=======
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<br />
		<%
			if (id != null) {
		%>
		<b><%=id%></b>�� ȯ���մϴ�.<br /> ���ѵ� ����� ��� �� ���� �ֽ��ϴ�.<br /> <a
			href="logout.jsp">�α׾ƿ�</a>&nbsp; <a href="memberUpdate.jsp">ȸ������</a>
		<%
			} else {
				id = request.getParameter("id");
		%>
		<form name="loginFrm" method="post" action="loginProc.jsp">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>�α���</h4></td>
				</tr>
				<tr>
					<td>�� �� ��</td>
					<td><input name="id" value="<%=(id != null) ? id : ""%>"></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pwd" value=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="�α���" onclick="loginCheck()">&nbsp;
							<input type="button" value="ȸ������"
								onClick="javascript:location.href='member.jsp'">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<%
			}
		%>
	</div>
</body>




>>>>>>> f4b87f60b60158d10d4d67ac266aca8c6c473b9b

							<table style="margin: auto;">
								<tr>
									<td class="text-left" style="padding-right: 50px;">
										<input type="button" class="btn btn-info btn-md" value="Find Id" onClick="javascript:location.href='FindID.jsp'">
									</td>
									<td class="text-center" style="padding-right: 50px;">
										<input type="button" class="btn btn-info btn-md" value="Find Pwd" onClick="javascript:location.href='FindPwd.jsp'">
									</td>
									<td class="text-right"><a href="member.jsp"
										class="text-info">�����ϱ�</a></td>
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
