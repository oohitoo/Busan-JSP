<%@page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int totalRecord = Integer.parseInt(request.getParameter("totalRecord")); //총 게시물수
	int numPerPage = 7;//페이지당 레코드수
	int pagePerBlock = 15;//블럭당 페이지수
	int totalBlock = 0;
	int totalPage = 0;
	int nowPage = 1;//현재페이지
	int nowBlock = 1;//현재블럭

	int start = 0; //디비의 select 시작번호
	int end = 10; //시작번호로 부터 가져올 select 갯수 numPerPage
	
	//nowPage를 요청한 경우, 만약 요청하지 않으면 default 값이 0 이다.
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage; // (1 * 10) - 10 = 0 || (2 * 10) - 10 = 10
			
	//전체 페이지 수
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
	//전체 블럭 수
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
	//현재블럭값 
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);
%>
<html>
<head>
<title>페이징 & 블럭 처리 테스트</title>
</head>
<link href="../guestbook/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function paging(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(block) {
		document.readFrm.nowPage.value = <%= pagePerBlock %> * (block-1) + 1;
		document.readFrm.submit();
	}
</script>
<body bgcolor="#FFFFCC">
	<div align="center"><br>
		<h2>페이징 & 블럭처리 테스트</h2>
		<table>
			<tr>
				<td width="700" align="center">
					Total : <%=totalRecord%> Articles ( <font color="red"><%=nowPage + "/" + totalPage%></font>)
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>게시물 번호 : &nbsp;</td>
				<%
					int listSize = totalRecord-start;
					for(int i=0; i < numPerPage; ++i){
						if(listSize == i){
							break;
						}
				%>
				<td align="center">
					<!-- 시작부터 끝번호가 된다.  -->
					<%= totalRecord-((nowPage-1) * numPerPage)-i %> 					
				</td>
				<% } // for 종료 %>
				<td align="center">&nbsp;</td>
			</tr>
		</table>
		<!-- 페이징 & 블럭 Start -->
		<table>
			<tr>
				<td>
					<%
						// 페이징에 표시될 시작변수 및 마지막 변수
						int pageStart = (nowBlock - 1) * pagePerBlock + 1;
						int pageEnd = ((pageStart+pagePerBlock)<=totalPage)?(pageStart+pagePerBlock):totalPage+1;
						if (totalPage != 0) {
					%>
					<!-- 이전블럭 -->
					<% 		if (nowBlock > 1) { %>
								<a href="javascript:block(<%= nowBlock + -1%>)">prev...</a>
					<% 		} %>
					<!-- 페이징 -->
					<%
							for (; pageStart<pageEnd;pageStart++) {
					%>
								<a href="javascript:paging(<%= pageStart %>)">
								<% if (nowPage == pageStart) { %><font color="red"> <%} %>
								[<%= pageStart %>]</a>
								<% if(nowPage == pageStart) {%></font><%} %>
					<%  	} %>&nbsp;
					
					<!-- 다음블럭 -->
					<% 		if (totalBlock > nowBlock) { %>
								<a href="javascript:block(<%= nowBlock + 1%>)">...next</a>
					<% 		} %>
					<% } %>
				</td>
			</tr>
		</table>
		<!-- 페이징 & 블럭 End -->
		<hr width="45%">
		<form name="readFrm">
			<input type="hidden" name="totalRecord" value="<%= totalRecord %>" />
			<input type="hidden" name="nowPage" value="<%= nowPage %>" />
		</form>
		<b> totalRecord : <%=totalRecord%>&nbsp; numPerPage : <%=numPerPage%>&nbsp;
			pagePerBlock : <%=pagePerBlock%>&nbsp; totalPage : <%=totalPage%>&nbsp;<br />
			totalBlock : <%=totalBlock%>&nbsp; nowPage : <%=nowPage%>&nbsp;
			nowBlock : <%=nowBlock%>&nbsp; start : <%=start%>&nbsp;
		</b>
		<p />
		<input type="button" value="TotalRecord 입력폼" onClick="javascript:location.href='pageView.html'">
	</div>
</html>
