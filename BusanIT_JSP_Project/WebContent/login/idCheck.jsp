<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	boolean result = mgr.checkId(id);
	String msg;
	if (result)
		msg = "는 이미 존재하는 ID입니다.";
	else
		msg = "는 사용 가능합니다.";
%>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
<body bgcolor="#FFFFCC" align="center">
	<br />
	<strong><%=id%></strong>
	<%=msg%>
	<br />
	<br />
	<input type="button" onclick="self.close()" value="닫기" style="background-color: #FFFFCC; border: 0px; size: 15px;">
</body>
</html>