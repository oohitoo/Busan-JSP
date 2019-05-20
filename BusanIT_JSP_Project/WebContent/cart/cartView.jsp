<%@page import="login.LoginBean"%>
<%@page import="menu.menuBean"%>
<%@page import="Service.UtilMgr"%>
<%@page import="java.util.Enumeration"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Hashtable"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="menu.CartMgr"/>
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>
<jsp:useBean id="loginMgr" class="login.LoginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey"); 
	
	if(id == null){
		%>
		<script>
			alert("로그인 후 사용 바랍니다.");
			location.href ="../login/login.html";
		</script>
		<%
	}
	int num = 1;
%>
<jsp:include page="designForm.jsp" />
<%-- <%@ include file="desienTest.jsp"%> --%>

<script	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script>
	function creatUpdate(menu, num) {
		var count = document.getElementById("count" + num).value;
		
		location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=update&count="+count; 
	}
	function creatdelete(menu, num) {
		var count = document.getElementById("count" + num).value;
		location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=del&count="+count; 
	}
	/* Order proc로 넘기기 */
	function order() {
		/*  1. 테이블의 td는 tageName으로 자르기 
			2. split을 이용하여 자른다.
			3. 출력한다.
		*/
		/* var str = document.getElementsByTagName('td')[8].childNodes[0].nodeValue; */
		var str = document.getElementById("minimum").value;
		var strsplit = str.split(',');
		console.log(str);
		console.log(strsplit);
		if(parseInt(strsplit[0]) <= "13"){
			var popupX = (window.screen.width / 2);
			var popupY = (window.screen.height / 2);
			console.log("여기");
			/* alert("최소 주문 금액을 맞춰주세요."); */
			url = "orderMinium.html";
			window.open(url, "orderMinium", "width=400, height=190, resizable=no, left="+ popupX + ",top="+ popupY);
		}
		else{
			var addres = document.getElementById("addres").value;
			var phoneNumber = document.getElementById("phoneNumber").value;
			var request = document.getElementById("request").value;
			var Box = document.getElementById("payType");
			var selectBox = Box.options[Box.selectedIndex].value;
			
			console.log(selectBox);
			location.href = "orderProc.jsp?addres="+addres+"&phoneNumber="+phoneNumber+"&request="+request+"&selectBox="+selectBox;
		}
	}
	function reset() {
		addres = document.getElementById("addres").value ="";
		phoneNumber = document.getElementById("phoneNumber").value = "";
		request = document.getElementById("request").value ="";
		Box = document.getElementById("payType") = "";
	}
	function back() {
		history.back();
	}
</script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row" style="margin-left: 10px; margin-top: 50px;">
		<span style="font-size: 2.0em; color: navy">주문자 정보</span>
		<table class="table table-hover" style="width: 900px;">			
			<thead>
				<tr>
					<th>주문목록 ( 가게명 )</th>
					<th>주&nbsp;문&nbsp;량</th>
					<th class="text-center">Price</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<!-- 반복 돌리기 끝  -->
			<%
				int total = 0; //전체값
				int subTotal =0;
				Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
				
				if(hCart.isEmpty()){
			%>
				<tr>
					<td colspan="4" style="text-align: center;">장바구니 목록이 없습니다.</td>
				</tr>
			<% }else{			
				// 줄줄이 사탕 객체
				Enumeration<String> hCartKey = hCart.keys();
				// 요소 값이 더이상 있을때 까지
				while(hCartKey.hasMoreElements()){
					
					String shop = (String)session.getAttribute("store"); // 가게 명
					//hCart에 저장된 주문 객체를 return 
					menu.ordersBean order = hCart.get(hCartKey.nextElement());
					String menuName = order.getMenu();
					//상품 객체(상품 가격, 상품 이름)								
					menuBean bean = menuMgr.getmenuBean(shop, menuName);
					int price = bean.getmPrice(); // 상품 가격
					int count = order.getCount(); // 주문수량
					subTotal = count * price; // 상품 총액
					total += subTotal; // 주문전체 총액
			%>
				<tr>
					<td class="col-sm-8 col-md-6">
						<div class="media">
							<a class="thumbnail pull-left" href="#" style="width: 90px; height: 90px;">
								<img class="media-object" src="../img/menuImg/ready.gif" style="width: 72px; height: 72px;">
							</a>
							<div class="media-body">
								<!-- 메뉴 이름 -->
								<h4 class="media-heading">
									<a href="#"><%= menuName %></a> 
								</h4>
								<!-- 가게명 -->
								<h5 class="media-heading">
									by <a href="#"><%= shop %></a>
								</h5>
								<span>배달 예정 시간 :</span>
									<span class="text-success">
										<strong>50분</strong>
									</span>
							</div>
						</div>
					</td>
					<td class="col-sm-1 col-md-1" style="text-align: center">
						<input type="text" class="form-control" id="count<%=num %>" value="<%= count %>">
					</td>
					<td class="col-sm-1 col-md-1 text-center">
						<strong><%= price %></strong>원
					</td>
					<td class="col-sm-1 col-md-1">
						<p align="center">
							<!-- <button type="button" class="btn btn-danger">Remove</button> -->
							<input type="button" value = "수정" size="3" onclick = "javascript:creatUpdate('<%= menuName%>', '<%= num%>')">
							<input type="button" value = "삭제" size="3" onclick = "javascript:creatdelete('<%= menuName%>', '<%= num%>')">
						</p>
					</td>
				</tr>
				<% num++; } // while 끝
				
					LoginBean loginBean = loginMgr.getCustomer(id);
				%>					
				<!-- 반복 돌리기 끝  -->
				<tr>
					<td align="right">주소 </td>
					<td colspan="3" align="right">
						<input type="text" id="addres" size="40" value="<%= loginBean.getcAddress() %>" style="vertical-align:middle;">
					</td>
					<td>
					</td>
					
				</tr>
				<!-- 배달지 정보 -->
				<tr>
					<td align="right">전화번호</td>
					<td colspan="3" align="right">
						<input type="tel" id="phoneNumber" size="20" value="<%= loginBean.getcPhone() %>">
					</td>
					<td></td>
				</tr>
				<tr>
					<td align="right">요청사항</td>
					<td colspan="3" align="right">
						<input type="text" id="request" size="30" placeholder="30자리 까지 작성 할 수 있어요">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>결&nbsp;제&nbsp;방&nbsp;식</td>
					<td class="text-right">
							<select id="payType">
									<option value="만나서 카드결제" selected>만나서 카드결제</option>
									<option value="만나서 현금결제">만나서 현금결제</option>
									<option value="카드 결제">카드 결제</option>
									<option value="무통장 입금">무통장 입금</option>
							</select>
					</td>
				</tr>
				<!-- 배달지 정보  끝-->				
				<tr>
					<td></td>
					<td></td>					
					<td>주문금액</td>
					<td class="text-right">
						<input type="hidden" id="minimum" size="20" value="<%= UtilMgr.monFormat(total) %>">
						<h3><%= UtilMgr.monFormat(total) %> 원</h3>
					</td>
				</tr>
				<tr>
					<td align="right">
						<button type="button" class="btn btn-default" onclick="javascript:back()">뒤&nbsp;로</button>
						<button type="button" class="btn btn-success" onclick="javascript:order()">주문하기</button>
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<% } // else 끝 %>
			</tbody>
		</table>
	</div>
</div>