<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"></jsp:useBean>
<%

	request.setCharacterEncoding("EUC-KR");
	String id=  request.getParameter("id");
	boolean result = mgr.checkId(id);
	String msg;
	 if(result)
	 msg="�� �̹� �����ϴ� ID�Դϴ�.";
	 else msg="�� ��� �����մϴ�.";
%>
<html>
<head>
<title>ID �ߺ�üũ</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC" align="center"><br/>
<strong><%=id %></strong> <%=msg %>
<br/><br/>
<input type="button" onclick="self.close()"  value="�ݱ�" style="background-color:#FFFFCC; border:0px; size:15px;">
<!-- <a href="javascript:window.close()">�ݱ�</a> -->
</body>
</html>

