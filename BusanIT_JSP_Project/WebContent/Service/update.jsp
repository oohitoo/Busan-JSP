<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="Service.ServiceBean"%>
 <jsp:include page="form.jsp" />
 <!-- ���� ���ε� -->
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
		 alert("������ ���� �н����带 �Է��ϼ���.");
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
     	<th>�� ��</th>
     <td>
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     	<th>�� ��</th>
     <td>
	 <textarea style="width:750px; height:400px;"name="content" rows="10" cols="80"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     	<th>��� ��ȣ</th> 
     <td><input type="password" name="pass" size="15" maxlength="15">
      ���� �ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
    </tr>
	<tr>
    
    </tr> 
   </td>
 </tr>
 
   </table>
   <div align="center">
 <td colspan="2" align="center">
	  <input type="button"  class="btn btn-primary" value="�����Ϸ�" onClick="check()">
      <input type="reset" class="btn btn-primary" value="�ٽü���"> 
      <input type="button" class="btn btn-primary" value="�ڷ�" onClick="history.go(-1)">
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