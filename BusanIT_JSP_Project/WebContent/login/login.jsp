<!-- login.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		
%>
<link href="style.css" rel="stylesheet" type="text/css">
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
<body bgcolor="#FFFFCC">
<div align="center">
<br/><br/>
<%if(id!=null){%>
<b><%=id%></b>Welcome<br/>
제한된 기능을 사용 할 수가 있습니다.<br/>
<a href="logout.jsp">Logout</a>&nbsp;
<a href="memberUpdate.jsp">Change member information</a>
<%}else{
	id= request.getParameter("id");
%>
<form name="loginFrm" method="post" action="loginProc.jsp">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>Login</h4></td>
				</tr>
				<tr>
					<td>Id</td>
					<td><input name="id" value="<%=(id!=null)?id:""%>"></td>
				</tr>
				<tr>
					<td>Pwd</td>
					<td><input type="password" name="pwd" value=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="Login" onclick="loginCheck()">&nbsp;
							<input type="button" value="Sign-up" onClick="javascript:location.href='member.jsp'">
						</div>
					</td>
				</tr>
				<tr>
					<td align="center"><input type="button" value="Find Id" onclick="javascript:location.href=FindId.jsp"></td>
				</tr>
				<tr>
					<td align="center"><input type="button" value="Find Pwd"	 onclick="javascript:location.href=FindPwd.jsp"></td>
				</tr>
			</table>
		</form>
<%}%>
</div>
</body>






