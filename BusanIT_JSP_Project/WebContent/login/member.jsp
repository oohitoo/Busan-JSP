<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>Sign-up</title>
<link href="../css/ZipcodeStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">

	// Check ID overlap
	function idCheck(id)
	{
		frm = document.regFrm;
		if(id == "")
		{
			alert("Input your Id")
			frm.id.focus();
			return;//function get out
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url,"IDCheck","width=300, height=150");
	}
		
	//Search zipcode
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
								<td colspan="3"><font color="#FFFFFF"><b>Sign-up</b></font></td>
							</tr>
							<tr>
								<td width="20%">Id</td>
								<td width="50%">
									<input type="email" name="id" placeholder="ex)aaaa@abc.com" size="15"> 
									<input type="button" value="ID overlap check"  onClick="idCheck(this.form.id.value)">
								</td>
								<td width="30%">Input your E-main</td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="pwd" size="15"></td>
								<td>Korean and English combination more than 8 letters</td>
							</tr>
							<tr>
								<td>Password check</td>
								<td><input type="password" name="repwd" size="15"></td>
								<td>Password check</td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input name="name" size="15">
								</td>
								<td></td>
							</tr>					
							<tr>
								<td>Zipcode</td>
								<td><input name="zipcode" size="5"  readonly>
									<input type="button" value="Find zipcode" onClick="zipSearch()">
								</td>
								<td>Search zipcode</td>
							</tr>
							<tr>
								<td rowspan="2">Address</td>
								<td><input name="address" size="45"></td>								
							</tr>
							<tr>								
								<td><input size="45"></td>
								<td>Please write the remaining address</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								   <input type="button" value="Sign-up" onclick="inputCheck()">
								    &nbsp; &nbsp; 
								    <input type="reset" value="Rewrite">
								    &nbsp; &nbsp; 
								    <input type="button" value="Login" onClick="javascript:location.href='login.jsp'">
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