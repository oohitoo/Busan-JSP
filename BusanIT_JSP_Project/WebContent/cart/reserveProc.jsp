<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />
<jsp:useBean id="bean" class="menu.ordersBean" />
<jsp:setProperty property="*" name="bean" />
<%
	request.setCharacterEncoding("EUC-KR");
	if (request.getParameter("oRequest") == null)
		bean.setoRequest("없음");

	//oDate처리 부분
	String date = request.getParameter("oDate");
	String hour = request.getParameter("hour");
	String min = request.getParameter("min");	
	bean.setoDate(date + " " + hour + ":" + min + ":00");

	//id, cNick, rName를 받음
	String id = request.getParameter("id");
	String cNick = request.getParameter("name");
	String rName = request.getParameter("rName");

	bean.setId(id);
	bean.setcNick(cNick);
	bean.setrName(rName);

	//주문번호를 작성하기 위해 세션값 가져감.
	String orderNum = session.getId().substring(session.getId().length() - 5, session.getId().length());

	bean.setoNum(orderNum);
		
	bean.setOrderType("예약");
	bean.setOrderStatus("예약");

	String msg = "예약에 실패하였습니다.";
	String location = "reserve.jsp";
	boolean result = mgr.insertreserve(bean);
	if (result) {
		msg = "예약에 성공하였습니다.";
		/* location = "../Index.jsp"; */
		location = "../orderdetail/reserveList.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>

