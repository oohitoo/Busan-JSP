<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String pwd1 = request.getParameter("password1");
	String pwd2 = request.getParameter("password2");

	if (pwd1.equals(pwd2)) {
%>
		<script>
			alert("��������")
			location.href = "shopMain.jsp"
		</script>
	<%} else {%>
		<script>
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
			history.back();
		</script>
		
	<%}%>

	
