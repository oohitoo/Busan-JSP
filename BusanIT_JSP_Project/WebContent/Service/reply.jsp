<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="Service.ServiceBean" scope="session"/>
<jsp:include page="form.jsp" />
<%
	  String nowPage = request.getParameter("nowPage");
	  String name = bean.getsName();
	  String subject = bean.getSubject();
	  String content = bean.getContent(); 
	  String id  = (String)session.getAttribute("idKey");
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
   			  <th>ID</th>
    			 <td width="80%">
				  <input name="sname" readonly value="<%=name%>" size="30" maxlength="20">
				 </td>
				</tr>
			<tr>
				<th>제 목</th>
				<th>
				<input name="subject" size="50" readonly value="답변 드립니다." maxlength="50"></th>
			</tr>
			
			<tr>
				<th>내 용</th>
				<th>
				<!-- <textarea style="width:750px; height:400px;" id="textAreaContent" name="content" rows="10" cols="80" > -->
				<textarea style="width:750px; height:400px;"name="content" rows="10" cols="80"><%=subject %>
=======================================================
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

</html>