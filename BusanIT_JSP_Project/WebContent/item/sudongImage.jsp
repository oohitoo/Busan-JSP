<!-- 
	�׽�Ʈ��
	1. ����
	2. 190501 - MenuList �۾�
	3. ����� ���� ���� ���� �׽�Ʈ�ϴ� ��
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<script>
	function check() {
		// input type�� �ִ� upFile�� Ȯ���Ѵ�.
		if(document.forms[0].upFile.value==0){
			alert("������ �����ϼ���.");
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
 	<td>���ϼ���</td>
 	<td><input type="file" name="upFile"></td>
 </tr>
 <tr>
 	<td colspan="2">
 		<input type="button" value="���Ͼ��ε�" onclick="check()">
 	</td>
 </tr>
</table>
</form><p/>
<a href="flist.jsp">���ϸ���Ʈ</a>
</div>


</body>
</html>