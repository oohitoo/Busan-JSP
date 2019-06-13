<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String Id1 = request.getParameter("Id1");
	String Id2 = request.getParameter("Id2");
 
	
%>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Login</title>
</head>

<body>
	<div id="login">
		<h3 class="text-center text-white pt-5">Login form</h3>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form name="loginFrm" id="login-form" class="form" action="loginProc.jsp" method="post">

							<!-- �α��� -->
							<a href="../Index.jsp">
							<h3 class="text-center text-primary">Login</h3>
							</a>

							<!-- ����� ���̵� -->
							<div class="form-group">
								<label for="username" class="text-primary">����� ���̵�:</label><br>
								<%if(Id1 !=null){ %>
								<input type="email" name="id" id="username" class="form-control" value="<%=Id1 %>@<%=Id2 %> ">
								<%}else{ %>
								<input type="email" name="id" id="username" class="form-control" value="admin@admin.admin" >
								<%} %>
							</div>

							<!-- ��й�ȣ -->
							<div class="form-group">
								<label for="password" class="text-primary">��й�ȣ:</label><br> 
									<input type="password" name="pwd" id="password" class="form-control" value="1234">
							</div>

							<!-- Remember me Check Box -->
							<div class="form-group">
								<label for="remember-me" class="text-primary">
									<span><b>����ϱ�</b></span> 
									<span><input id="remember-me" name="remember-me" type="checkbox"></span>
								</label><br> 
								<input type="button" class="btn btn-primary btn-md" value="login" onclick="loginCheck()">
							</div>
							
							<!-- ã��  & �����ϱ� -->

							<br />
							<div style="float: left">
								<input type="button" class="btn btn-primary btn-md" value="Find Id/Pwd" onClick="javascript:location.href='FindId.jsp'">
							</div>
							<div style="float: right"> 
								<a href="member.html" class="text-primary">�����ϱ�</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function loginCheck() {
		if(document.loginFrm.id.value == ""){
			alert("���̵� �Է����ּ���.");
			document.loginFrm.id.focus();
			return;
		}
		if(document.loginFrm.pwd.value == ""){
			alert("��й�ȣ�� �Է����ּ���.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
</body>
