<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<title>Sign Up</title>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력하세요");
			frm.id.focus();
			return; //function을 벗어난다.
		}
		url = "idCheck.jsp?id="+id;
		window.open(url, "IDCheck", "width = 300, height = 150");
	}
	function zipSearch() {
		url = "zipSearch.jsp?search=n";
		window.open(url, "ZipCodeSearch", "width = 500 height = 300 scrollbars = yes");
	}
</script>
</head>
<body>
    <div id="signup">
        <h3 class="text-center text-white pt-5">　</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="tables.html" method="post">
                        
                        <!-- 회원가입 -->
                            <h3 class="text-center text-primary" >Sign Up</h3>
                        	<div align="right">
                                <label for="username" class="text-primary"><a href="logIn.jsp">Log In</a></label><br>
                            </div><br/>
                        <!-- 사업자 번호 -->
                            <div class="form-group">
                                <label for="sregnumber" class="text-primary">사업자 번호:</label><br>
                                <input type="number" min="0" id="username" oninput="validity.valid||(value='');" class="form-control" placeholder="xxx-xx-xxxxx">
                                <input type="tel" pattern="^\d{3}-\d{2}-\d{5}$" placeholder="xxx-xx-xxxxx" required>
                            </div>
                        <!-- 비밀번호 -->
                            <div class="form-group">
                                <label for="password" class="text-primary">비밀번호:</label><br>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                       <!-- 가게 이름 -->
                            <div class="form-group">
                                <label for="storename" class="text-primary">상호 명:</label><br>
                                <input type="text" name="username" id="storename" class="form-control" required>
                            </div>
                        <!-- 전화 번호 -->
                            <div class="form-group">
                                <label for="sphone" class="text-primary">전화 번호:</label><br>
                                <input type="tel" class="form-control" pattern="^\d{3}-\d{4}-\d{4}$" placeholder="xxx-xxx-xxxx" required >
                            </div>
                        <!-- 주소 -->
                            <div class="form-group">
                                <label for="saddress" class="text-primary">업장 주소:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
						<!-- 식당 분류 -->
							<div class="dropdown">
							<label for="scategories" class="text-primary">음식 종류:</label><br>
								<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
									음식 종류(작동왜 안함? 개빡치네)<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
								<a class = dropdown-item>한식111</a>
								 <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
									<li>한식</li>
									<li>중식</li>
									<li>일식</li>
									<li>양식</li>
									<li class="divider"></li>
									<li>기타</li>
								</ul>
							</div>

							<!-- 가입하기 Submit -->
                            <div id="register-link" class="text-right">
                            <input type="submit" name="submit" class="btn btn-primary btn-md" value="가입하기">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>








                            
