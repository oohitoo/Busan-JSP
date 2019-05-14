<%@page import="java.util.Vector"%>
<%@page import="menu.menuBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String shop = request.getParameter("store");	
	//���ǰ� �޾ƿ���
	String best = (String)session.getAttribute("best");
	String drink = (String)session.getAttribute("drink");
	String side = (String)session.getAttribute("side");
%>
<!-- �޴��� �����;��� -->
<jsp:useBean id="menuMgr" class="menu.menuMgr"/>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
.sectiondropdown{
    background-color: #fff9;
    margin-bottom: 0 !important;
    padding: 10px;
    outline: none;
    font-size: 16px;
    color: #333;
    font-weight: 600;
    border: 1px solid #ccc;
    margin-top: 5px;
    border-radius: 4px;
}
#accordion{
    margin-top: 30px;
    margin-bottom: 30px;
    width: 700px; /* bar ũ�� */
}
#accordion i{
    float: right;
    margin-right: 15px;
}
#accordion p{
    padding: 10px;
    margin: 0 !important;
}
#accordion div{
    background-color: #fff;
    margin-left: 50px;
}
h3{
	margin-left: 50px;
}
</style>
<script>
	jQuery(function() {
		jQuery("#accordion").accordion({
			header : "h3",
			collapsible : true,
			active : false,
			heightStyle : "content",
			autoHeight : false
		});
	});
	jQuery('.sectiondropdown').click(function() {
		jQuery("i", this).toggleClass("fa-caret-up fa-caret-down");
	});
	
	function cartView(menu, info, price) {
		console.log(menu+ "/" + info+"/" + price);
		/* location.href = "privateShopProc.jsp?flag=insert"+"&menu="+menu; */
		location.href = "privateShopProc.jsp?menu="+menu+"&info="+info+"&price="+price+"&count="+1+"&flag=insert";
	}
