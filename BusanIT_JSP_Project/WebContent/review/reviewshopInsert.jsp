<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" class="review.reviewBean"/>
<jsp:useBean id="mgr" class="review.reviewMgr"/>
<jsp:setProperty property="*" name="bean"/>
<%
	String rId = (String)session.getAttribute("idKey");
	String myNick = mgr.getcNick(rId);

	String businessId = (String) session.getAttribute("businessid");
	String shopName = (String)session.getAttribute("shop");
	String odate = request.getParameter("oDate");
	String comment = request.getParameter("comment");
	bean.setShopName(shopName);
	bean.setrContent(comment);
	bean.setrId(businessId);
	bean.setoDate(odate);
	
	
	mgr.insertreview(bean, shopName);
	
%>

		
<script>
 	alert("입력완료");
	history.back(); 
</script>