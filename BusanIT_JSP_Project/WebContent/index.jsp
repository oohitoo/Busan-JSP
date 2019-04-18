<!-- 
	Date : 2019-04-12
	Time : PM 09:39
	작성자 : 팀장 
 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="bean" class="Bean.BeanTest" />
<title>Test Index 페이지 입니다.</title>
<%=bean.BeanTest()%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<div class="container">
	<!-- 상단 이미지 부분 -->
	<div class="row hidden-xs topper">
		<div class="col-xs-7 col-sm-7">
			<a href="#">
			<img alt="SECUREVIEW" src="http://blog.convertify.io/assets/images/logo--hero.png" 
			style = "width: 400px; height: 100px;"></a>
		</div>
		<div
			class="col-xs-5 col-xs-offset-1 col-sm-5 col-sm-offset-0 text-right ">
			<p am-CallNow></p>
		</div>
	</div>
</div>

