<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="Service.UtilMgr"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	int end = 10, a=0;
	String orderStatus = "";
	if(request.getParameter("end")!=null){
		if(Integer.parseInt(request.getParameter("end"))>0){
			a = Integer.parseInt(request.getParameter("end"));
		}
		end += a;
	}
%>
<jsp:include page="designForm.jsp" />
<!------ Include the above in your HEAD tag ---------->
<script>
	function no(onum) {
		location.href = "orderdetail.jsp?oNum=" + onum;
	}
	function plus(end){
		document.readFrm.end.value= <%=end%>;
		document.readFrm.submit();
	}
</script>

<div class="container-fluid">
	<div class="panel panel-success"
		style="margin-left: 10px; margin-top: 50px; width: 850px;">
		<div class="panel-heading">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<h2 class="text-center pull-left" style="padding-left: 30px; color:black">
						<span style=" color: navy"><strong>주문 내역</strong></span>
					</h2>
				</div>

			</div>
		</div>

		<div class="panel-body table-responsive">
			<table class="table table-hover">
				<thead>
					<tr style="color: black">
						<th class="text-center">번호</th>
						<th class="text-center">주문날짜</th>
						<th class="text-center">식당이름</th>
						<th class="text-center">메뉴</th>
						<th class="text-center">가격</th>
						<th class="text-center">주문 상태</th>
					</tr>
				</thead>
				<tbody>
					<%
						//얻은 오더넘버로 주문목록 정보 얻기
						Vector<ordersBean> list = mgr.orderList(id, end);
						
						if (list.isEmpty()) {
					%>
					<tr>
						<td colspan="5">주문내역이 없습니다.</td>
					</tr>
					<%
						} else {

							for (int i= 0; i < list.size(); i++) {
								ordersBean bean = list.get(i);
								
								switch (bean.getOrderStatus()){
								case "2" :
									orderStatus = "배달 준비중";
									break;
								case "3" :
									orderStatus = "배달 중";
									break;
								case "4" :
									orderStatus = "배달 완료";
									break;
								default : 
									orderStatus = "결재 완료";	
									break;
								}
								
					%>
					<tr class="edit" id="detail" onclick="javascript:no('<%=bean.getoNum()%>')" style="cursor: pointer">
						<td id="no" class="text-center"><%=i+1%></td>
						<td id="name" class="text-center"><%=bean.getoDate().substring(5, 7) + "월 " + bean.getoDate().substring(8, 10) + "일"%></td>
						<td id="mobile" class="text-center"><%=bean.getrName()%></td>
						<td id="mail" class="text-center"><%=bean.getMenu()%></td>
						<td id="city" class="text-center"><%=UtilMgr.monFormat(bean.getTotalPrice())%></td>
						<td id="status" class="text-center"><%=orderStatus%></td>
					</tr>
					<%							
					} //for
						} //if
					%>
				</tbody>
				
			</table>
			<table width="800px">
				<tr align ="center">
					<td><input type="button" class="btn btn-primary" value="더보기" onclick="javascript:plus('<%=end%>')"></td>
				</tr>
			</table>
			<form name="readFrm" action="">
				<input type="hidden" name="end" value=<%=end%>>	
			</form>
			<!-- 페이징 처리-->
		</div>

	</div>
</div>