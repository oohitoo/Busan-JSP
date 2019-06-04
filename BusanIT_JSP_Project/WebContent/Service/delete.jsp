<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="Service.ServiceBean"%>
<%@page import="Service.ServiceMgr"%>
<jsp:include page="form.jsp" />
<html>
<head>
<%
		request.setCharacterEncoding("EUC-KR");
		int num = Integer.parseInt(request.getParameter("num"));
		String nowPage = request.getParameter("nowPage");
		if(request.getParameter("pass")!=null) {
			ServiceBean bean = (ServiceBean)session.getAttribute("bean");
			String inPass = request.getParameter("pass");
			String dbPass = bean.getPass();
			if(inPass.equals(dbPass)){
				new ServiceMgr().deleteService(num);
				String url = "ServiceMain.jsp?nowPage" + nowPage;
				response.sendRedirect(url);
			}else{
			%>
			<script type = "text/javascript">
				alert("입력하신 비밀번호가 아닙니다.");
				history.back();
			</script>
			<%
			}
		}else{
%>
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body>
<div align="center"><br/><br/>
	<table width="100%" cellspacing="0" cellpadding="3">
		<tr>
			<td>
				사용자의 비밀번호를 입력해주세요.
			</td>
		</tr>
	</table>
	<form name="delFrm" method="post">
		<table width="70%" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center">
					<table width=80%>
						<tr>
							<td align="center">
								<input type="password" name="pass" size="17" maxlength="15">
							</td>
						</tr>
						<tr>
							<td><hr size="1" color="#eeeeee"/></td>
						</tr>
						<tr>
							<td align="center">
								<input type="button" value="삭제완료" class="btn btn-primary" onClick="check()"> 
								<input type="button" value="뒤로" class="btn btn-primary" onClick="history.go(-1)">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</div>
	<%}%>
</body>
</html>