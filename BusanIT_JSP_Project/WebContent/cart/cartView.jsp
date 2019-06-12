<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
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
	String id = (String) session.getAttribute("idKey");
	String shop = (String) session.getAttribute("store");
	String totalMenu = "";
	int cnt = 0;
	if (id == null) {
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

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<script>
function creatUpdate(menu, num) {
	 var count = document.getElementById("count" + num).value; 
	
	if(count < 1){
		alert("�ּ� 1�� �̻� �ֹ� �� �� �־��");
		count =1;
	}else if(count > 99)	{
		alert("�ѹ��� 99������ �ֹ� �� �� �־��");
		count=99;
	}else{
		location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=update&count="+count;
	}
}
function creatdelete(menu, num) {
	var count = document.getElementById("count" + num).value;
	location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=del&count="+count; 
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

//���ݺ��� �� �ֹ� �ݾ� �ٲ�� 
$(window).load(function(event) {
	var counts; /* = document.getElementById('count1'); // ���� */ 
	var price; // ���� 
	var subtotal =0;
	var size = document.getElementById('size').value; //��ٱ��� �޴�  ����
	
	for (var i = 1; i <= size; i++) {
		counts = document.getElementById('count'+ i); // ���� 
				
		$(counts).change(function(event) {
			subtotal = 0;	
			for( var j = 1 ; j <=size ; j++){
				counts = document.getElementById('count'+ j); // ����
				if(counts.value > 99) {
					counts.value = 99;
				}
				
				price = document.getElementsByTagName('strong')[j-1].innerText; // ����
				
				subtotal = subtotal + counts.value * price; // subTotal ��
				function addComma(num) {
					  var regexp = /\B(?=(\d{3})+(?!\d))/g;
					  return num.toString().replace(regexp, ',');
				}
				$('#total').html("<h3>"+addComma(subtotal)+"��"+"</h3>");
				$('#minimum').text(addComma(subtotal)+"��");
				$('.totals').text(addComma(subtotal)+"��");
				document.getElementById('minimum').value = subtotal;
				$('#count'+j).text(counts.value);
				document.getElementById('count'+j).value = counts.value;
 
			}			
		});
		
	}
});
/* Order proc�� �ѱ�� */
function order() {
	
	var tempprice = document.getElementsByClassName('totals')[0].textContent;
	var tem = tempprice.split(',');
	if (eval(tem[0]) < 14){
		var popupX = (window.screen.width / 2);
		var popupY = (window.screen.height / 2);
		
		url = "orderMinium.html";
		window.open(url, "orderMinium", "width=400, height=190, resizable=no, left="+ popupX + ",top="+ popupY);
		
	}else{

		var addres = document.getElementById("addres").value;
		var phoneNumber = document.getElementById("phoneNumber").value;
		var request = document.getElementById("request").value;
		var Box = document.getElementById("payType");
		var selectBox = Box.options[Box.selectedIndex].value;
		
		paytype = document.createElement("input");
		paytype.type = "hidden";
		paytype.name = "paytype";
		paytype.value = selectBox;
	    document.orderFrm.appendChild(paytype);
		/* ������� */
		var webSocket = new WebSocket('ws://'+location.host+'/BusanIT_JSP_Project/broadcasting');
		/* ���� ��  (id)*/
		var shopName = $("#shopName");			
		/* ���� �޼��� */
		var Message = "�ֹ��� �Ϸ�Ǿ����ϴ�.\n";

		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onMessage(event) {
			/* textarea.value += "�ֹ��� �Ϸ�Ǿ����ϴ�.\n"; */
			/* alert("�ֹ��� �Ϸ�Ǿ����ϴ�.\n"); */
		}
		function onOpen(event) {
			/* alert("���� ����\n"); */
			send();
		}
		function onError(event) {
			alert(event.data);
		}
		function send() {
			
			var size = document.getElementById('size').value; //��ٱ��� �޴�  ����
			for (var j = 1 ; j <= size ; j++) {
				var count = $('#count'+j).val();
				var menu = document.getElementById('menu'+j).innerHTML;
				
				
				//menu input
				menuin = document.createElement("input");
				menuin.type = "hidden";
				menuin.name = "menu";
				menuin.value = menu;
			    document.orderFrm.appendChild(menuin);
			    
			    //count input
			    countin = document.createElement("input");
			    countin.type = "hidden";
			    countin.name = "counts";
			    countin.value = count;
			    document.orderFrm.appendChild(countin);
			    
			} 
			
			
			webSocket.send(shopName.val() + ":" + Message);
			Message = "";

			$("div[class=modal]").addClass("show-modal");
			
			document.orderFrm.submit();

			setTimeout(function() {
				//location.href = "orderProc.jsp?addres="+addres+"&phoneNumber="+phoneNumber+"&request="+request+"&selectBox="+selectBox; 				
			}, 1000);
		}
		
	}
}
</script>


<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row" style="margin-left: 10px; margin-top: 50px;">
		<span style="font-size: 2.0em; color: navy">�ֹ� ����</span>
		<form name="orderFrm" action="orderProc.jsp" >
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
				int total = 0, subTotal =0; //��ü�� , �߰� ��ü��
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
					
					//hCart�� ����� �ֹ� ��ü�� return 
					menu.ordersBean order = hCart.get(hCartKey.nextElement());
					String menuName = order.getMenu();
					String rName = order.getrName();
					//��ǰ ��ü(��ǰ ����, ��ǰ �̸�)								
					menuBean bean = menuMgr.getmenuBean(shop, menuName);
					int price = bean.getmPrice(); // ��ǰ ����
					int count = order.getCount(); // �ֹ�����
					subTotal = count * price; // ��ǰ �Ѿ�
					total += subTotal; // �ֹ���ü �Ѿ�					
					totalMenu += menuName+",";
					cnt++;
			%>
				<tr>
					<td class="col-sm-8 col-md-6">
						<div class="media">
						<% if(bean.getmImg() != null){ %>
							<a class="thumbnail pull-left" style="width: 90px; height: 90px;">
								<img class="media-object" src="../img/menuImg/<%=bean.getmImg() %>" style="width: 72px; height: 72px;">
							</a>
						<% } else{ %>
							<a class="thumbnail pull-left" style="width: 90px; height: 90px;">
								<img class="media-object" src="../img/menuImg/ready.gif" style="width: 72px; height: 72px;">
							</a>
						<% } %>
							<div class="media-body">
								<!-- �޴� �̸� -->
								<h4 class="media-heading">
									<span id="menu<%=num%>"><%= menuName %></span> 
								</h4>
								<!-- ���Ը� -->
								<h5 class="media-heading">
									by <a href="#"><%= rName %></a>
								</h5>
								<span>��� ���� �ð� :</span>
									<span class="text-success">
										<b>50��</b>
									</span>
							</div>
						</div>
					</td>
					<td class="col-sm-1 col-md-1" style="text-align: center">
						<input type="number" class="form-control" id="count<%=num %>" value="<%= count %>" max="99" min="1" style="width:66px;">
					</td>
					<td class="col-sm-1 col-md-1 text-center">
						<strong><%= price %></strong>��
					</td>
					<td class="col-sm-1 col-md-1">
						<p align="center">
							<!-- <button type="button" class="btn btn-danger">Remove</button> -->
							<input type="button" class="btn btn-primary"value = "����" size="3" onclick = "javascript:creatUpdate('<%= menuName%>', '<%= num%>')">
							<input type="button" class="btn btn-primary"value = "����" size="3" onclick = "javascript:creatdelete('<%= menuName%>', '<%= num%>')">
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
						<input type="text" name="address" class="form-control" id="addres" size="40" value="<%= loginBean.getcAddress() %>" style="vertical-align:middle;">
					</td>
					<td>
					</td>
					
				</tr>
				<!-- ����� ���� -->
				<tr>
					<td align="right">��ȭ��ȣ</td>
					<td colspan="3" align="right">
						<input type="tel" name="phoneNumber" class="form-control" id="phoneNumber" size="20" value="<%= loginBean.getcPhone() %>">
					</td>
					<td></td>
				</tr>
				<tr>
					<td align="right">��û����</td>
					<td colspan="3" align="right">
						<input type="text" name="request" class="form-control" id="request" size="30" placeholder="30�ڸ� ���� �ۼ� �� �� �־��">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>��&nbsp;��&nbsp;��&nbsp;��</td>
					<td class="text-right">
							<select name="payType" id="payType" class="form-control" style="width:176px;" >
									<option value="������ ī�����" selected>������ ī�����</option>
									<option value="������ ���ݰ���">������ ���ݰ���</option>
									<option value="�ٷ� ����">�ٷ� ����</option>
									
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
						<%-- <input type="text"  class="form-control" id="minimum" size="20" value="<%= UtilMgr.monFormat(total) %>"> --%>
						<%-- <h3 id="total"><%= UtilMgr.monFormat(total) %>��</h3> --%>
						<div id="total"><h3><%= UtilMgr.monFormat(total) %>��</h3></div> 
					</td>
				</tr>
				<tr>
					<td align="right">
						<button type="button" class="btn btn-primary" onclick="javascript:back()">��&nbsp;��</button>
						<button type="button" id="notibutton" class="btn btn-primary" onclick="javascript:order()">�ֹ��ϱ�</button>
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>				
				<% } // else �� %>
				<input type="hidden" id="shopName" value="<%= shop %>">
				<!-- �� ��� �޴��ΰ�? -->
				<input type="hidden" id = "size" value="<%=hCart.size()%>">
			</tbody>
		</table>
		</form>
		<!--  �˾� �� ���̾� -->
		<div class="modal">
			<div class="modal-content">
				<span class="close-button">&times;</span>
				<img width="150px" alt="����." src="../img/Logo_1.png" style="margin-bottom: 10px;">
				<br>
				<h3 align="center"><font color="#4e73df">�ֹ��� �Ϸ� �Ǿ����ϴ�.</font></h3>
				<table style="margin-left: auto; margin-right: auto; margin-top: 20px; width: 300px; height: 130px;" >
					<tr>
						<td width="100px" align="center">�ֹ� ����</td>
						<td width="10px">:</td>
						<td colspan="2" style="padding-left: 20px"><%= session.getAttribute("shop") %></td>
					</tr>
					<tr>
						<td width="100px" align="center">�ֹ� �޴�</td>
						<td>:</td>
						<td colspan="2" style="padding-left: 20px">
							<%= totalMenu.split(",")[0]+ "�� "+ cnt+ "��" %>
						</td>
					</tr>
					<tr>
						<td width="100px" align="center">�ֹ� �ݾ�</td>
						<td>:</td>
						<td class="totals" colspan="2"style="padding-left: 20px"><%= UtilMgr.monFormat(total) %>��</td>
					</tr>
				</table>
				<!-- window Ŭ���� �߻��ϴ� ���� -->
				<input type="hidden" id="cancel" value="���">
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var modal = document.querySelector(".modal");
    var closeButton = document.querySelector(".close-button");
    var cancelButton = document.querySelector("#cancel");

    function toggleModal() {
        modal.classList.toggle("show-modal");
    }
    function windowOnClick(event) {
        if (event.target === modal) {
            toggleModal();
        }
    }
    closeButton.addEventListener("click", toggleModal);
    cancel.addEventListener("click", toggleModal);
    window.addEventListener("click", windowOnClick); 		
</script>