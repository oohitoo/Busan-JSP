<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey"); 
%>
<!-- �� �ۼ������� -->
<jsp:include page="list.jsp" />

<form name="postFrm" method="post" action="ServicePost" enctype="multipart/form-data">
<div align=left><p/><br/>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;�۾���</h2><br/>
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">�� ��</td>
				<td width="90%">
				<input name="name" size="10" maxlength="8"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td width="15%">��� ��ȣ</td>
				<td><input type="password" name="pass" size="15" maxlength="15"></td>
			</tr>
			<tr>
 				<td>����Ÿ��</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			 <tr>
     			<td width="15%">����ã��</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="���">
					 <input type="reset" value="�ٽþ���">
					 <input type="button" value="����Ʈ" onClick="javascript:location.href='Service.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>