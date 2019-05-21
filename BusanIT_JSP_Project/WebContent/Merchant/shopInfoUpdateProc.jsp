<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="shoplogin.loginBean"/>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	boolean flag = mgr.ShopimageUpdateFile(request);
%>