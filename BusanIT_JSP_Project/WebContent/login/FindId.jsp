<%@ page contentType="text/html; charset=EUC-KR" %>
<%	request.setCharacterEncoding("EUC-KR");	%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Find Id & Password</title>

</head>
<script type="text/javascript">
	function pageing(page){	
		document.readFrm.submit();
	}
</script>
<body>
	<div id="login">
		<h3 class="text-center text-white pt-5">Login form</h3>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="FindId-form" class="form" action="FindIdProc.jsp" method="get">

							<!-- ���̵� ã�� -->
							<a href="../Index.jsp">
							<h3 class="text-center text-primary">Find ID</h3>
							</a>

							<!-- ����� �̸� -->
							<div class="form-group">
								<label for="username" class="text-primary">����� �̸�:</label><br>
								<input type="text" name="name" id="username" class="form-control">
							</div>

							<!-- ����� ��ȭ��ȣ -->
							<div class="form-group">
								<label for="password" class="text-primary">����� ��ȭ��ȣ</label><br>
								<input type="text" name="cPhone" id="userphone" class="form-control">
							</div>

							<!-- IDã�� submit  -->
							<div class="form-group">
								<input type="submit" class="btn btn-primary btn-md" value="FindId">
							</div>
						</form>
						
						<form id="FindPwd-form" class="form" action="FindPwdProc.jsp" method="get">
							<br />
							<br />
							<br />
							<!-- ��й�ȣ ã�� -->
							<a href="../Index.jsp">
							<h3 class="text-center text-primary">Find Password</h3>
							</a>

							<!-- ����� ���̵� -->
							<div class="form-group">
								<label for="username" class="text-primary">����� ���̵�:</label><br>
								<input type="text" name="id" id="userid" class="form-control">
							</div>

							<!-- ����� �̸� -->
							<div class="form-group">
								<label for="username" class="text-primary">����� �̸�:</label><br>
								<input type="text" name="name" id="username"
									class="form-control">
							</div>

							<!-- ����� ��ȭ��ȣ -->
							<div class="form-group">
								<label for="username" class="text-primary">����� ��ȭ��ȣ:</label><br>
								<input type="text" name="cPhone" id="userphone"
									class="form-control">
							</div>

							<!-- Pwdã�� submit -->
							<div class="form-group">
								<input type="submit" class="btn btn-primary btn-md" value="FindPwd">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>