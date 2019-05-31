<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="Service.UtilMgr"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	String oDate = request.getParameter("oDate");
	Vector<ordersBean> list = mgr.reserveDetail(id,oDate);
	String  orderType=null,name=null,cPhone=null;
	int totalPrice = 0,count=0;
	String oRequest=null;
	
	
%>
<jsp:include page="designForm.jsp" />
<script>
	function back() {
		history.back();
	}
</script>

<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row" style="margin-left: 10px; margin-top: 50px;">
		<span style="font-size: 2.0em; color: navy"><strong>예약 상세 정보</strong></span>
			<table style="width: 700px">
					<div><br /><br /><br /></div>
					<tr align="center" style="font-size: 2.0em; color: #486CDA;">
				<% 	
					for(int i=0;i<1;i++){
						ordersBean obean = list.get(i);
				%>
					<td style="padding-left: 75px"><%=obean.getrName() %></td>
				</tr>
				<% } %>
			</table>
			<table class="table table" style="width: 900px;">
				<thead>
					<tr style="color: black">
						<th width="456px">방문하실 날짜</th>
						<th width="100px">예&nbsp;약&nbsp;인&nbsp;원</th>
						<th colspan="2" class="text-center" width="126px">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(int i=0; i<list.size();i++){
							ordersBean bean = list.get(i);
							orderType = bean.getOrderType();
							oRequest = bean.getoRequest();
							name = bean.getcNick();
							count = bean.getCount();
							cPhone = bean.getcPhone();
					%>
					<tr>
						<td>
							<div class="media">
								<div class="media-body">
									<h4 class="media-heading" style="margin-top: 10px;">
										<font color="black"><%=oDate %></font>
									</h4>
								</div>
							</div>
						</td>
						<td align="center">
							<h4 class="media-heading" style="margin-top: 10px;"><%=count %>명<h4>
						</td>
						<td colspan="2" align="center">
							<h4 class="media-heading" style="margin-top: 10px;"><%=cPhone %></h4>
						</td>
					</tr>
					<%} %>
					<tr>
						<td colspan="4">예약자 성함 : <%=name %></td>
					</tr>
					<tr>
						<td colspan="4">요청 사항 : <%=oRequest %></td>
					</tr>
					<tr>
						<td align="right">
							<button type="button" class="btn btn-primary"
								onclick="javascript:back()" style="cursor: pointer">뒤&nbsp;로</button>
						</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>