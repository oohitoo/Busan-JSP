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
			alert("��������")
			location.href = "shopMain.jsp"
			</script>			
		<%}else{%>
			<script>
			alert("��й�ȣ ���濡 �����Ͽ����ϴ�.")
			history.back();
		</script>
		<%}%>
		
	<%}else{%>
		<script>
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
			history.back();
		</script>
	<%}%>