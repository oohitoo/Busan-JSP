<%@page import="review.reviewBean"%>
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
<jsp:useBean id="rmgr" class="review.reviewMgr" />
<jsp:useBean id="rbean" class="review.reviewBean" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	String oNum = request.getParameter("oNum");
	Vector<ordersBean> list = mgr.orderDetail(id,oNum);
	String  orderType=null,oRequest=null, orderStatus = null, oDate = null;
	int totalPrice = 0;
	
	
	
%>

<jsp:include page="designForm.jsp" />
<script>
	function back() {
		history.back();
	}
	function no(onum) {
		location.href = "orderdetailProc.jsp?oNum=" + onum;
	}
	function review() {
		location.href = "../review/reviewwrite.jsp";
	}
    function reviewDelete(number){
        location.href ="../review/reviewDelete.jsp?rnum="+number;
      }
    function shopinfo(store) {
    	location.href = "../item/privateShop.jsp?store="+store;
    }
</script>

<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row" style="margin-left: 10px; margin-top: 50px;">
		<span style="font-size: 2.0em; color: navy"><strong>주문
				상세 정보</strong></span>
		<table style="width: 700px">
			<div>
				<br />
				<br />
				<br />
			</div>
			<tr align="center" style="font-size: 2.0em; color: #486CDA;">
				<% 	for(int i=0;i<1;i++){
			ordersBean obean = list.get(i);
			session.setAttribute("shop",obean.getrName());
%>
				<td style="padding-left: 75px" >
					<a onclick="javascript:shopinfo('<%=obean.getrName()%>')" style="cursor : pointer; text-decoration:none;"><%=obean.getrName() %></a>
				</td>
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
		orderStatus = bean.getOrderStatus();
		oDate = bean.getoDate();
		
%>
				<tr>
					<td>
						<div class="media">
							<%if(bean.getmImg()!=null){ %>
							<a class="thumbnail pull-left"> <img class="media-object"
								src="../img/menuImg/<%=bean.getmImg() %>"
								style="width: 72px; height: 72px;">
							</a>
							<%}else{ %>
							<a class="thumbnail pull-left"> <img class="media-object"
								src="../img/menuImg/ready.gif"
								style="width: 72px; height: 72px;">
							</a>
							<%} %>
							<div class="media-body">
								<h4 class="media-heading" style="margin-top: 20px;">
									<font color="black"><%=bean.getMenu() %></font>
								</h4>

							</div>
						</div>
					</td>
					<td align="center"><strong><%=bean.getCount()%></strong></td>
					<td align="center"><strong><%=UtilMgr.monFormat(bean.getmPrice())  %></strong></td>
					<td align="center"><h5>
							<strong><%=UtilMgr.monFormat(bean.getTotalPrice()) %></strong>
						</h5></td>
				</tr>
				<%} %>
				<tr>

					<td>주문 시간 : <%=oDate.subSequence(0, 16) %></td>
					<td>배달 형태</td>
					<td align="right" colspan="2"><strong
						style="padding-right: 40px;'"><%=orderType %></strong></td>
				</tr>
				<tr>
					<td>요청 사항 : <%=oRequest %></td>
					<td colspan="2"><h4>주문금액</h4></td>
					<td align="center"><h4>
							<strong><%=UtilMgr.monFormat(totalPrice)+"원"  %></strong>
						</h4></td>
				</tr>
				<tr>
					<td align="right">
						<button type="button" class="btn btn-primary"
							onclick="javascript:back()" style="cursor: pointer">뒤&nbsp;로</button>
						<%if(orderStatus.equals("1")){
						%>
						<button type="button" class="btn btn-primary"
							onclick="javascript:no('<%=oNum%>')" style="cursor: pointer">취&nbsp;소</button>
						<% } %>

					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>

		<% if (orderStatus.equals("4") || orderStatus.equals("6")) {
					rbean = rmgr.checkReview(id, oDate);
					if(rbean.getoDate()  != null && rbean.getoDate().equals(oDate)){	 
			%>


		<div class="panel panel-primary filterable" style="margin-left: 103px">
			<table class="table">
			<%
		             int rnum = rbean.getrNum();
		             int rStar = rbean.getrStar();
		             String rcontent = rbean.getrContent();
		             String rregdate = rbean.getrRegdate().substring(0, 10);
		             String rNick = rbean.getrNick();   
		    %>
				<tr class="filters">
					<td width="70"><img src="../img/Logo_21.png"
						width="height=66px"></td>
					<td style="width: 100px;" align="center"><%=rNick%></td>
					<td width="322px;" align="left"><p><%=rcontent %></p></td>
					<td>
						<%if(rStar==1){ %>★☆☆☆☆<%} %> <%if(rStar==2){ %>★★☆☆☆<%} %> <%if(rStar==3){ %>★★★☆☆<%} %>
						<%if(rStar==4){ %>★★★★☆<%} %> <%if(rStar==5){ %>★★★★★<%} %>
					</td>
					<td style="width: 120px;" align="right"><%=rregdate%>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<button type="button" class="btn btn-primary" onClick="javascript:reviewDelete(<%=rnum%>)" style="cursor: pointer">삭&nbsp;제</button>
					</td>
				</tr>
			</table>
		</div>
		<%}else { %>
		<jsp:include page="../review/reviewwrite.jsp">
				<jsp:param value="<%=oDate%>" name="oDate"/>
			</jsp:include>
		<%	}//--리뷰작성 확인 if
				}//--배달상태 확인 if
		%>
	</div>
</div>
