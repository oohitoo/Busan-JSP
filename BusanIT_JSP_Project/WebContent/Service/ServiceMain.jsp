<%@page import="Service.ServiceBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="Service.ServiceMgr" />
<!-- 메인페이지! -->
<jsp:include page="form.jsp" />
<%
	request.setCharacterEncoding("EUC-KR");

	int totalRecord = 0; //총 게시물 수
	int numPerPage = 10; //페이지당 레코드 수 5,10,15,30
	int pagePerBlock = 15; //블럭당 페이지 수
	int totalPage = 0; //총 페이지 수=(올림)총게시물수 / 페이지당 레코드 수		
	int totalBlock = 0; //총 블럭 수=(올림) 총 페이지수 / 블럭당 페이지수 
	int nowPage = 1; //현재 페이지
	int nowBlock = 1; //현재 블럭

	//한페이지에 보여질 게시물 갯수
	if (request.getParameter("numPerPage") != null && !request.getParameter("numPerPage").equals("null")) {
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	}
	//tblService 에 select 시작번호
	int start = 0;
	int end = numPerPage; //10개

	//검색에 필요한 값 
	String keyField = "", keyWord = "";

	//검색일때
	if (request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");

	}

	//검색후에 다시 검색안된 페이지 요청 
	if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
		keyField = "";
		keyWord = "";
		/* reload 가 true 일때 빈값 */
	}

	totalRecord = mgr.getTotalCount(keyField, keyWord);
	//nowPage를 요청한 경우 , 만약 요청하지 않으면 default 값이 0 이 된다
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	}
	start = (nowPage * numPerPage) - numPerPage;

	//전체 페이지수
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

	//전체 블럭수
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

	//현재블럭
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
<html>
<head>
<title>Service</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->

<script type="text/javascript">
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(block) {
		document.readFrm.nowPage.value =
<%=pagePerBlock%>
	* (block - 1) + 1;
		document.readFrm.submit();
	}
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요");
			document.searchFrm.keyWord.focus();
			return;

		}
		document.searchFrm.submit();

	}
	function list() {
		document.listFrm.action = "ServiceMain.jsp";
		document.listFrm.submit();

	}
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value = numPerPage;
		document.readFrm.submit();

	}
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();

	}
</script>
<style>
body { background: #fff; }
.blueone {
  border-collapse: collapse;
}  
.blueone th {
  padding: 10px;
  color: #2E76FD;
  border-bottom: 3px solid #168;
  text-align: left;
}
.blueone td {
  color: #669;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}
.blueone tr:hover td {
  color: #004;
}



</style>
</head>
<body>
	<div align="center">
		<p />
		<br />
		<img src="img/Service.jpg" width="100%" height="300">
		<hr/>
		<p/>
		<br />
		<table >
			<tr>
				<td align="center" colspan="2">
					<%
						Vector<ServiceBean> vlist = mgr.getServiceList(keyField, keyWord, start, end);
						int listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다");

						} else {
					%>
					<table class="blueone" height="30"><!--  cellspacing="0" class="table table-striped" -->
					<thead class="head">                
						<tr class="text-primary" align="center">
							<th width="120" >번 호</th>
							<th width="280">제 목</th>
							<th width="120">이 름</th>
							<th width="180">날 짜</th>
							<th width="130">조회수</th>
						</tr>
						</thead>
						
						<%
							for (int i = 0; i < numPerPage; i++) {
									if (i == listSize)
										break;
									ServiceBean bean = vlist.get(i);
									int num = bean.getsNum();
									String subject = bean.getSubject();
									String name = (String)session.getAttribute("idKey");
									String regdate = bean.getRegdate();
									int depth = bean.getDepth();
									int count = bean.getCount();
						%>
						<tbody class="body">
						<tr align="center">
							<td><%=totalRecord-((nowPage-1)*numPerPage)-i%></td>
							<td align="left">
								<%
									if (depth > 0) {
												for (int j = 0; j < depth; j++) {
													out.println("&nbsp;&nbsp;");
												}
											}
								%> <a href="javascript:read('<%=num%>')"><%=subject%></a> 
							</td>
							<td><%=name%></td>
							<td><%=regdate%></td>
							<td><%=count%></td>
							<%}%>
						
					</table> 
					<%}%>
				</td>
			</tr>
			</tbody>
			
			<tfoot class="foot">
						<tr>
				<td colspan="2" align="center">
				<br />
				<br />
				</td>
			</tr>
			<tr>
				<td>
					<!-- 블락 입력 --> 
				<%
				 	int pageStart = (nowBlock - 1) * pagePerBlock + 1;
				 	int pageEnd = ((pageStart + pagePerBlock) < totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
				 %> 
				 <%
				 	if (totalPage != 0) {
				 %> 
				 <!-- 이전블럭 --> 
				 <%
				 if (nowBlock > 1)
				 {
				%> 
				<a href="javascript:bloc('<%=nowBlock - 1%> ')">prev...</a> 
				<%}%>&nbsp; <!-- 페이징 -->
					<%for (; pageStart < pageEnd; pageStart++) 
					{
					%> 
					<a href="javascript:pageing('<%=pageStart%>')"> 
					<%
				 	if (nowPage == pageStart) 
				 	{
				 %>
					<font color="red">
					<%}%> 
					
					[<%=pageStart%>]</a> 
					<%if (nowPage == pageStart)
					{
				 	%>
					</font> 
					<%}%> 
					<%}%><!--  for -->
					&nbsp;
					 <!-- 다음블럭 --> 
					 <%
				 	if (totalBlock > nowBlock) 
				 	{
				 	  %>
			<a href="javascript:block('<%=nowBlock + 1%>')">...next</a> <%
			 	}
			 %><!-- if -->
					<%
						}
					%><!--  if-->
					
				</td>
				</tfoot>
			<td align="right">
				<a href="post.jsp">
				<input type="button" class="btn btn-primary" value="글쓰기">
				</a>
			</td>
		</table>
		<form name="searchFrm" method="post" action="ServiceMain.jsp">
			<table class="type09" border="0" width="900" align=center
				cellpadding="4" cellspacing="0">
				<tr>
					<!--검색줄-->
					<td align="center" valign="bottom">
						<!-- 셀렉트 박스 --> <select name="keyField" size="1">
							<option value="subject">제 목</option>
							<option value="content">내 용</option>
					</select> <input size="30" name="keyWord"> 
					<input type="button" value="찾기" onClick="javascript:check()"> 
						<input type="hidden" name="nowPage" value="1">
					</td>
				</tr>
			</table>
		</form>
		<hr width="750" />

		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> <input
				type="hidden" name="nowPage" value="1">
		</form>

		<form name="readFrm">

			<input type="hidden" name="num"> <input type="hidden"
				name="nowPage" value="<%=nowPage%>"> <input type="hidden"
				name="keyField" value="<%=keyField%>"> <input
				type="hidden" name="keyWord" value="<%=keyWord%>"> <input
				type="hidden" name="numPerPage" value="<%=numPerPage%>">
		</form>
	</div>


</body>

</html>