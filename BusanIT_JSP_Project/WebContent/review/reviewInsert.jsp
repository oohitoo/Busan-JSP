<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" class="review.reviewBean"/>
<jsp:useBean id="mgr" class="review.reviewMgr"/>
<jsp:setProperty property="*" name="bean"/>
`<%
	//���۵� ��ü�� �޴´�
/* 	int num = Integer.parseInt(request.getParameter("num"));
	String id = request.getParameter("Id");
	String subject = request.getParameter("subject");
	String content 	= request.getParameter("content");
	String regdate = request.getParameter("regdate");   */
	//System.out.print(bean.getrSubject());
	String rId = (String)session.getAttribute("idKey");
	String shopName = (String)session.getAttribute("store");
	bean.setrId(rId);
	mgr.insertreview(bean, shopName);		
	
%>

		
<script>
 	alert("�Է¿Ϸ�");
	location.href = "../item/privateShop.jsp?store=<%=shopName%>"; 
</script>