<jsp:useBean id="mgr" class="review.reviewMgr"/>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	int number = Integer.parseInt(request.getParameter("rnum"));
	String content = request.getParameter("content");
	
	boolean flag = mgr.reviewUpdate(number, content);
	if(flag){%>
	<script>
		alert("리뷰가 수정되었습니다.");
		history.back();
	</script>
<%}else { %>
		<script>
		alert("오류가 발생했어요..ㅠㅠ");
		history.back();
		</script>
<%} %>
