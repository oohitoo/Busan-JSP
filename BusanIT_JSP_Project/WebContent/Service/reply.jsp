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
<title>�亯</title>
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
				<th>�� ��</th>
				<th>
				<input name="subject" size="50" value="�亯 : <%=subject%>" maxlength="50"></th>
			</tr>
			
			<tr>
				<th>�� ��</th>
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
	  <input type="submit"  class="btn btn-primary" value="�亯���" >
      <input type="reset"  class="btn btn-primary" value="�ٽþ���">
      <input type="button"  class="btn btn-primary" value="�ڷ�" onClick="history.back()"></td>
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
		 
	// textArea�� �̹��� ÷��
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/beerking/userimg/'+filepath+'">';
	    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	}

</script> --%>
</html>