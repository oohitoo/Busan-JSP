<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="Service.ServiceBean" scope="session"/>
<jsp:include page="form.jsp" />
<%
	  String nowPage = request.getParameter("nowPage");
	  String subject = bean.getSubject();
	  String content = bean.getContent(); 
		
	
%>
<html>
<head>
<title>답변</title>
<link href="style.css" rel="stylesheet" type="text/css">
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
    width: 349px;
    padding: 1px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
</head>

<body>
<form method="post" action="ServiceReply" >
<div align="center">
<br><br>
<div><p />
		<br />
		<img src="img/Service.jpg" width=100%" height="300">
		<hr/>
		<p/>
		<br />

<table  class="type03">
	<tr>
		<td align="center">
		<table style="width:950px;" >
			 <tr>
      			<th>I D</th> 
    			<th>
	 			<input name="id" size="10" maxlength="8" readonly value="<%=session.getAttribute("idKey")%>"></th>
			</tr> 
			<tr>
				<th>제 목</th>
				<th>
				<input name="subject" size="50" value="답변 : <%=subject%>" maxlength="50"></th>
			</tr>
			
			<tr>
				<th>내 용</th>
				<th>
				<!-- <textarea style="width:750px; height:400px;" id="textAreaContent" name="content" rows="10" cols="80" > -->
					<textarea style="width:750px; height:400px;"name="content" rows="10" cols="80"><%=content %>
==========================================================
</textarea>
				</th>
			</tr>
					
		</table>
		
		</td>
	</tr>
</table>
</div>

	<tr> 	
     <td colspan="2">
	  <input type="submit"  class="btn btn-primary" value="답변등록" >
      <input type="reset"  class="btn btn-primary" value="다시쓰기">
      <input type="button"  class="btn btn-primary" value="뒤로" onClick="history.back()"></td>
    </tr> 

 <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">

</div>
</form> 
</body>

<%-- 
<!-- Smart Editor --> 
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