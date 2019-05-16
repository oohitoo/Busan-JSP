<%@page import="MenuList.menu_listBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	String menu = request.getParameter("menu");
%>
<jsp:useBean id="mgr" class="MenuList.menuMgr"/>
<%
	//����¡ & ��ó�� ����
	int totalsize = mgr.getStoreTotalList(menu); // �� �Խù� �� 
	int numPerpage = 7; //�� �������� ������ ����
	int pagePerBlock = 10; // �ؿ� [1][2][3].. �̰� �� 10��
	int totalPage = 0; //�� ������ ��
	int totalBlock = 0;
	int nowpage = 1; // ���� ������
	int nowBlock = 1; //���� ��
	
	// Limit �� ���� ������ 
	int start = 0; // ���۹�ȣ
	int end = numPerpage; //�� ��ȣ
	// Limit �� ���� ������ �� 
	
	// nowpage�� ������ 0���� ���� 
	nowpage = Integer.parseInt(request.getParameter("nowPage"));
		
	start = (nowpage * numPerpage) - numPerpage;
	// �� ������
	totalPage = (int)Math.ceil((double)totalsize / numPerpage);
	// �� �� ��
	totalBlock = (int) Math.ceil((double)totalPage / pagePerBlock);
	// ���� ���� ���Ҷ�
	nowBlock = (int) Math.ceil((double)nowpage / pagePerBlock);
	// ���� �� �Խù� : ?��, �� ������ �� : ?��
	//out.println("�� �Խù� ��" + totalsize + " �� ��������" + totalPage + "���� ��" + nowBlock);
	//����¡ & ��ó�� ����
	
%>

