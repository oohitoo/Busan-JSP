<jsp:useBean id="mgr" class="review.reviewMgr"/>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	int number = Integer.parseInt(request.getParameter("rnum"));
	String content = request.getParameter("content");
	
	boolean flag = mgr.reviewUpdate(number, content);
	if(flag){%>
	<script>
		alert("���䰡 �����Ǿ����ϴ�.");
		history.back();
	</script>
<%}else { %>
		<script>
		alert("������ �߻��߾��..�Ф�");
		history.back();
		</script>
<%} %>
