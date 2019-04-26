<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>회원가입</title>
<link href="../css/ZipcodeStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">

	// ID중복 확인
	function idCheck(id)
	{
		frm = document.regFrm;
		if(id == "")
		{
			alert("아이디를 입력하세요.")
			frm.id.focus();
			return;//function을 벗어난다.
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url,"IDCheck","width=300, height=150");
	}
		
	//우편번호 검색
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
								<td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
							</tr>
							<tr>
								<td width="20%">아이디</td>
								<td width="50%">
									<input type="email" name="id" placeholder="ex)aaaa@abc.com" size="15"> 
									<input type="button" value="ID중복확인"  onClick="idCheck(this.form.id.value)">
								</td>
								<td width="30%">이메일을 입력하세요</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="pwd" size="15"></td>
								<td>한글,영어 조합 8글자 이상</td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td><input type="password" name="repwd" size="15"></td>
								<td>비밀번호 확인</td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input name="name" size="15">
								</td>
								<td></td>
							</tr>					
							<tr>
								<td>우편번호</td>
								<td><input name="zipcode" size="5"  readonly>
									<input type="button" value="우편번호찾기" onClick="zipSearch()">
								</td>
								<td>우편번호를 검색하세요.</td>
							</tr>
							<tr>
								<td rowspan="2">주소</td>
								<td><input name="address" size="45"></td>								
							</tr>
							<tr>								
								<td><input size="45"></td>
								<td>나머지 주소를 적어주세요</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								   <input type="button" value="회원가입" onclick="inputCheck()">
								    &nbsp; &nbsp; 
								    <input type="reset" value="다시쓰기">
								    &nbsp; &nbsp; 
								    <input type="button" value="로그인" onClick="javascript:location.href='login.jsp'">
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