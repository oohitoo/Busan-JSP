<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>ȸ������</title>
<link href="../css/ZipcodeStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">

	// ID�ߺ� Ȯ��
	function idCheck(id)
	{
		frm = document.regFrm;
		if(id == "")
		{
			alert("���̵� �Է��ϼ���.")
			frm.id.focus();
			return;//function�� �����.
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url,"IDCheck","width=300, height=150");
	}
		
	//�����ȣ �˻�
	function zipSearch(){
		url = "zipSearch.jsp?search=n";
		open(url,"ZipCodeSearch","width=500,height=350,scrollbars=yes");
	}
	
</script>
</head>
<body bgcolor="#FFFFCC" onLoad="regFrm.id.focusrp ()">
	<div align="center">
		<br /><br />
		<form name="regFrm" method="post" action="memberProc.jsp" >
			<table cellpadding="5">
				<tr>
					<td bgcolor="#FFFFCC">
						<table border="1" cellspacing="0" cellpadding="2" width="700">
							<tr bgcolor="#996600">
								<td colspan="3"><font color="#FFFFFF"><b>ȸ�� ����</b></font></td>
							</tr>
							<tr>
								<td width="20%">���̵�</td>
								<td width="50%">
									<input type="email" name="id" placeholder="ex)aaaa@abc.com" size="15"> 
									<input type="button" value="ID�ߺ�Ȯ��"  onClick="idCheck(this.form.id.value)">
								</td>
								<td width="30%">�̸����� �Է��ϼ���</td>
							</tr>
							<tr>
								<td>��й�ȣ</td>
								<td><input type="password" name="pwd" size="15"></td>
								<td>�ѱ�,���� ���� 8���� �̻�</td>
							</tr>
							<tr>
								<td>��й�ȣ Ȯ��</td>
								<td><input type="password" name="repwd" size="15"></td>
								<td>��й�ȣ Ȯ��</td>
							</tr>
							<tr>
								<td>�̸�</td>
								<td><input name="name" size="15">
								</td>
								<td></td>
							</tr>					
							<tr>
								<td>�����ȣ</td>
								<td><input name="zipcode" size="5"  readonly>
									<input type="button" value="�����ȣã��" onClick="zipSearch()">
								</td>
								<td>�����ȣ�� �˻��ϼ���.</td>
							</tr>
							<tr>
								<td rowspan="2">�ּ�</td>
								<td><input name="address" size="45"></td>								
							</tr>
							<tr>								
								<td><input size="45"></td>
								<td>������ �ּҸ� �����ּ���</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								   <input type="button" value="ȸ������" onclick="inputCheck()">
								    &nbsp; &nbsp; 
								    <input type="reset" value="�ٽþ���">
								    &nbsp; &nbsp; 
								    <input type="button" value="�α���" onClick="javascript:location.href='login.jsp'">
								 </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>