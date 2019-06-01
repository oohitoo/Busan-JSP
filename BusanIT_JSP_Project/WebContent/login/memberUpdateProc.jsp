<!-- memberUpdateProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR") ;%>
<jsp:useBean id="mgr" class="login.LoginMgr"/>
<jsp:useBean id="bean" class="login.LoginBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
	String caddress1 = request.getParameter("caddress1");
	String caddress2 = request.getParameter("caddress2");
	out.println(caddress1);
	out.println(caddress2);
	bean.setcAddress(caddress1 + caddress2);
	boolean result = mgr.updateCustomer(bean);
	if(result) {
%>

	<script>
		alert("회원정보를 수정 하였습니다.");
		location.replace("../Index.jsp");
		</script>	
	<%} else{%>

		<script>
		   alert("회원정보 수정 실패하였습니다.");
		  history.back();
		</script>
		
	<%} %>
