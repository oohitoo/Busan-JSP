<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />
<jsp:useBean id="bean" class="menu.ordersBean" />
<jsp:setProperty property="*" name="bean" />
<%
	request.setCharacterEncoding("EUC-KR");
	if (request.getParameter("oRequest") == null)
		bean.setoRequest("����");

	//oDateó�� �κ�
	String date = request.getParameter("oDate");
	String hour = request.getParameter("hour").substring(0, 2);
	String min = request.getParameter("min").substring(0, 2);
	bean.setoDate(date + " " + hour + ":" + min + ":00");

	//id, cNick, rName�� ����
	String id = request.getParameter("id");
	String cNick = request.getParameter("cNick");
	String rName = request.getParameter("rName");

	bean.setId(id);
	bean.setcNick(cNick);
	bean.setrName(rName);

	//�ֹ���ȣ�� �ۼ��ϱ� ���� ���ǰ� ������.
	String orderNum = session.getId().substring(session.getId().length() - 5, session.getId().length());

	bean.setoNum(orderNum);
		
	bean.setOrderType("����");
	bean.setOrderStatus("����");

	String msg = "���࿡ �����Ͽ����ϴ�.";
	String location = "reserve.jsp";
	boolean result = mgr.insertreserve(bean);
	if (result) {
		msg = "���࿡ �����Ͽ����ϴ�.";
		location = "../Index.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>

