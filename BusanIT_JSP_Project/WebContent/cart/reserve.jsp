<%@page import="MenuList.menu_listBean"%>
<%@page import="java.util.Vector"%>
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
<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />
<jsp:useBean id="menulistmgr" class="MenuList.menuMgr" />
<jsp:useBean id="imgbean" class="MenuList.menu_listBean" />

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
			alert("�α��� �� ��� �ٶ��ϴ�.");
			location.href ="../login/login.jsp";
		</script>
		<%
	}
%>
<jsp:include page="designForm.jsp"/>
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
	if(document.getElementsByName('oRequest')[0].value <= 1){
		document.reserve.oRequest.focus();
		return ;
	}
	document.reserve.submit();
}
</script>

<!-- �̹��� ������ ���� ������ -->
<%
	//�̹��� ������ ���� ������
	Vector<menu_listBean> img = menulistmgr.ShopImg(shop);
	
	String shopimg;
	for (int i = 0; i < img.size(); ++i) {
		menu_listBean mImgbean = img.get(i);
		imgbean.setRestImg(mImgbean.getRestImg()); // �޴� �̹���
	}
%>
<div class="container" style= "margin-left: 70px; margin-top: 100px;">
	<div class="row ">
				<div class="col-md-3">
					<% if (imgbean.getRestImg() == null) {%>
					<img alt="�̹����غ���" width="130px" height="130px" src="../img/menuImg/ready.gif">
					<% } else {%>
					<img alt="�̹����غ���" width="130px" height="130px" src="../img/storeImage/<%=imgbean.getRestImg()%>">
					<%}%>
				</div>
				<div class="col-md-8">
					<div class="card-block">
						<h4 class="card-title"><%=shop%></h4>
					</div>
					<div class="row">
						<div class="col-md-4" style="padding-top:10px ; padding-bottom : 15px;">�ּ� �ֹ� �ݾ�</div>
						<div class="col-md-8" style="padding-top:10px ;">13,000 ��</div>
						<div class="col-md-4">���� ������ ���</div>
						<div class="col-md-8">�ſ�ī��, ����</div>
					</div>
				</div>
			<form name="reserve" action="reserveProc.jsp" method="get">
				<table style="width: 800px; height: 350px; margin-left: 50px; margin-top: 50px;">
					<tr>
						<td style="width: 150px">
							<label class="text-primary">������ ���� </label>
						</td>
						<td>
							<input name="name" class="form-control" style="width: 200px">
						</td>
						<td style="width: 150px">
							<label class="text-primary">������ ��ȭ��ȣ</label>
						</td>
						<td colspan="2">
							<input name="cPhone" class="form-control" value="<%=lBean.getcPhone()%>" style="width: 200px">
						</td>
					</tr>

					<tr>
						<td>
							<label class="text-primary">���� ��¥ ����</label>
						</td>
						<td>
							<input type="date" name="oDate" class="form-control" style="width: 200px" value="<%=today%>">
						</td>
						<td>
							<label class="text-primary">���� �ð� ����</label>
						</td>
						<td width="120px;">
							<select name="hour" style="width: 100px" class="form-control">
								<option value="">��</option>
								<option value="10" selected>10��</option>
								<% for (int i = 11; i < 20; i++) {%>
								<option value="<%=i%>"><%=i%>��	</option>
								<%
									}
								%>
						</select></td>
						<td><select name="min" class="form-control"
							style="width: 100px">
								<option value="">��</option>
								<option value="00" selected>00��</option>
								<option value="30">30��</option>
						</select></td>
					</tr>

					<tr>
						<td><label class="text-primary">���� �ο���</label></td>
						<td><select name="count" class="form-control"
							style="width: 201px">
								<option value="">�ο� ��</option>
								<%
									for (int i = 1; i < 10; i++) {
								%>
								<option value="<%=i%>"><%=i%>��
								</option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td><label class="text-primary">��û����</label></td>
						<td colspan="3"><input name="oRequest" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							<input type="hidden" name="rName" value="<%=shop%>" />
							<input type="hidden" name="id" value="<%=id%>" /> 
							<input type="hidden" name="cNick" value="<%=lBean.getcNick()%>" />
							<input type="button" class="btn btn-primary btn-md" value="�����ϱ�" onclick="javascript:check()"></td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</div>
