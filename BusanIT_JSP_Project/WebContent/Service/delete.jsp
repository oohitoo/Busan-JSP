<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="Service.ServiceBean"%>
<%@page import="Service.ServiceMgr"%>
<jsp:include page="list.jsp" />
<!--�� ����������  -->
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
			if(inPass == dbPass){
				ServiceMgr mgr = new ServiceMgr();
				mgr.deleteService(num);
				new ServiceMgr().deleteService(num);
				String url = "Service.jsp?nowPage" + nowPage;
				response.sendRedirect(url);
			}else{
			%>
			<script type = "text/javascript">
				alert("�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
				history.back();
			</script>
			<%
			}
		}else{
%>
<title>�� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("�н����带 �Է��ϼ���.");
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
			<td height="21" align="center">
				������� ��й�ȣ�� �Է����ּ���.
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
							<td><hr size="10" color="#eeeeee"/></td>
						</tr>
						<tr>
							<td align="center">
								<input type="button" value="�����Ϸ�" onClick="check()"> 
								<input type="reset" value="�ٽþ���">
								<input type="button" value="�ڷ�" onClick="history.go(-1)">
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