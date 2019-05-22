<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>
<jsp:useBean id="mBean" class="menu.menuBean"/>
<jsp:setProperty property="*" name="mBean"/>
<%	request.setCharacterEncoding("EUC-KR");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	menuMgr.deleteMenu(idx);
%>
<script type="text/javascript">
/* alert("삭제되었습니다."); */
location.href = "shopMenuUpdate.jsp"
</script>