<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="Service.ServiceMgr" %>
<%@page import="Service.ServiceBean" %>
<jsp:useBean id="mgr" class="Service.ServiceMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
/* 	String id  = (String)session.getAttribute("idKey");  */
%>
<!-- 글 작성페이지 -->
<jsp:include page="form.jsp" />

<script>
function check() {
	if (document.content.pass.value == "") {
		alert("내용을 입력하세요.");
		document.delFrm.pass.focus();
		return;
	}
	document.delFrm.submit();
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
    width: 349px;
    padding: 1px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
<form name="postFrm" method="post" action="ServicePost" enctype="multipart/form-data">

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
		<%if(session.getAttribute("idKey")!=null){%>
			<tr>
				<th width="10%">성 명</th>
				<th width="90%">
				<input name="sname" size="10" maxlength="8"  readonly value="<%=session.getAttribute("idKey")%>"></th>
			</tr>
			<%} else{ %>
			<tr>
				<th width="10%">성 명</th>
				<th width="90%">
				<input name="sname" size="10" maxlength="8"></th>
			</tr>
			<%} %>
			<tr>
				<th>제 목</th>
				<th>
				<input name="subject" size="50" maxlength="30"></th>
			</tr>
			<tr>
				<th>내 용</th>
				<td><!-- <textarea style="width:750px; height:400px;" id="textAreaContent" name="content" rows="10" cols="80" onClick="check()"> -->
				<textarea style="width:750px; height:400px;"name="content" rows="10" cols="80"></textarea>
				</td>
		<%-- 		<%
					ServiceBean bean = mgr.insertService(req);
					
				%> --%>
				
			</tr>
			<tr>
				<th width="15%">비밀 번호</th>
				<th><input type="password" name="pass" size="15" maxlength="15"></th>
			</tr>
	 <!-- 		<tr>
 				<td>내용타입</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>  -->
		
		</table>
		
		</td>
	</tr>
</table>
			<div align="center">
			<tr>
				<td colspan="2" >
					 <input type="submit" class="btn btn-primary" value="등록" id="submit_button">
					 <input type="reset" class="btn btn-primary" value="다시쓰기">
					<!--  <input type="button" value="리스트" onClick="javascript:location.href='ServiceMain.jsp'"> -->
				</td>
			</tr>
			</div>
</div>

<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">

</form>

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
	function submitContents() {
	    // 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	    try {
	        elClickedObj.form.submit();
	    } catch(e) {}
	}
	
	
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/beerking/userimg/'+filepath+'">';
	    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	}
1
</script> --%>