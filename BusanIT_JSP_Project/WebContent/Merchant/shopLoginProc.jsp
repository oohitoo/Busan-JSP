<%@ page import="shoplogin.loginMgr"%>
<%@ page import="shoplogin.loginBean"%>
<%@ page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<jsp:useBean id="loginBean" class="shoplogin.loginBean"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String businessid = request.getParameter("businessid");
	String pwd = request.getParameter("pwd");
	String msg = "�α��ο� �����ϼ̽��ϴ�.";
	String href = "shoplogin.jsp";
	
	boolean flag = mgr.loginShop(businessid, pwd);
	if(flag){
		
		loginBean bean = mgr.shopInfo(businessid);
		session.setAttribute("name", bean.getBsnsNm());
		session.setAttribute("businessid", businessid);
		msg= "�α��� ����";
		href="shopMain.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=href%>";
</script>
	