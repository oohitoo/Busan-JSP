<%@page import="login.LoginBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="login.LoginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String Id  = (String)session.getAttribute("idKey");	
	LoginBean bBean = mMgr.getCustomer(Id);
	
	
	//�ּ� ������ �ּ� �����ϴ� ����
	String [] totalAddress = bBean.getcAddress().split(" ");
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

<link rel="stylesheet" href="css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
	//Search zipcode
	function zipSearch() {
		url = "zipSearch.jsp?search=n";
		open(url, "ZipCodeSearch", "width=500,height=350,scrollbars=yes");
	}
</script>
<div id="memberUpdate" >
				<br/><br/>
					<div class="container">
						<div id="memberUpdate-row"
								class="row justify-content-center align-items-center" style = "width:930px">
							<div id="memberUpdate-column" class="col-md-6">
								<div id="memberUpdate-box" class="col-md-12">
<!-- 									<form name="memberUpdateFrm" id="login-form" class="form" action="memberUpdateProc.jsp" method="post"> -->
									<form name="member" class="form" action="memberUpdateProc.jsp" method="post">
										<h3 class="text-center text-primary">ȸ������ ����</h3>
											<!-- ����� ���̵� -->
											<div class="form-group">
												<label for="username" class="text-primary">����� ���̵�:</label><br>
												<input name="id"  class="form-control" value="<%=bBean.getId() %>" readonly>
											</div>
											
											<!-- ��й�ȣ -->
											<div class="form-group">
												<label for="password" class="text-primary">��й�ȣ:</label><br> 
												<input type="password" name="pwd" class="form-control" value="<%=bBean.getPwd()%>">
											</div>
											
											<!-- ��й�ȣ Ȯ�� -->
											<div class="form-group">
												<label for="password" class="text-primary">��й�ȣ Ȯ��:</label><br> 
												<input type="password" name="repwd" id="password" class="form-control">
											</div>
											
											<!-- ����� �̸� -->
											<div class="form-group">
												<label for="username" class="text-primary">����� �̸�:</label><br>
												<input name="name" class="form-control"  value="<%=bBean.getcNick()%>">
											</div>
											
											<!-- ����� �г��� -->
											<div class="form-group">
												<label for="username" class="text-primary">����� �г���:</label><br>
												<input name="cNick" class="form-control" value="<%=bBean.getName() %>">
											</div>
											
											<!-- ����� ��ȭ��ȣ -->
											<div class="form-group">
												<label for="username" class="text-primary">����� ��ȭ��ȣ:</label><br>
												<input name="cPhone" class="form-control" value="<%=bBean.getcPhone() %>">
											</div>
											
											<!-- ���� ��ȣ -->
											<div class="form-group" >
												<label for="username" class="text-primary">�����ȣ : </label>&nbsp;
												<input type="button" value="�����ȣã��" onClick="zipSearch()">
												<input name="cPost" size="5" class="form-control" value="<%=bBean.getcPost()%>" readonly> 
												
											</div>
											
											<!-- �ּ� -->
											<div class="form-group">
												<label for="username" class="text-primary">�ּ�:</label><br>
												<input type="text" name="caddress1" id="useraddress" value="<%=caddress1 %>" class="form-control"><br/>
												<input type="text" name="caddress2" id="useraddress" value="<%=caddress2 %>"class="form-control" placeholder="������ �ּҸ� �Է��ϼ���">
											</div>
																			

																			
																			
											<div class="form-group">
												<input type="submit" value="�����Ϸ�"> &nbsp; &nbsp; 
												<input type="reset" value="�ٽþ���">
											</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>