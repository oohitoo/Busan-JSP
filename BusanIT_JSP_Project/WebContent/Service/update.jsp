<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="Service.ServiceBean"%>
 <jsp:include page="form.jsp" />
 <!-- 파일 업로드 -->
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  ServiceBean bean = (ServiceBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getsName(); 
	  String content = bean.getContent(); 
%>
<html>
<head>
<title>JSP Service</title>
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
<style>
table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 80px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 50px;
    padding: 1px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
</head>

<body>
<div align="center" ><br/><br/>
<form name="updateFrm" method="post" action="ServiceUpdate">
<p />
		<br />
		<img src="img/Service.jpg" width=100%" height="300">
		<hr/>
		<p/>
		<br />
<table  class="type03"  style="width:950px;" >
     <tr>
      <th>ID</th> 
     <td width="80%">
	 <input name="id" size="10" maxlength="8" readonly value="<%=session.getAttribute("idKey")%>">
	 </td>
	</tr> 
	<tr>
     	<th>제 목</th>
     <td>
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     	<th>내 용</th>
     <td>
	 <textarea style="width:750px; height:400px;"name="content" rows="10" cols="80"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     	<th>비밀 번호</th> 
     <td><input type="password" name="pass" size="15" maxlength="15">
      수정 시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
    
    </tr> 
   </td>
 </tr>
 
   </table>
   <div align="center">
 <td colspan="2" align="center">
	  <input type="button"  class="btn btn-primary" value="수정완료" onClick="check()">
      <input type="reset" class="btn btn-primary" value="다시수정"> 
      <input type="button" class="btn btn-primary" value="뒤로" onClick="history.go(-1)">
	 </td>
</div>

 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
<%-- <!-- Smart Editor --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Service/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Service/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<!-- Smart Editor -->
<script type="text/javascript">
	var oEditors = []; //전역변수
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors, //전역변수명
	    elPlaceHolder: "textAreaContent", //에디터가 그려질 textarea id값
	    sSkinURI: " <%=request.getContextPath()%>/Service/se2/SmartEditor2Skin.html ", // 에디터의 HTML
	    fCreator: "createSEditor2" , //se2basicCreator.js 메소드명
	    htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	    bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
	    bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
	    bUseModeChanger : true,
	    }
	});
		 
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/beerking/userimg/'+filepath+'">';
	    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	}

</script> --%>
</html>