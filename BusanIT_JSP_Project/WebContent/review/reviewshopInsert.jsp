<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%request.setCharacterEncoding("EUC-KR");%>
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
	//소비자 아이디
	
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
 	<%-- alert(<%=businessId%>);
 	alert(<%=shopName%>);
 	alert(<%=odate%>);
 	alert(<%=comment%>); --%>
	history.back(); 
</script>