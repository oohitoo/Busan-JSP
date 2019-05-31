<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="login.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	
	if(id == null){ %>
		<script>
			location.replace("login.html");
		</script>
	<%}else{
	
	LoginBean bean = mgr.getCustomer(id);
	
	//�ּ� ������ �ּ� �����ϴ� ����
		String [] totalAddress = bean.getcAddress().split(" ");
		String caddress1="";	//�����ּ� 
		String caddress2="";	//�������ּ�
		
		//for������ �ּ� ����
		for(int i =0;i<totalAddress.length;i++){
			//�ּҰ� null�̸� ����
			if(totalAddress[i]==null) break;
			
			//�����ּҴ� 3���� ���ϰ� ������ �ּҴ� �� �������� �� ����
			if(i<4){
				caddress1 = caddress1 + totalAddress[i]+" "; 	
			}else{
				caddress2 = caddress2  + totalAddress[i]+" ";
			}
		}
%>
<script type="text/javascript" src="script.js"></script>
<script>
	function menulist(menu) {
		console.log(menu);
		location.href = 'item/itemProc.jsp?menu='+menu;
	}
	//Search zipcode
	function zipSearch() {
		url = "zipSearch.jsp?search=n";
		open(url, "ZipCodeSearch", "width=500,height=350,scrollbars=yes");
	}
</script>
<jsp:include page="designForm.jsp" />
<!-- ���⿡ ���κκ�!!! -->
<div id="memberUpdate">
	<br />
	<br />
	<div class="container">
		<div id="memberUpdate-row"
			class="row justify-content-center align-items-center"
			style="width: 930px">
			<div id="memberUpdate-column" class="col-md-6">
				<div id="memberUpdate-box" class="col-md-12">
					<form name="member" class="form" action="memberUpdateProc.jsp" >
						<h3 class="text-center text-primary">ȸ������ ����</h3>
						<!-- ����� ���̵� -->
						<div class="form-group">
							<label for="username" class="text-primary">����� ���̵�:</label><br>
							<input name="id" class="form-control" value="<%=bean.getId() %>"
								readonly>
						</div>

						<!-- ��й�ȣ -->
						<div class="form-group">
							<label for="password" class="text-primary">��й�ȣ:</label><br>
							<input type="password" name="pwd" class="form-control" value="<%=bean.getPwd()%>">
						</div>

						<!-- ��й�ȣ Ȯ�� -->
						<div class="form-group">
							<label for="password" class="text-primary">��й�ȣ Ȯ��:</label><br>
							<input type="password" name="repwd" id="password"
								class="form-control">
						</div>

						<!-- ����� �̸� -->
						<div class="form-group">
							<label for="username" class="text-primary">����� �̸�:</label><br>
							<input name="name" class="form-control" value="<%=bean.getcNick()%>">
						</div>

						<!-- ����� �г��� -->
						<div class="form-group">
							<label for="username" class="text-primary">����� �г���:</label><br>
							<input name="cNick" class="form-control" value="<%=bean.getName() %>">
						</div>

						<!-- ����� ��ȭ��ȣ -->
						<div class="form-group">
							<label for="username" class="text-primary">����� ��ȭ��ȣ:</label><br>
							<input name="cPhone" class="form-control" value="<%=bean.getcPhone() %>">
						</div>

						<!-- ���� ��ȣ -->
						<div class="form-group">
							<label for="username" class="text-primary">�����ȣ : </label>&nbsp;
							<input type="button"  class="btn btn-primary" value="�����ȣã��" onClick="zipSearch()" style="height: 33px; padding-top: 4px;">
							<input name="cPost" size="5" class="form-control" value="<%=bean.getcPost()%>" readonly >

						</div>

						<!-- �ּ� -->
						<div class="form-group">
							<label for="username" class="text-primary">�ּ�:</label><br>
							 <input name="caddress1" value="<%=caddress1 %>" class="form-control"><br /> 
							 <input name="caddress2" value="<%=caddress2 %>" class="form-control" placeholder="������ �ּҸ� �Է��ϼ���">
						</div>
						
						<div class="form-group">
							<input type="button" class="btn btn-primary" value="�����Ϸ�" onclick="inputCheck()"> &nbsp; &nbsp; 
							<input type="reset"  class="btn btn-primary" value="�ٽþ���">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%}%>