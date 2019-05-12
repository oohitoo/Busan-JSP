<%
String businessName = (String) session.getAttribute("name");
String businessId = (String) session.getAttribute("businessId");
String businessPhone = (String) session.getAttribute("phone");
String businessAddress = (String) session.getAttribute("address");
String businessCategory = (String) session.getAttribute("category");
if(businessName==null){
		%>
		<script>
		alert("로그인을 해 주세요");
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
        <h3 class="text-center text-white pt-5">　</h3>
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-md-6">
					<div class="col-md-12">
						<form class="form" action="shopMenuUpdateProc.jsp"	method="post">
							
							<!-- menu1 -->
							<label for="scategories" class="text-primary">메뉴 업데이트:</label>
							
							<!-- 버튼 -->
							<div class="container">
							    <input type="button" id="add" class="btn btn-success" value="항목추가" />
							    <input type="button" id="clear" class="btn btn-primary" value="항목제거" />
							</div>    
							
							<!-- 메뉴 이름, 가격, 설명 table-->
							<div class="container" width="500">
									<table border="2">
											<tr>
												<td rowspan="3">
													<input class='pis' onchange="readURL(this);" type="file">
												</td>
												<td width="400">
													<div class="form-group">
													메뉴 이름
													<input type="text" class="form-control">
													</div>
												</td>
											</tr>
											<tr>
												<td width="400">
													<div class="form-group">
													가격
													<input type="text" class="form-control" onkeyUp="this.value = SetComma(this.value)">
													</div>
												</td>
											</tr>
											<tr>
												<td width="400">
													<div class="form-group">
													메뉴 설명
													<input type="text" class="form-control">
													</div>
												</td>
											</tr>
										</table>
							</div>
	
	<!-- 동적 테이블 -->
<table border="1" id="list_table">
	<colgroup>
		<!-- column 의 설정을 할수 있다. -->
		<col style="width:70px;">
		<col style="width:200px;">
		<col style="width:300px;">
		<col style="width:200px;">
	</colgroup>

	<thead>
		<tr>
			<th>No</th>
			<th>메뉴 이름</th>
			<th>메뉴 가격</th>
			<th>메뉴 설명</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>park</td>
			<td width="400">
				<div class="form-group">
					가격 
				
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

<h3>추가 입력 테이블</h3>

<table border="1" id="append_table">
<colgroup>
   <col style="width:70px">
   <col style="width:200px">
   <col style="width:300px">
   <col style="width:200px">
</colgroup>

<thead>
   <tr>
      <th><label for="add_no">번호</label></th>
      <th>이름</th>
      <th>생년월일</th>
      <th>Action</th>
   </tr>
</thead>

<tbody>
   <tr>
      <td><input type="text" id="add_no"></td>
      <td><input type="text" id="add_name"></td>
      <td><input type="text" id="add_birth"></td>
      <td><input type="text" class="form-control"	onkeyUp="this.value = SetComma(this.value)"></td>
      
      <td><button type="button" id="append_row" class="btn btn-success" value="항목추가">+</button></td>
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
				// property와 attribute의 차이!!
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
  // this == a의 부모의 부모는 tr태그
  $(this).parent().parent().remove();
})
</script>
	
	
	
	
							<!-- Update Submit -->
							<div id="register-link" class="text-right">
								<input type="submit" name="submit" class="btn btn-primary btn-md" value="수정하기">
							</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>