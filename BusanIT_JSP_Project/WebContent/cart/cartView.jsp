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
<script type="text/javascript" src="../script/scriptAll.js"></script>

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
									<a href="#"><%= menuName %></a> 
								</h4>
								<!-- ���Ը� -->
								<h5 class="media-heading">
									by <a href="#"><%= rName %></a>
								</h5>
								<span>��� ���� �ð� :</span>
									<span class="text-success">
										<strong>50��</strong>
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
						<input type="text" class="form-control" id="addres" size="40" value="<%= loginBean.getcAddress() %>" style="vertical-align:middle;">
					</td>
					<td>
					</td>
					
				</tr>
				<!-- ����� ���� -->
				<tr>
					<td align="right">��ȭ��ȣ</td>
					<td colspan="3" align="right">
						<input type="tel" class="form-control" id="phoneNumber" size="20" value="<%= loginBean.getcPhone() %>">
					</td>
					<td></td>
				</tr>
				<tr>
					<td align="right">��û����</td>
					<td colspan="3" align="right">
						<input type="text" class="form-control" id="request" size="30" placeholder="30�ڸ� ���� �ۼ� �� �� �־��">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>��&nbsp;��&nbsp;��&nbsp;��</td>
					<td class="text-right">
							<select id="payType" class="form-control" style="width:176px;" >
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
						<h3><%= UtilMgr.monFormat(total) %> ��</h3>
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
			</tbody>
		</table>
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
						<td colspan="2"style="padding-left: 20px"><%= UtilMgr.monFormat(total) %> ��</td>
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