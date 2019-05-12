<%
String businessName = (String) session.getAttribute("name");
String businessId = (String) session.getAttribute("businessId");
String businessPhone = (String) session.getAttribute("phone");
String businessAddress = (String) session.getAttribute("address");
String businessCategory = (String) session.getAttribute("category");
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
</head>
<body>
    <div>
        <h3 class="text-center text-white pt-5">��</h3>
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-md-6">
					<div class="col-md-12">
						<form class="form" action="shopMenuUpdateProc.jsp"	method="post">
							
							<!-- menu1 -->
							<label for="scategories" class="text-primary">�޴� ������Ʈ:</label>
							
							<!-- ��ư -->
							<div class="container">
							    <input type="button" id="add" class="btn btn-success" value="�׸��߰�" />
							    <input type="button" id="clear" class="btn btn-primary" value="�׸�����" />
							</div>    
							
							<!-- �޴� �̸�, ����, ���� table-->
							<div class="container" width="500">
									<table border="2">
											<tr>
												<td rowspan="3">
													<input class='pis' onchange="readURL(this);" type="file">
												</td>
												<td width="400">
													<div class="form-group">
													�޴� �̸�
													<input type="text" class="form-control">
													</div>
												</td>
											</tr>
											<tr>
												<td width="400">
													<div class="form-group">
													����
													<input type="text" class="form-control" onkeyUp="this.value = SetComma(this.value)">
													</div>
												</td>
											</tr>
											<tr>
												<td width="400">
													<div class="form-group">
													�޴� ����
													<input type="text" class="form-control">
													</div>
												</td>
											</tr>
										</table>
							</div>
	
	<!-- ���� ���̺� -->
<table border="1" id="list_table">
	<colgroup>
		<!-- column �� ������ �Ҽ� �ִ�. -->
		<col style="width:70px;">
		<col style="width:200px;">
		<col style="width:300px;">
		<col style="width:200px;">
	</colgroup>

	<thead>
		<tr>
			<th>No</th>
			<th>�޴� �̸�</th>
			<th>�޴� ����</th>
			<th>�޴� ����</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>park</td>
			<td width="400">
				<div class="form-group">
					���� 
				
				</div>
			</td>
			<td>930917</td>
			<td>
				<a href="#" class="delete-link">Delete</a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>kyung</td>
			<td>950727</td>
			<td>
				<a href="#" class="delete-link">Delete</a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>seok</td>
			<td>901217</td>
			<td>
				<a href="#" class="delete-link">Delete</a>
			</td>
		</tr>
	</tbody>
</table>

<h3>�߰� �Է� ���̺�</h3>

<table border="1" id="append_table">
<colgroup>
   <col style="width:70px">
   <col style="width:200px">
   <col style="width:300px">
   <col style="width:200px">
</colgroup>

<thead>
   <tr>
      <th><label for="add_no">��ȣ</label></th>
      <th>�̸�</th>
      <th>�������</th>
      <th>Action</th>
   </tr>
</thead>

<tbody>
   <tr>
      <td><input type="text" id="add_no"></td>
      <td><input type="text" id="add_name"></td>
      <td><input type="text" id="add_birth"></td>
      <td><input type="text" class="form-control"	onkeyUp="this.value = SetComma(this.value)"></td>
      
      <td><button type="button" id="append_row" class="btn btn-success" value="�׸��߰�">+</button></td>
   </tr>
</tbody>

</table>

<script type="text/javascript">
$('#append_row').on("click", function () {
	$('#list_table').append(
		$('<tr>').append(
			$('<td>').append($('#add_no').val()),
			$('<td>').append($('#add_name').val()),
			$('<td>').append($('#add_birth').val()),
			$('<td>').append(
				// property�� attribute�� ����!!
				$('<a>').prop('href', '#').addClass('delete-link').append('Delete')
				// <a href="#" class="delete-link">Delete</a>
			)
		)
	);
});

$('#list_table').on("click", ".delete-link", function () {
  /*
  <tr>
    <td>3</td>
    <td>seok</td>
    <td>901217</td>
    <td>
      <a href="#" class="delete-link">Delete</a>
    </td>
  </tr>
  */
  // this == a�� �θ��� �θ�� tr�±�
  $(this).parent().parent().remove();
})
</script>
	
	
	
	
							<!-- Update Submit -->
							<div id="register-link" class="text-right">
								<input type="submit" name="submit" class="btn btn-primary btn-md" value="�����ϱ�">
							</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>