</script>
<div class="container">
	<div class="row">
		<div id="accordion" style="margin-left: 100px;">
			<table style="width: 700px; margin-left: 50px; margin-top: 50px;">
				<tr>
					<!-- ���� �̸� ǥ���ϴ� �� -->
					<td colspan="3"><h5><%= shop %></h5></td>
				</tr>
				<tr>
					<td rowspan="3" width="100px" height="100px">�̹���</td>
					<td> �ּ� �ֹ��ݾ� 13,000 ��</td>
				</tr>
				<tr>						
					<td>������� : ī��, ����</td>
				</tr>
				<tr>						
					<td>��� ��� �ð� : 40��, ���� : 0��</td>
				</tr>
				<tr>
					<td colspan="3">����� �˸� �޼���</td>
				</tr>
			</table>
			<br>
			<%
				Vector<menuBean> bestmenu = menuMgr.getMenu(shop, best);
			%>
			<!-- ��ǥ�޴� -->
			<h3 class="sectiondropdown">
				��ǥ�޴�<i class="fa fa-caret-down" aria-hidden="true"></i> <!--<i>�������� ������ �����</i>  -->
			</h3>
			<div style="height: 30% !important;">
				<p>
					<table style="width: 600px; margin-left: 20px; margin-right: 30px;">
						<%
						for(int i = 0; i < bestmenu.size(); ++i){
							menuBean bestbean = bestmenu.get(i);
							String mImg = bestbean.getmImg(); // �޴� �̹���
							String mName = bestbean.getmName(); // �޴� �̸�
							String mInfo = bestbean.getmInfo(); // �޴� ����
							int mPrice = bestbean.getmPrice(); // �޴� ����
						%>						
						<tr>
							<td>
								<font color="black" size="4">
									<a href="javascript:cartView('<%=mName%>','<%=mInfo%>','<%=mPrice%>')"><%= mName %></a>
								</font>
							</td>
							<td rowspan="3" width="140px" height="130px" align="center">
								<% if(mImg != null){ %>
									<img src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px" height="100px">
								<%}else{ %>
									<img src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px" height="100px">
								<%} %>
							</td>
						</tr>
						<tr>
							<td><font color="#808080" size="3"><%= mInfo %></font></td>
						</tr>
						<tr>
							<td><font color="black" size="3"><li><%= mPrice %> ��</li></font></td>
						</tr>
						<%}%>
					</table>
				</p>
			</div>
			<!-- ��ǥ�޴� ���� -->
			<% Vector<menuBean> drinkmenu = menuMgr.getMenu(shop, drink); %>
			<!-- ������ �޴� -->
			<h3 class="sectiondropdown">
				������<i class="fa fa-caret-down" aria-hidden="true"></i>
			</h3>
			<div style="height: 30% !important;">
				<table style="width: 600px; margin-left: 20px; margin-right: 30px;">
					<%
					for(int i = 0; i < drinkmenu.size(); ++i){
						menuBean drinkbean = drinkmenu.get(i);
						String mImg = drinkbean.getmImg(); // �޴� �̹���
						String mName = drinkbean.getmName(); // �޴� �̸�
						String mInfo = drinkbean.getmInfo(); // �޴� ����
						int mPrice = drinkbean.getmPrice(); // �޴� ����
					%>
					<tr>
						<td>
							<font color="black" size="4">
								<a href="javascript:cartView('<%=mName%>','<%=mInfo%>','<%=mPrice%>')"><%= mName %></a>
							</font></td>
						<td rowspan="3" width="140px" height="130px" align="center">
							<% if(mImg != null){ %>
								<img src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px" height="100px">
							<%}else{ %>
								<img src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px" height="100px">
							<%} %>
						</td>
					</tr>
					<tr>
						<td><font color="#808080" size="3"><%= mInfo %></font></td>
					</tr>
					<tr>
						<td><font color="black" size="3"><li><%= mPrice %> ��</li></font></td>
					</tr>
					<%}%>
				</table>
			</div>
			<!-- ������ �޴� ���� -->
			<% Vector<menuBean> sidemenu = menuMgr.getMenu(shop, side); %>
			<h3 class="sectiondropdown">
				���̵�޴�<i class="fa fa-caret-down" aria-hidden="true"></i>
			</h3>
			<div style="height: 30% !important;">
				<table style="width: 600px; margin-left: 20px; margin-right: 30px;">
					<%
					for(int i = 0; i < sidemenu.size(); ++i){
						menuBean sidebean = sidemenu.get(i);
						String mImg = sidebean.getmImg(); // �޴� �̹���
						String mName = sidebean.getmName(); // �޴� �̸�
						String mInfo = sidebean.getmInfo(); // �޴� ����
						int mPrice = sidebean.getmPrice(); // �޴� ����
					%>
						<tr>
							<td>
								<font color="black" size="4">
									<a href="javascript:cartView('<%=mName%>','<%=mInfo%>','<%=mPrice%>')"><%= mName %></a>
								</font>
							</td>
							<td rowspan="3" width="140px" height="130px" align="center">
								<% if(mImg != null){ %>
									<img src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px" height="100px">
								<%}else{ %>
									<img src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px" height="100px">
								<%} %>
							</td>
						</tr>
						<tr>
							<td><font color="#808080" size="3"><%= mInfo %></font></td>
						</tr>
						<tr>
							<td><font color="black" size="3"><li><%= mPrice %> ��</li></font></td>
						</tr>
					<%}%>
				</table>
			</div>	
			<table style="width: 600px; margin-left: 50px; margin-top: 50px;">
				<tr>
					<td width="300px" style="text-align: center;">
						<font color="black" size="5">����</font>
					</td>
					<td width="300px" style="text-align: center;">
						<font color="black" size="5">���</font>
					</td>
				</tr>
			</table>
		</div>
		<!-- ��Ӵٿ� ���� -->
	</div>
</div>
<script src="https://use.fontawesome.com/9bc7fc2951.js"></script>
<script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js" integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM=" crossorigin="anonymous"></script><%@page import="java.util.Vector"%>
