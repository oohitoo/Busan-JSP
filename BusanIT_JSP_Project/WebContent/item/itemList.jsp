<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
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
<jsp:include page="designForm.jsp" />

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
			<%// ��ȯ�� �Խù� �� ���ͷ� ����
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
						<td colspan="3" style="text-align: center;">
							<h3 style="color:#486CDA">
								<strong><%= menu %></strong>
							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="3">�� ���� �� : <%=totalsize%> �� 
							(<font color="red"><%=nowpage + "/" + totalPage%></font>)
						</td>
					</tr>
					<tr style="height: 50px;">
						<td></td>
						<td ></td>
						<td ></td>
					</tr>
					<% for(int i = 0; i < list.size(); ++i){
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
							<% if(StoreImage == null){%>
								<img alt="�̹����غ���" width="100px" height="100px" src="../img/menuImg/ready.gif">
							<%}else{%>
								<img alt="�̹����غ���" width="100px" height="100px" src="../img/storeImage/<%=StoreImage%>">
							<%}%>
						</td>
						<td colspan="2">
							<a href="javascript:storeInfo('<%= StoreName %>')"><%= StoreName %></a>
						</td>
					</tr>

					<tr style="color:black">
						<td><%= StoreAddrs1 %></td>
						<td align="center" style="width:132px;"><%= tel %></td>
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
							if (totalPage != 0) {%>
							
							<!-- ������ -->
							<% if (nowBlock > 1) { %>
								<a href="javascript:block(<%= nowBlock-1%>)">����</a> <%} %>
							<!-- ����¡ -->
							<% for (; pageStart<pageEnd;pageStart++) { %> 
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
					<input type="hidden" name="totalsize" value="<%= totalsize %>" />
					<input type="hidden" name="nowPage" value="<%= nowpage %>" />					
					<input type="hidden" name="menu" value="<%= menu %>" />				
				</form>
				<p/>
	<!-- ������ ���� �κ� ���� -->
</body>
