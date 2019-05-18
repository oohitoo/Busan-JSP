<%@page import="login.LoginBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="login.LoginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String Id  = (String)session.getAttribute("idKey");	
	LoginBean bBean = mMgr.getCustomer(Id);
	
	
	//주소 나머지 주소 구분하는 내용
	String [] totalAddress = bBean.getcAddress().split(" ");
	String caddress1="";	//도로주소 
	String caddress2="";	//나머지주소
	
	//for문으로 주소 구분
	for(int i =0;i<totalAddress.length;i++){
		//주소가 null이면 종료
		if(totalAddress[i]==null) break;
		
		//도로주소는 3까지 더하고 나머지 주소는 그 나머지를 다 더함
		if(i<4){
			caddress1 = caddress1 + totalAddress[i]+" "; 	
		}else{
			caddress2 = caddress2  + totalAddress[i]+" ";
		}
	}

	
%>

<link rel="stylesheet" href="css/MainIndex.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
	//Search zipcode
	function zipSearch() {
		url = "zipSearch.jsp?search=n";
		open(url, "ZipCodeSearch", "width=500,height=350,scrollbars=yes");
	}
</script>
<div id="memberUpdate" >
				<br/><br/>
					<div class="container">
						<div id="memberUpdate-row"
								class="row justify-content-center align-items-center" style = "width:930px">
							<div id="memberUpdate-column" class="col-md-6">
								<div id="memberUpdate-box" class="col-md-12">
<!-- 									<form name="memberUpdateFrm" id="login-form" class="form" action="memberUpdateProc.jsp" method="post"> -->
									<form name="member" class="form" action="memberUpdateProc.jsp" method="post">
										<h3 class="text-center text-primary">회원정보 수정</h3>
											<!-- 사용자 아이디 -->
											<div class="form-group">
												<label for="username" class="text-primary">사용자 아이디:</label><br>
												<input name="id"  class="form-control" value="<%=bBean.getId() %>" readonly>
											</div>
											
											<!-- 비밀번호 -->
											<div class="form-group">
												<label for="password" class="text-primary">비밀번호:</label><br> 
												<input type="password" name="pwd" class="form-control" value="<%=bBean.getPwd()%>">
											</div>
											
											<!-- 비밀번호 확인 -->
											<div class="form-group">
												<label for="password" class="text-primary">비밀번호 확인:</label><br> 
												<input type="password" name="repwd" id="password" class="form-control">
											</div>
											
											<!-- 사용자 이름 -->
											<div class="form-group">
												<label for="username" class="text-primary">사용자 이름:</label><br>
												<input name="name" class="form-control"  value="<%=bBean.getcNick()%>">
											</div>
											
											<!-- 사용자 닉네임 -->
											<div class="form-group">
												<label for="username" class="text-primary">사용자 닉네임:</label><br>
												<input name="cNick" class="form-control" value="<%=bBean.getName() %>">
											</div>
											
											<!-- 사용자 전화번호 -->
											<div class="form-group">
												<label for="username" class="text-primary">사용자 전화번호:</label><br>
												<input name="cPhone" class="form-control" value="<%=bBean.getcPhone() %>">
											</div>
											
											<!-- 우편 번호 -->
											<div class="form-group" >
												<label for="username" class="text-primary">우편번호 : </label>&nbsp;
												<input type="button" value="우편번호찾기" onClick="zipSearch()">
												<input name="cPost" size="5" class="form-control" value="<%=bBean.getcPost()%>" readonly> 
												
											</div>
											
											<!-- 주소 -->
											<div class="form-group">
												<label for="username" class="text-primary">주소:</label><br>
												<input type="text" name="caddress1" id="useraddress" value="<%=caddress1 %>" class="form-control"><br/>
												<input type="text" name="caddress2" id="useraddress" value="<%=caddress2 %>"class="form-control" placeholder="나머지 주소를 입력하세요">
											</div>
																			

																			
																			
											<div class="form-group">
												<input type="submit" value="수정완료"> &nbsp; &nbsp; 
												<input type="reset" value="다시쓰기">
											</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>