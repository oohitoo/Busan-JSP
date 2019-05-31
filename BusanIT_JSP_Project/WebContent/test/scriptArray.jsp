<%@page import="test.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="test.OrderMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<OrderBean> vlist = mgr.getOrder();
%>
<script>
	var aoNum = new Array();
	var aoName = new Array();
	var aoStore = new Array();
	var aoCount = new Array();
</script>
<%
		for(int i=0; i<vlist.size();i++){
			OrderBean bean = vlist.get(i);
%>
			<script>
				aoNum.push(<%=bean.getoNum()%>);
				aoName.push("<%=bean.getoName()%>");
				aoStore.push("<%=bean.getoStore()%>");
				aoCount.push(<%=bean.getoCount()%>);
			</script>
<%}%>
<script>
	document.write(aoNum[0]+"<br/>");
	document.write(aoName[0]+"<br/>");
	document.write(aoStore[0]+"<br/>");
	document.write(aoCount[0]+"<br/>");
</script>