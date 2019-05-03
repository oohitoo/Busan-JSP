<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String pwd1 = request.getParameter("password1");
	String pwd2 = request.getParameter("password2");

	if (pwd1.equals(pwd2)) {
%>
		<script>
			alert("수정성공")
			location.href = "shopMain.jsp"
		</script>
	<%} else {%>
		<script>
			alert("비밀번호가 일치하지 않습니다.")
			history.back();
		</script>
		
	<%}%>

	
