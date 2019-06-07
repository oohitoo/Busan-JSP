<%@page import="shoplogin.loginBean"%>
<jsp:useBean id="mgr" class="shoplogin.loginMgr" />
<jsp:useBean id="ordersMgr" class="menu.ordersMgr" />
<%
String businessName = (String) session.getAttribute("name");
String businessid = (String) session.getAttribute("businessid");
if(businessName==null){
		%>
		<script>
		alert("�α����� �� �ּ���");
		location.href = "shopLogin.jsp";
		</script>
		<%
	}
%>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Update Info</title>
<script>
	$('.newbtn').bind("click", function() 
			{$('#pic').click();});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#logo').attr('src', e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function pwdCheck(){
		if(document.getElementById("pwd").value == document.getElementById("pwd2").value){
			if(confirm("�����Ͻðڽ��ϱ�?")){
				document.form1.submit();
			}
		}else{
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
	}
</script>
<style>
	#pic {display: none;}
	.newbtn {cursor: pointer;}
	#blah {
			max-width: 100px;
			height: 100px;
			margin-top: 20px;
			}
</style>
<%loginBean bean = mgr.shopInfo(businessid); %>
</head>
<body>
    <div id="signup">
        <h3 class="text-center text-white pt-5">��</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">

							<!-- ȸ���������� -->
							<h3 class="text-center text-primary">Shop Info Update</h3>
							<br />
							<form  name="form1" class="form" action="shopInfoUpdateProc.jsp" method="post" enctype="multipart/form-data">
							<!-- ����� ��ȣ -->
							<div class="form-group">
								<label for="sregnumber" class="text-primary">����� ��ȣ:</label><br>
								<input type="number" id="username"
									oninput="validity.valid||(value='');" class="form-control" placeholder=<%=businessid%> readonly>
							</div>
							<!-- ��й�ȣ -->
							<div class="form-group">
								<label for="password" class="text-primary">��й�ȣ:</label><br>
								<input type="password" name="pwd" id="pwd" class="form-control"required>
							</div>
							<!-- ��й�ȣ  Ȯ��-->
							<div class="form-group">
								<label for="password" class="text-primary">��й�ȣ Ȯ��:</label><br>
								<input type="password" name="pwd2" id="pwd2" class="form-control" required>
							</div>

							<!-- ���� �̸� -->
							<div class="form-group">
								<label for="shopname" class="text-primary">��ȣ ��:</label><br>
								<input type="text" name="username" id="shopname"
									class="form-control" placeholder="<%=businessName%>" readonly>
							</div>
							<!-- ��ȭ ��ȣ -->
							<div class="form-group">
								<label for="sphone" class="text-primary">��ȭ ��ȣ:</label><br>
								<input type="text" class="form-control"	placeholder="<%=bean.getTel()%>" readonly>
							</div>
							<!-- �ּ� -->
							<div class="form-group">
								<label for="saddress" class="text-primary">���� �ּ�:</label><br>
								<input type="text" name="username" id="username"
									class="form-control" placeholder="<%=bean.getAddrRoad()%>" readonly>
							</div>
							<!-- �Ĵ� �з� -->
							<div class="form-group">
								<label for="scategories" class="text-primary">���� ����:</label><br>
								<select class="form-control" name="scategories" id="scategories" placeholder="<%=bean.getBsnsCond()%>">
									<option value="�ѽ�" (<%=bean.getBsnsCond() == "�ѽ�" %>)? selected="selected" : "">�ѽ�</option>
									<option value="�߽�" (<%=bean.getBsnsCond() == "�߽�" %>)? selected="selected" : "">�߽�</option>
									<option value="����" (<%=bean.getBsnsCond() == "����" %>)? selected="selected" : "">����</option>
									<option value="ġŲ" (<%=bean.getBsnsCond() == "ġŲ" %>)? selected="selected" : "">ġŲ</option>
									<option value="�н�ƮǪ��" (<%=bean.getBsnsCond() == "�н�ƮǪ��" %>)? selected="selected" : "">�н�ƮǪ��</option>
								</select>
							</div>

							<!-- image upload -->
							<div class="form-group">
								<label for="scategories" class="text-primary">�Ĵ� �ΰ� ����:</label><br>
								<div class="row">
									<div>
										<label class=newbtn> 
										&nbsp;&nbsp;&nbsp;
										<img id="logo" src="http://placehold.it/60x60" width="60" height="60">
											<input type="file" name="pic" id="pic" class="pic" onchange="readURL(this);" value="<%=bean.getRestImg()%>">
										</label>
									</div>
								</div>
							</div>
							<input type="hidden" name="businessId" value="<%=businessid %>">
							<!-- Update Submit -->
							<div id="register-link" class="text-right">
								<input type="button" name="submit1" onclick="javascript:pwdCheck()" class="btn btn-primary btn-md" value="�����ϱ�">
							</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>