<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" class="review.reviewBean"/>
<jsp:useBean id="mgr" class="review.reviewMgr"/>
<jsp:setProperty property="*" name="bean"/>
<%
	String rId = (String)session.getAttribute("idKey");
	String myNick = mgr.getcNick(rId);
	bean.setrId(rId);
	mgr.insertreview(bean, myNick);
%>

		
<script>
  	alert("리뷰가 작성되었습니다.");
 	location.href = "../item/privateShop.jsp?store=<%=bean.getShopName()%>"; 
</script>