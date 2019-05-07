<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="Service.ServiceBean"%>
<%@page import="Service.UtilMgr"%>
<jsp:useBean id="mgr" class="Service.ServiceMgr" />
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="list.jsp" />

<%
	request.setCharacterEncoding("EUC-KR");
	String id  = (String)session.getAttribute("idKey"); 
%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  String numPerPage = request.getParameter("numPerPage");
	  //��ȸ�� ����
	  mgr.upCount(num);
	  //�Խù� �о����
	  ServiceBean bean = mgr.getService(num);
	  String name = bean.getName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean);
%>

<script type="text/javascript">
	function down(filename){
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
		
	}
	function list() {
		document.listFrm.action = "Service.jsp";
		document.listFrm.submit();
	}
</script>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" width="10%"> �� �� </td>
  <td><%=name %></td>
	</tr>
	<tr>
  <td align="center" width="15%"> ��ϳ�¥ </td>
  <td><%=regdate %></td>
 </tr>
 <tr> 
    <td align="center"> �� ��</td>
    <td colspan="3"><%=subject %></td>
   </tr>
   <tr> 
     <td align="center" width="15%" >÷������</td>
     <td  colspan="5">
     <%if(filename!=null&&!filename.equals("")){ %>
     <a href="javascript:down('<%=filename%>')">
     <%=filename %> </a>&nbsp; &nbsp;
     <font color="blue">(<%=UtilMgr.getKBytes(filesize)%>KBytes)</font>
     <%} else {
    	 out.println("��ϵ� ������ �����ϴ�");
    	 }%>
     
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content %></pre><br/></td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ <a href="javascript:list()" >����Ʈ</a> | 
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >�������</a> |
 <a href="update2.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >���ϼ���</a> |
 <a href="reply.jsp?nowPage=<%=nowPage%>" >�� ��</a> |
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">�� ��</a> ]<br/>
  </td>
 </tr>
</table>
<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm">
	<input type="hidden" name="nowpage" value="<%=nowPage %>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage %>">
	<%if(!(keyWord==null||keyWord.equals(""))){ %>
	<input type="hidden" name="keyWord" value="<%=keyWord %>">
	<input type="hidden" name="keyField" value="<%=keyField %>">
	<%} %>
</form>
</body>
</html>