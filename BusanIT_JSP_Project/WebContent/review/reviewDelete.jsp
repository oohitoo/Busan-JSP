<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="review.reviewMgr"/>

<%

		if(request.getParameter("rnum")!=null){
			int num=Integer.parseInt(request.getParameter("rnum"));	
			mgr.reviewDelete(num);
		}
			//response.sendRedirect("review.jsp");
	
%>
<script>
	location.href="http://localhost/BusanIT_JSP_Project/item/privateShop.jsp";
</script>