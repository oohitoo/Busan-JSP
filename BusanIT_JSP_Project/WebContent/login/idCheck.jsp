<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	boolean result = mgr.checkId(id);
	String msg;
	if (result)
		msg = "�� �̹� �����ϴ� ID�Դϴ�.";
	else
		msg = "�� ��� �����մϴ�.";
%>
<title>ID �ߺ�üũ</title>
<link href="style.css" rel="stylesheet" type="text/css">
<body bgcolor="#FFFFCC" align="center">
	<br />
	<strong><%=id%></strong>
	<%=msg%>
	<br />
	<br />
	<input type="button" onclick="self.close()" value="�ݱ�" style="background-color: #FFFFCC; border: 0px; size: 15px;">
</body>
</html>