<title>������ ������</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet" href="../css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript">
	function paging(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(block) {
		document.readFrm.nowPage.value = <%= pagePerBlock %> * (block-1) + 1;
		document.readFrm.submit();
	}
	
	function storeInfo(store) {
		location.href = "privateShop.jsp?store="+store;
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
			<% if(id == null){ %>
			<div class="main">
				<div class="main_1 main_common">
					<a href="../cart/cartView.jsp">�ֹ�����</a>
				</div>
				<div class="main_2 main_common">
					<a href="../login/member.html">ȸ������</a>
				</div>
				<div class="main_3 main_common">
					<a href="../login/login.html">�α���</a>
				</div>
			</div>
			<% }
				else{
			%>
				<div class="main_1 main_common">
					<a href="../login/logout.jsp">�α׾ƿ�</a>
				</div>				
				<div class="main_1 main_common">
					<a href="../cart/cartView.jsp">��ٱ���</a>
				</div>
				<div class="main_2 main_common">
					<a href="../login/memberUpdate.jsp">ȸ����������</a>
				</div>
				<div class="main_3 main_common" style="width: 130px">
					<a href="#"><%= id %>��</a>
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
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="../Index.jsp">
						<div class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-laugh-wink"></i>
						</div>
						<img src="../img/Logo_1.png" width="200px" height="50px" alt="Logo�̹���"/>
					</a>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					<li class="nav-item">
						<a class="nav-link" href="../Index.jsp">
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
						<a class="nav-link" href="itemList.jsp?menu=�߽�&nowPage=1">
							<span>�߽�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemList.jsp?menu=�ѽ�&nowPage=1">
							<span>�ѽ�</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemList.jsp?menu=����&nowPage=1">
							<span>����</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemList.jsp?menu=ġŲ&nowPage=1">
							<span>ġŲ</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="itemList.jsp?menu=�н�ƮǪ��&nowPage=1">
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
						<a class="nav-link" href="tables.html">
							<span>������</span>
						</a>
					</li>	

					<!-- Divider -->
					<hr class="sidebar-divider">

				</ul>
				<!-- End of Sidebar -->
				<!-- ���� �޴��� ���� -->
				<!-- ������ ���� �κ� ���� -->
				
				
				<%
				// ��ȯ�� �Խù� �� ���ͷ� ����
				Vector<menu_listBean> list = mgr.ShopSelect(menu, start, end);
				int listSize = list.size();
				if(list.isEmpty()){%>
					<table style="margin-left: 100px; width: 700px;">
						<tr>
							<td align="center"><br> �˻������ �����ϴ�.</td>
						</tr>
					
						<tr height="100px">
							<td colspan="3" style="text-align: center"><span>Copyright Your Website 2019</span></td>
						</tr>
					</table>
					
				<%}else{%>
					<table style="margin-left: 150px;">
					<tr style="height: 70px;">
						<td colspan="3" style="text-align: center;"><h3><%= menu %></h3></td>
					</tr>
					<tr>
						<td colspan="3">�� ���� �� : <%=totalsize%> �� 
							(<font color="red"><%=nowpage + "/" + totalPage%></font>)
						</td>
					</tr>
					<tr style="height: 50px;">
						<td></td>
						<td style="text-align: right;">�Ÿ���</td>
						<td style="text-align: right;">������</td>
					</tr>
					<%
						for(int i = 0; i < list.size(); ++i){
							menu_listBean bean = list.get(i);
							/* String StoreCond = bean.getStoreCond(); // ī�װ� */
							String StoreImage = bean.getRestImg(); // ���� ��ǥ �̹���
							String StoreName= bean.getStorename(); // ���Ը�
							String StoreAddrs1 = bean.getStoreaddr1(); //���θ��ּ�
							String tel = bean.getTel(); //��ȭ��ȣ
							String BestMenu = bean.getBestmenu();
						%>

					<tr>
						<td rowspan="3" width="140px" height="130px" align="center">
							<% if(StoreImage != null){%>
							<img alt="�̹����غ���" width="100px" height="100px" src="../img/storeImage/<%=StoreImage%>">
							<%}else{%>
								<img alt="�̹����غ���" width="100px" height="100px" src="../img/storeImage/<%=StoreImage%>">
							<%}%>
						</td>
						<td colspan="2"><a href="javascript:storeInfo('<%= StoreName %>')"><%= StoreName %></a></td>
					</tr>

					<tr>
						<td><%= StoreAddrs1 %></td>
						<td align="center"><%= tel %></td>
					</tr>

					<tr>
						<td colspan="2">��ǥ�޴� : <%= BestMenu %></td>
					</tr>
					<%}%>
					
					<tr>
						<td colspan="3" style="text-align: center">
							<%
							// ����¡�� ǥ�õ� ���ۺ��� �� ������ ����
							int pageStart = (nowBlock - 1) * pagePerBlock + 1;
							int pageEnd = ((pageStart+pagePerBlock)<=totalPage)?(pageStart+pagePerBlock):totalPage+1;
							if (totalPage != 0) {
							%>
							
							<!-- ������ -->
							<% if (nowBlock > 1) { %>
								<a href="javascript:block(<%= nowBlock-1%>)">����</a> <%} %>
							<!-- ����¡ -->
							<%
								for (; pageStart<pageEnd;pageStart++) {
							%> 
								<a href="javascript:paging(<%= pageStart %>)">
							<% if (nowpage == pageStart) { %> <font color="red"> <%} %>
								[<%= pageStart %>]
								</a>
							<% if(nowpage == pageStart) {%> </font> <%} %>
							<% } %>&nbsp;
							
							<!-- ������ -->
							<% if (totalBlock > nowBlock) { %>
								<a href="javascript:block(<%= nowBlock + 1%>)">...next</a>
							<%} %>
						<% } %>
						</td>
					</tr>
					<tr height="100px">
					</tr>
					<tr height="100px">
						<td colspan="3" style="text-align: center"><span>Copyright &copy; Your Website 2019</span></td>
					</tr>
					<%}%>
				</table>
				
				<form name="readFrm">
					<input type="hidden" name="totalsize" value="<%= totalsize%>" />
					<input type="hidden" name="nowPage" value="<%= nowpage%>" />					
					<input type="hidden" name="menu" value="<%= menu %>" />				
				</form>
				<p />
				
			</div>
			<!-- ���� �κ� �ȿ� ��ư�� �κ� ���� -->
		</div>
	</div>
	<!-- ������ ���� �κ� ���� -->
</body>
