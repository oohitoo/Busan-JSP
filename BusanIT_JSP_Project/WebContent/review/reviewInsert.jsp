<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bean" class="review.reviewBean"/>
<jsp:useBean id="mgr" class="review.reviewMgr"/>
<jsp:setProperty property="*" name="bean"/>
`<%
	//전송된 객체를 받는다
/* 	int num = Integer.parseInt(request.getParameter("num"));
	String id = request.getParameter("Id");
	String subject = request.getParameter("subject");
	String content 	= request.getParameter("content");
	String regdate = request.getParameter("regdate");   */
	//System.out.print(bean.getrSubject());
	
	mgr.insertreview(bean);		
	
 	String msg="작성하였습니다";
	//boolean result = mgr.insertreview(bean);

%>

		
<script>
 	alert("입력완료");
	location.href = "http://localhost/BusanIT_JSP_Project/item/privateShop.jsp";
</script>