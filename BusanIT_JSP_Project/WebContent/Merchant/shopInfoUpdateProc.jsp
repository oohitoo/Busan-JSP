<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="shoplogin.loginBean"/>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");
	String businessId = (String) session.getAttribute("businessId");
	
	if (pwd.equals(pwd2)) {
		boolean flag = mgr.updateShopInfo(pwd, businessId);
		if(flag){
			%>
			<script>
			alert("수정성공")
			location.href = "shopMain.jsp"
			</script>			
		<%}else{%>
			<script>
			alert("비밀번호 변경에 실패하였습니다.")
			history.back();
		</script>
		<%}%>
		
	<%}else{%>
		<script>
			alert("비밀번호가 일치하지 않습니다.")
			history.back();
		</script>
	<%}%>