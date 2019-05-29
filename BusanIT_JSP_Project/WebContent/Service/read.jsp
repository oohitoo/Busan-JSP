<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="Service.ServiceBean"%>
<%@page import="Service.UtilMgr"%>
<jsp:useBean id="mgr" class="Service.ServiceMgr" />
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="form.jsp" />

<%

	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  String numPerPage = request.getParameter("numPerPage");
	  //조회수 증가
	  
	  mgr.upCount(num);
	  //게시물 읽어오기
	  
	  ServiceBean bean = mgr.getService(num);
	  String name = bean.getsName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String ip = bean.getIp();
	  String pass = bean.getPass();
	  int count = bean.getCount();
 		session.setAttribute("bean", bean);  

%>

<script type="text/javascript">
	function list() {
		document.listFrm.action = "ServiceMain.jsp";
		document.listFrm.submit();
	}
	function cDel(cnum){
		document.cFrm.cnum.value=cnum;
		document.cFrm.flag.value="del";		
		document.cFrm.submit();
		
	}
</script>
<style>
table.type03 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type03 th {
  width: 80px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;;

}
table.type03 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<div>
<p />
		<br />
		<img src="img/Service.jpg" width="100%" height="300">
		<hr/>
		<p/>
		<br />
<table  class="type03">
	<tr>
		<td align="center">
		<table style="width:950px;" >
			<tr>
				<th > 이 름 </th>
				<td><%=name %></td>
			</tr>
			<tr>
			<th > 등록날짜 </th>
  			<td><%=regdate %></td>
			</tr>
			<tr> 
  			  <th > 제 목</th>
   			<td colspan="3"><%=subject %></td>
   			</tr>
			<tr> 
   			 <td colspan="4" ><br/><pre style="font-size:100%;"><%=content %></pre><br/></td>
   			</tr>
		</table>
		
		</td>
	</tr>
</table>

<div align="center">
	  <a href="javascript:list()" ><input type="button" class="btn btn-primary" value="리스트"></a> 
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" ><input type="button" class="btn btn-primary" value="수정"></a> 
 <a href="reply.jsp?nowPage=<%=nowPage%>" ><input type="button" class="btn btn-primary" value="답변"></a> 
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>"><input type="button" class="btn btn-primary" value="삭제"></a> 
 </div>
</div>

<form name="listFrm">
	<input type="hidden" name="nowpage" value="<%=nowPage %>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage %>">
	<%if(!(keyWord==null||keyWord.equals(""))){ %>
	<input type="hidden" name="keyWord" value="<%=keyWord %>">
	<input type="hidden" name="keyField" value="<%=keyField %>">
	<%} %>
</form>

