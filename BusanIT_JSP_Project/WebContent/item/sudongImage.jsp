<!-- 
	테스트용
	1. 팀장
	2. 190501 - MenuList 작업
	3. 목록을 보기 위해 따로 테스트하는 곳
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<script>
	function check() {
		// input type에 있는 upFile을 확인한다.
		if(document.forms[0].upFile.value==0){
			alert("파일을 선택하세요.");
			return;
		}
		document.forms[0].submit();
	}
</script>
</head>
<body>
<div align="center">
<h2>File Upload</h2>
<form method="post" enctype="multipart/form-data" action="sudongUploadProc.jsp">
<table border="1">
 <tr>
 	<td>파일선택</td>
 	<td><input type="file" name="upFile"></td>
 </tr>
 <tr>
 	<td colspan="2">
 		<input type="button" value="파일업로드" onclick="check()">
 	</td>
 </tr>
</table>
</form><p/>
<a href="flist.jsp">파일리스트</a>
</div>


</body>
</html>