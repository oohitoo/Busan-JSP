<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="shoplogin.loginBean"/>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	boolean flag = mgr.ShopimageUpdateFile(request);
	String msg = "정보 수정에 실패했습니다.";
	String href= "shopInfoUpdate.jsp";
	if(flag){
		msg ="정보 수정에 성공했습니다.";
		href= "shopMain.jsp";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=href%>";
</script>