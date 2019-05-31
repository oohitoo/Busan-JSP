<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="login.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="lMgr" class="login.LoginMgr" />

<%
	
	request.setCharacterEncoding("EUC-KR");
	String shop = (String)session.getAttribute("store");
	String id = (String) session.getAttribute("idKey");
	LoginBean lBean = lMgr.getCustomer(id);
	
	 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 String today = formatter.format(new java.util.Date());
	
	if (id == null) {
%>
		<script>
			alert("로그인 후 사용 바랍니다.");
			location.href ="../login/login.html";
		</script>
		<%
	}
%>
<script>
	function menulist(menu) {
		console.log(menu);
		location.href = 'item/itemProc.jsp?menu=' + menu;
	}
	function check() {
		if(document.getElementsByName('name')[0].value <= 1){
			document.reserve.name.focus();
			return ;
		}
		if(document.getElementsByName('cPhone')[0].value <= 1){
			document.reserve.cPhone.focus();
			return ;
		}
		if(document.getElementsByName('oDate')[0].value <= 1){
			document.reserve.oDate.focus();
			return ;
		}
		if(document.getElementsByName('시간')[0].value <= 1){
			document.reserve.cPhone.focus();
			return ;
		}
		if(document.getElementsByName('분')[0].value <= 1){
			document.reserve.cPhone.focus();
			return ;
		}
		if(document.getElementsByName('인원수')[0].value <= 1){
			document.reserve.cPhone.focus();
			return ;
		}
		if(document.getElementsByName('oRequest')[0].value <= 1){
			document.reserve.oRequest.focus();
			return ;
		}
	}
</script>

<jsp:include page="designForm.jsp"/>
<div class="container">
	<div class="row">
		<div id="accordion" style="margin-left: 50px;">
			<table style="width: 700px; margin-left: 50px; margin-top: 50px;">
				<tr>
					<!-- 가게 이름 표시하는 곳 -->
					<td colspan="3"><h5><%=shop%></h5></td>
				</tr>
				<tr>
					<td rowspan="3" width="100px" height="100px">이미지</td>
					<td>최소 주문금액 13,000 원</td>
				</tr>
				<tr>
					<td>결제방식 : 카드, 현금</td>
				</tr>
				<tr>
					<td>평균 배달 시간 : 40분, 예약 : 0명</td>
				</tr>
				<tr>
					<td colspan="3">사장님 알림 메세지</td>
				</tr>
			</table>

			<form name="reserve" action="reserveProc.jsp">

				<table
					style="width: 800px; height: 350px; margin-left: 50px; margin-top: 50px;">
					<tr>
						<td style="width: 150px">
							<label class="text-primary">예약자
								성함 </label></td>
						<td>
						<input name="name" class="form-control"
							style="width: 200px"></td>
						<td style="width: 150px">
						<label class="text-primary">예약자
								전화번호</label></td>
						<td colspan="2">
						<input name="cPhone" class="form-control" value="<%=lBean.getcPhone()%>" style="width: 200px"></td>

					</tr>

					<tr>
						<td><label class="text-primary">예약 날짜 선택</label></td>
						<td><input type="date" name="oDate" class="form-control" style="width: 200px" value="<%=today%>"></td>
						<td><label class="text-primary">예약 시간 선택</label></td>
						<td width="120px;"><select name="hour" style="width: 100px" class="form-control">
								<option value="">시</option>
								<%
									for (int i = 11; i < 20; i++) {
								%>
								<option value="<%=i%>시"><%=i%>시
								</option>
								<%
									}
								%>
						</select></td>
						<td><select name="min" class="form-control"
							style="width: 100px">
								<option value="">분</option>
								<option value="00분">00분</option>
								<option value="30분">30분</option>
						</select></td>
					</tr>

					<tr>
						<td><label class="text-primary">예약 인원수</label></td>
						<td><select name="count" class="form-control"
							style="width: 201px">
								<option value="">인원 수</option>
								<%
									for (int i = 1; i < 10; i++) {
								%>
								<option value="<%=i%>"><%=i%>명
								</option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td><label class="text-primary">요청사항</label></td>
						<td colspan="3"><input name="oRequest" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="5" align="center"><input type="hidden"
							name="rName" value="<%=shop%>" /> <input type="hidden"
							name="id" value="<%=id%>" /> <input type="hidden" name="cNick"
							value="<%=lBean.getcNick()%>" /> 
							<input type="button" class="btn btn-primary btn-md" value="예약하기" onclick="javascript:check()"></td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</div>
