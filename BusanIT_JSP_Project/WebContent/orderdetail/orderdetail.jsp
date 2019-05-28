<%@page import="Service.UtilMgr"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	String oDate = request.getParameter("oDate");
	Vector<ordersBean> list = mgr.orderDetail(id,oDate);
	String  orderType=null;
	int totalPrice = 0;
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
		<span style="font-size: 2.0em; color: navy"><strong>주문 상세 정보</strong></span>
			<table style="width: 700px">
				<div>
					<br/><br/><br/>
				</div>
				<tr align="center" style="font-size: 2.0em; color: #486CDA;">
<% 	for(int i=0;i<1;i++){
			ordersBean obean = list.get(i);
%>
					<td style="padding-left:75px"><%=obean.getrName() %></td>
				</tr>
<% } %>
			</table>
			<table class="table table" style="width: 900px;">
				<thead>
					<tr style="color: black">
						<th width="456px">메뉴</th>
						<th width="100px">주&nbsp;문&nbsp;량</th>
						<th class="text-center" width="126px">가격</th>
						<th class="text-center" width="130px">소계</th>		
					</tr>
				</thead>
				<tbody>
<%
	for(int i=0; i<list.size();i++){
		ordersBean bean = list.get(i);
		orderType = bean.getOrderType();
		totalPrice += bean.getTotalPrice();
		oRequest = bean.getoRequest();
		
		
%>
					<tr>
						<td >
							<div class="media">
							<%if(bean.getmImg()!=null){ %>
								<a class="thumbnail pull-left" > 
									<img class="media-object" src="../img/menuImg/<%=bean.getmImg() %>" style="width: 72px; height: 72px;">
								</a>
								<%}else{ %>
								<a class="thumbnail pull-left" > 
									<img class="media-object" src="../img/menuImg/ready.gif" style="width: 72px; height: 72px;">
								</a>
								<%} %>
								<div class="media-body">
									<h4 class="media-heading" style="margin-top : 20px;">
										<font color="black"><%=bean.getMenu() %></font>
									</h4>
									
								</div>
							</div>
						</td>
						<td align="center" ><strong><%=bean.getCount()%></strong></td>
						<td align="center" ><strong><%=UtilMgr.monFormat(bean.getmPrice())  %></strong></td>
						<td align="center" ><h5><strong><%=UtilMgr.monFormat(bean.getTotalPrice()) %></strong></h5></td>
					</tr>
<%} %>
					<tr>
					
						<td >주문 시간 : <%=oDate.subSequence(0, 16) %></td>
						<td >배달 형태</td>
						<td align="right" colspan="2"><strong><%=orderType %></strong></td>
					</tr>
					<tr>
						<td>요청 사항  :  <%=oRequest %></td>
						<td colspan="2"><h4>주문금액</h4></td>
						<td align="center" ><h4> <strong><%=UtilMgr.monFormat(totalPrice)+"원"  %></strong></h4></td>
					</tr>
					<tr>
					<td align="right">
						<button type="button" class="btn btn-primary" onclick="javascript:back()" style="cursor:pointer">뒤&nbsp;로</button>
						
					</td>
					<td></td>
					<td></td>
					<td></td>
				
				</tr>
				</tbody>
			
			</table>
		</div>
	</div>

