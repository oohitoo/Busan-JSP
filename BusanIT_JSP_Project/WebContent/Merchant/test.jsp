<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="2">
	<% int j=0;
		String oNumTest;
		
	for(int i=0; i<5; i++){ %>
		<tr>
			<td>
			<%if(j==i){%>
			<%}else{%>
			<%=i %>			
			<% }%>
			</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
		</tr>
		<%j=j+2;
		} %>
	</table>
</body>
</html>