<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
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
			<th>Name</th>
			<th>Birth</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>park</td>
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
      <td><button type="button" id="append_row">데이터 추가</button></td>
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

</body>
</html>