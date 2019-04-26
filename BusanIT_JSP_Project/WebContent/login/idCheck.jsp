<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="login.loginMgr"></jsp:useBean>
<%

	request.setCharacterEncoding("EUC-KR");
	String id=  request.getParameter("id");
	boolean result = mgr.checkId(id);
	String msg;
	 if(result)
	 msg="Already exist Id";
	 else msg="can use Id";
%>
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC" align="center"><br/>
<strong><%=id %></strong> <%=msg %>
<br/><br/>
<input type="button" onclick="self.close()"  value="Close" style="background-color:#FFFFCC; border:0px; size:15px;">
<!-- <a href="javascript:window.close()">닫기</a> -->
</body>
</html>

