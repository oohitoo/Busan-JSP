<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="Service.ServiceBean"%>
 <jsp:include page="list.jsp" />
 <!--파일 업로드  -->
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  ServiceBean bean = (ServiceBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getName(); 
	  String content = bean.getContent(); 
	  String filename = bean.getFilename();
%>
<html>
<head>
<title>파일수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
</head>
<body>
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td height="21" align="center">파일수정</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="ServiceUpdate2" enctype="multipart/form-data">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">성 명</td>
     <td width="80%">
	  <input name="name" value="<%=name%>" size="30" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td>제 목</td>
     <td>
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     <td>내 용</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
    <tr>
    <td>첨부파일</td>
     <td>
     	<%=filename!=null?filename:"첨부된 파일이 없습니다."%>
     	<input type="file" name="filename" size="50" maxlength="50">
     </td>
    </tr>
	<tr>
     <td>비밀 번호</td> 
     <td><input type="password" name="pass" size="15" maxlength="15">
      수정 시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="수정완료" onClick="check()">
      <input type="reset" value="다시수정"> 
      <input type="button" value="뒤로" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
</html>