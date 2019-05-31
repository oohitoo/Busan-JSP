<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="login.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="login.LoginMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey");
	
	if(id == null){ %>
		<script>
			location.replace("login.html");
		</script>
	<%}else{
	
	LoginBean bean = mgr.getCustomer(id);
	
	//주소 나머지 주소 구분하는 내용
		String [] totalAddress = bean.getcAddress().split(" ");
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
<script type="text/javascript" src="script.js"></script>
<script>
	function menulist(menu) {
		console.log(menu);
		location.href = 'item/itemProc.jsp?menu='+menu;
	}
	//Search zipcode
	function zipSearch() {
		url = "zipSearch.jsp?search=n";
		open(url, "ZipCodeSearch", "width=500,height=350,scrollbars=yes");
	}
</script>
<jsp:include page="designForm.jsp" />
<!-- 여기에 메인부분!!! -->
<div id="memberUpdate">
	<br />
	<br />
	<div class="container">
		<div id="memberUpdate-row"
			class="row justify-content-center align-items-center"
			style="width: 930px">
			<div id="memberUpdate-column" class="col-md-6">
				<div id="memberUpdate-box" class="col-md-12">
					<form name="member" class="form" action="memberUpdateProc.jsp" >
						<h3 class="text-center text-primary">회원정보 수정</h3>
						<!-- 사용자 아이디 -->
						<div class="form-group">
							<label for="username" class="text-primary">사용자 아이디:</label><br>
							<input name="id" class="form-control" value="<%=bean.getId() %>"
								readonly>
						</div>

						<!-- 비밀번호 -->
						<div class="form-group">
							<label for="password" class="text-primary">비밀번호:</label><br>
							<input type="password" name="pwd" class="form-control" value="<%=bean.getPwd()%>">
						</div>

						<!-- 비밀번호 확인 -->
						<div class="form-group">
							<label for="password" class="text-primary">비밀번호 확인:</label><br>
							<input type="password" name="repwd" id="password"
								class="form-control">
						</div>

						<!-- 사용자 이름 -->
						<div class="form-group">
							<label for="username" class="text-primary">사용자 이름:</label><br>
							<input name="name" class="form-control" value="<%=bean.getcNick()%>">
						</div>

						<!-- 사용자 닉네임 -->
						<div class="form-group">
							<label for="username" class="text-primary">사용자 닉네임:</label><br>
							<input name="cNick" class="form-control" value="<%=bean.getName() %>">
						</div>

						<!-- 사용자 전화번호 -->
						<div class="form-group">
							<label for="username" class="text-primary">사용자 전화번호:</label><br>
							<input name="cPhone" class="form-control" value="<%=bean.getcPhone() %>">
						</div>

						<!-- 우편 번호 -->
						<div class="form-group">
							<label for="username" class="text-primary">우편번호 : </label>&nbsp;
							<input type="button"  class="btn btn-primary" value="우편번호찾기" onClick="zipSearch()" style="height: 33px; padding-top: 4px;">
							<input name="cPost" size="5" class="form-control" value="<%=bean.getcPost()%>" readonly >

						</div>

						<!-- 주소 -->
						<div class="form-group">
							<label for="username" class="text-primary">주소:</label><br>
							 <input name="caddress1" value="<%=caddress1 %>" class="form-control"><br /> 
							 <input name="caddress2" value="<%=caddress2 %>" class="form-control" placeholder="나머지 주소를 입력하세요">
						</div>
						
						<div class="form-group">
							<input type="button" class="btn btn-primary" value="수정완료" onclick="inputCheck()"> &nbsp; &nbsp; 
							<input type="reset"  class="btn btn-primary" value="다시쓰기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%}%>