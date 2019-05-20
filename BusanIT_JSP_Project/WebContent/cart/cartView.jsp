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
			alert("�α��� �� ��� �ٶ��ϴ�.");
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
	/* Order proc�� �ѱ�� */
	function order() {
		/*  1. ���̺��� td�� tageName���� �ڸ��� 
			2. split�� �̿��Ͽ� �ڸ���.
			3. ����Ѵ�.
		*/
		/* var str = document.getElementsByTagName('td')[8].childNodes[0].nodeValue; */
		var str = document.getElementById("minimum").value;
		var strsplit = str.split(',');
		console.log(str);
		console.log(strsplit);
		if(parseInt(strsplit[0]) <= "13"){
			var popupX = (window.screen.width / 2);
			var popupY = (window.screen.height / 2);
			console.log("����");
			/* alert("�ּ� �ֹ� �ݾ��� �����ּ���."); */
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
		<span style="font-size: 2.0em; color: navy">�ֹ��� ����</span>
		<table class="table table-hover" style="width: 900px;">			
			<thead>
				<tr>
					<th>�ֹ���� ( ���Ը� )</th>
					<th>��&nbsp;��&nbsp;��</th>
					<th class="text-center">Price</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<!-- �ݺ� ������ ��  -->
			<%
				int total = 0; //��ü��
				int subTotal =0;
				Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
				
				if(hCart.isEmpty()){
			%>
				<tr>
					<td colspan="4" style="text-align: center;">��ٱ��� ����� �����ϴ�.</td>
				</tr>
			<% }else{			
				// ������ ���� ��ü
				Enumeration<String> hCartKey = hCart.keys();
				// ��� ���� ���̻� ������ ����
				while(hCartKey.hasMoreElements()){
					
					String shop = (String)session.getAttribute("store"); // ���� ��
					//hCart�� ����� �ֹ� ��ü�� return 
					menu.ordersBean order = hCart.get(hCartKey.nextElement());
					String menuName = order.getMenu();
					//��ǰ ��ü(��ǰ ����, ��ǰ �̸�)								
					menuBean bean = menuMgr.getmenuBean(shop, menuName);
					int price = bean.getmPrice(); // ��ǰ ����
					int count = order.getCount(); // �ֹ�����
					subTotal = count * price; // ��ǰ �Ѿ�
					total += subTotal; // �ֹ���ü �Ѿ�
			%>
				<tr>
					<td class="col-sm-8 col-md-6">
						<div class="media">
							<a class="thumbnail pull-left" href="#" style="width: 90px; height: 90px;">
								<img class="media-object" src="../img/menuImg/ready.gif" style="width: 72px; height: 72px;">
							</a>
							<div class="media-body">
								<!-- �޴� �̸� -->
								<h4 class="media-heading">
									<a href="#"><%= menuName %></a> 
								</h4>
								<!-- ���Ը� -->
								<h5 class="media-heading">
									by <a href="#"><%= shop %></a>
								</h5>
								<span>��� ���� �ð� :</span>
									<span class="text-success">
										<strong>50��</strong>
									</span>
							</div>
						</div>
					</td>
					<td class="col-sm-1 col-md-1" style="text-align: center">
						<input type="text" class="form-control" id="count<%=num %>" value="<%= count %>">
					</td>
					<td class="col-sm-1 col-md-1 text-center">
						<strong><%= price %></strong>��
					</td>
					<td class="col-sm-1 col-md-1">
						<p align="center">
							<!-- <button type="button" class="btn btn-danger">Remove</button> -->
							<input type="button" value = "����" size="3" onclick = "javascript:creatUpdate('<%= menuName%>', '<%= num%>')">
							<input type="button" value = "����" size="3" onclick = "javascript:creatdelete('<%= menuName%>', '<%= num%>')">
						</p>
					</td>
				</tr>
				<% num++; } // while ��
				
					LoginBean loginBean = loginMgr.getCustomer(id);
				%>					
				<!-- �ݺ� ������ ��  -->
				<tr>
					<td align="right">�ּ� </td>
					<td colspan="3" align="right">
						<input type="text" id="addres" size="40" value="<%= loginBean.getcAddress() %>" style="vertical-align:middle;">
					</td>
					<td>
					</td>
					
				</tr>
				<!-- ����� ���� -->
				<tr>
					<td align="right">��ȭ��ȣ</td>
					<td colspan="3" align="right">
						<input type="tel" id="phoneNumber" size="20" value="<%= loginBean.getcPhone() %>">
					</td>
					<td></td>
				</tr>
				<tr>
					<td align="right">��û����</td>
					<td colspan="3" align="right">
						<input type="text" id="request" size="30" placeholder="30�ڸ� ���� �ۼ� �� �� �־��">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>��&nbsp;��&nbsp;��&nbsp;��</td>
					<td class="text-right">
							<select id="payType">
									<option value="������ ī�����" selected>������ ī�����</option>
									<option value="������ ���ݰ���">������ ���ݰ���</option>
									<option value="ī�� ����">ī�� ����</option>
									<option value="������ �Ա�">������ �Ա�</option>
							</select>
					</td>
				</tr>
				<!-- ����� ����  ��-->				
				<tr>
					<td></td>
					<td></td>					
					<td>�ֹ��ݾ�</td>
					<td class="text-right">
						<input type="hidden" id="minimum" size="20" value="<%= UtilMgr.monFormat(total) %>">
						<h3><%= UtilMgr.monFormat(total) %> ��</h3>
					</td>
				</tr>
				<tr>
					<td align="right">
						<button type="button" class="btn btn-default" onclick="javascript:back()">��&nbsp;��</button>
						<button type="button" class="btn btn-success" onclick="javascript:order()">�ֹ��ϱ�</button>
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<% } // else �� %>
			</tbody>
		</table>
	</div>
</div>