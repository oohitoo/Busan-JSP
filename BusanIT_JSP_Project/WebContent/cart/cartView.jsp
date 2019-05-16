<%@page import="login.LoginBean"%>
<%@page import="menu.menuBean"%>
<%@page import="Service.UtilMgr"%>
<%@page import="java.util.Enumeration"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
			location.href ="login/login.html";
		</script>
		<%
	}
	int num = 1;
	
%>

<title>������ ������</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet" href="../css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script>
	function creatUpdate(menu, num) {
		var count = document.getElementById("count" + num).value;
		console.log(count);
		location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=update&count="+count; 
	}
	function creatdelete(menu, num) {
		var count = document.getElementById("count" + num).value;
		location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=del&count="+count; 
	}
</script>
<body id="page-top">
	<!-- ��� �̹��� �� �ش� �̹��� -->
	<div class="container"><br>
		<a href="../Index.jsp">
			<img src="../img/Logo_2.png" width="200px" height="200px" alt="Logo�̹���"/>
		</a>
		<a href="../Index.jsp">
			<img src="../img/Logo_1.png" width="500px" height="150px" alt="Logo�̹���" style="margin-left: 150px;margin-right: 50px;"/>
		</a>
	</div>
	<!-- ��� �̹��� �� ��� ���� -->
	<hr>
	<!-- ���̵� �� �α��� �� ���õ� ���� -->
	<div class="container">
		<div class="Maincontainer">
			<%
				if(id == null){
			%>
			<div class="main">
				<div class="main_1 main_common">
					<a href="cartView.jsp">�ֹ�����</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/member.html">ȸ������</a>
				</div>
				<div class="main_3 main_common">
					<a href="login/login.html">�α���</a>
				</div>
			</div>
			<%
				}
					else{
			%>
				<div class="main_1 main_common">
					<a href="login/logout.jsp">�α׾ƿ�</a>
				</div>				
				<div class="main_1 main_common">
					<a href="cartView.jsp">��ٱ���</a>
				</div>
				<div class="main_2 main_common">
					<a href="login/memberUpdate.jsp">ȸ����������</a>
				</div>
				<div class="main_3 main_common" style="width: 130px">
					<a href="#"><%=id%>��</a>
				</div>
			<%
				}
			%>
		</div>
	</div>
	<!-- ���̵� �� �α��� �� ���õ� ���� ���� -->
	<!-- ��� �κ� ����  -->
	<br>
	<hr>
	<div class="container">
		<div class="row">
			<!-- Page Wrapper -->
			<div id="wrapper">
				<!-- Sidebar -->
				<ul	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
					<!-- Sidebar - Brand -->
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="Index.jsp">
						<div class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-laugh-wink"></i>
						</div>
						<img src="../img/Logo_1.png" width="200px" height="50px" alt="Logo�̹���"/>
					</a>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item">
						<a class="nav-link" href="../Index.html">
							<span>�Ǹ� ����</span>
						</a>
					</li>

					<!-- Divider -->
					<hr class="sidebar-divider">

					<!-- ���� ���� -->
					<!-- Heading -->
					<div class="sidebar-heading">�޴� �׸�</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<!-- <a class="nav-link" href="item/itemList.jsp?menu=�߽�&nowPage=1"> -->
						<a class="nav-link" href="../item/itemList.jsp?menu=�߽�&nowPage=1">
							<span>�߽�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemList.jsp?menu=�ѽ�&nowPage=1">
							<span>�ѽ�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemList.jsp?menu=����&nowPage=1">
							<span>����</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemList.jsp?menu=ġŲ&nowPage=1">
							<span>ġŲ</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="../item/itemList.jsp?menu=�н�ƮǪ��&nowPage=1">
							<span>�н�ƮǪ��</span>
						</a>
					</li>
					
					<!-- Divider -->
					<hr class="sidebar-divider">
					
					<!-- Heading -->
					<div class="sidebar-heading">������</div>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>ȸ������</span>
						</a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="tables.html">
							<span>���� ���� ����</span>
						</a>
					</li>	
					
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item active">
						<a class="nav-link" href="Service/Service.jsp">
							<span>������</span>
						</a>
					</li>	

					<!-- Divider -->
					<hr class="sidebar-divider">

				</ul>
				<!-- End of Sidebar -->
				<!-- ���� �޴��� ���� -->
				<!-- ������ ���� �κ� ���� -->
				
				<table border="1" style="margin-left: 100px; margin-top: 50px; width: 700px; color: black;" >
					<tr align="center">
						<td colspan="3" style="height: 100px">
							<span style="font-size: 2.0em; color: navy">�ֹ��� ����</span>
						</td>
					</tr>

					<tr align="center" style="height: 30px">
						<td>
							<span style="color: black">�ֹ���� ( �ֹ����� �� )</span>
						</td>
						<td width="130px">����</td>
						<td width="150px">����</td>
					</tr>
					<!-- ���ǰ� �ݺ� ������ �� -->
					<%
						int total = 0; //��ü��
						Hashtable<String, menu.ordersBean> hCart = cMgr.getCartList();
									
						if(hCart.isEmpty()){
					%>
							<td colspan="3" align="center"> ��ٱ��� ����� �����ϴ�.</td>
						<%
							}
										else{
											// ������ ���� ��ü
											Enumeration<String> hCartKey = hCart.keys();
											// ��� ���� ���̻� ������ ����
											while(hCartKey.hasMoreElements()){
												
												String shop = (String)session.getAttribute("store");
												//hCart�� ����� �ֹ� ��ü�� return 
												menu.ordersBean order = hCart.get(hCartKey.nextElement());
												String menuName = order.getmName();
												//��ǰ ��ü(��ǰ ����, ��ǰ �̸�)								
												menuBean bean = menuMgr.getmenuBean(shop, menuName);
												int price = bean.getmPrice();
												int count = order.getCount(); // �ֹ�����
												out.println(count);
												int subTotal = count * price; // ��ǰ �Ѿ�
												total += subTotal;
						%>
						<tr>							
							<td rowspan="2"><%=menuName %> ( <%= shop %> )</td>
							<td align="center">
							<input type="text" id="count<%= num %>" size="3" value="<%= count %>"></td>
							<td rowspan="2" align="center"><%= price %> ��</td>
						</tr>
						<tr>
							<td align="center">
								<input type="button" value = "����" size="3" onclick = "javascript:creatUpdate('<%= menuName%>', '<%= num%>')">
								<input type="button" value = "����" size="3" onclick = "javascript:creatdelete('<%= menuName%>', '<%= num%>')">
							</td>
						</tr>
						<tr>
						<% num++;} %>
							<td colspan="2" align="center">�� �ֹ��ݾ� : <%= UtilMgr.monFormat(total) %> ��</td>
							<td align="center">
								<a href="orderProc.jsp">�ֹ��ϱ�</a>
							</td>
						</tr>
						<%
						}
					%>
					<!-- <tr>
						<td>�ֹ���ϵ� ~~~~~~~~~~</td>
						<td width="50px">���� ~~~~~~~~~~</td>
						<td width="150px"><center>30000</center></td>
					</tr> -->
					<!-- ���ǰ� �ݺ� ���� ���� -->
					<% 
						LoginBean loginBean = loginMgr.getCustomer(id);
					%>
					<tr>
						<td colspan="3">
							<hr>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<table style="width: 700px; height: 150px; margin-left: 100px">
								<tr>
									<td width="50px">�ּ� :</td>
									<td colspan="2"><input type="text" name="addres" size="50" value="<%= loginBean.getcAddress()%>"></td>
								</tr>
								<tr>
									<td>��ȭ��ȣ : </td>
									<td colspan="2"><input type="tel" name="numbers" size="50" value="<%= loginBean.getcPhone()%>"></td>
								</tr>
								<tr>
									<td>��û���� : </td>
									<td colspan="2"><input type="text" name="numbers" size="50" placeholder="40�ڸ� ���� �ۼ� �� �� �־��"></td>
								</tr>
							</table>						
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<table style="width: 700px">
								<tr height="100px;">
									<td></td>
								</tr>
								<tr>
									<td align="center">
										<span style="font-size: 1.5em;">������� :</span> &nbsp;&nbsp;&nbsp;&nbsp;
											<select name="payType" style="font-size: 1.2em;">
													<option>������ ī�����</option>
													<option>������ ���ݰ���</option>
													<option>ī�� ����</option>
													<option>������ �Ա�</option>
											</select>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>	
			</div>
			<!-- ���� �κ� �ȿ� ��ư�� �κ� ���� -->
		</div>
	</div>
	<!-- ������ ���� �κ� ���� -->
</body>
<%-- 	
<%
	if (session.getAttribute("shopingList") == null) {
		out.println("����");
	} else {
		ArrayList<String> list = (ArrayList) session.getAttribute("shopingList");
		for (int i = 1; i < list.size(); i++) {
			out.println(list.get(i));
			if (i % 3 == 0) {
				out.println("<br>");
			}
		}
	}
%> --%>