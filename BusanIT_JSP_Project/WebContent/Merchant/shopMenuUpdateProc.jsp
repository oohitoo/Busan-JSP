<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>
<jsp:useBean id="mBean" class="menu.menuBean"/>
<jsp:setProperty property="*" name="mBean"/>
<%	request.setCharacterEncoding("EUC-KR");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	menuMgr.deleteMenu(idx);
%>
<script type="text/javascript">
/* alert("�����Ǿ����ϴ�."); */
location.href = "shopMenuUpdate.jsp"
</script>