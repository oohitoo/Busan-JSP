<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="Service.ServiceMgr" %>
<%@page import="Service.ServiceBean" %>
<jsp:useBean id="mgr" class="Service.ServiceMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
/* 	String id  = (String)session.getAttribute("idKey");  */
%>
<!-- �� �ۼ������� -->
<jsp:include page="form.jsp" />

<script>
function check() {
	if (document.content.pass.value == "") {
		alert("������ �Է��ϼ���.");
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
				<th width="10%">�� ��</th>
				<th width="90%">
				<input name="sname" size="10" maxlength="8"  readonly value="<%=session.getAttribute("idKey")%>"></th>
			</tr>
			<%} else{ %>
			<tr>
				<th width="10%">�� ��</th>
				<th width="90%">
				<input name="sname" size="10" maxlength="8"></th>
			</tr>
			<%} %>
			<tr>
				<th>�� ��</th>
				<th>
				<input name="subject" size="50" maxlength="30"></th>
			</tr>
			<tr>
				<th>�� ��</th>
				<td><!-- <textarea style="width:750px; height:400px;" id="textAreaContent" name="content" rows="10" cols="80" onClick="check()"> -->
				<textarea style="width:750px; height:400px;"name="content" rows="10" cols="80"></textarea>
				</td>
		<%-- 		<%
					ServiceBean bean = mgr.insertService(req);
					
				%> --%>
				
			</tr>
			<tr>
				<th width="15%">��� ��ȣ</th>
				<th><input type="password" name="pass" size="15" maxlength="15"></th>
			</tr>
	 <!-- 		<tr>
 				<td>����Ÿ��</td>
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
					 <input type="submit" class="btn btn-primary" value="���" id="submit_button">
					 <input type="reset" class="btn btn-primary" value="�ٽþ���">
					<!--  <input type="button" value="����Ʈ" onClick="javascript:location.href='ServiceMain.jsp'"> -->
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
	var oEditors = []; //��������
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors, //����������
	    elPlaceHolder: "textAreaContent", //�����Ͱ� �׷��� textarea id��
	    sSkinURI: " <%=request.getContextPath()%>/Service/se2/SmartEditor2Skin.html ", // �������� HTML
	    fCreator: "createSEditor2" , //se2basicCreator.js �޼ҵ��
	    htParams : { // ���� ��� ���� (true:���/ false:������� ����)
	    bUseToolbar : true, // �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����) 
	    bUseVerticalResizer : true, // ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����) 
	    bUseModeChanger : true,
	    }
	});
	function submitContents() {
	    // �������� ������ textarea�� ����ȴ�.
	    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	    try {
	        elClickedObj.form.submit();
	    } catch(e) {}
	}
	
	
	// textArea�� �̹��� ÷��
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/beerking/userimg/'+filepath+'">';
	    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	}
1
</script> --%>