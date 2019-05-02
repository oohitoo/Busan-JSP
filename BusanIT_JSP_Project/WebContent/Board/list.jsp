<%@page import="Board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="Board.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	
	int totalRecord = 0; //총 게시물 수	
	int numPerpage = 10; //페이지당 레코드 수 5, 10, 15, 30
	int pagePerBlock = 15; // 블럭당 페이지 수 -> 밑에 15개 표시해주는거
	int totalPage = 0; // 총페이지 수 = (올림) 총 페이지 수 / 페이지당 레코드 수
	int totalBlock = 0; // 총 블럭 수 = (올림)총 페이지 수 / 블럭당 페이지 수
	int nowPage = 1; // 현재 페이지
	int nowBlock = 1; // 현재 블럭
	
	/* Limit 에 들어가는 숫자임 */
	int start = 0; //tblBoard 에 select 시작번호
	int end = numPerpage;
	/* Limit 에 들어가는 숫자임 끝 */
	
	//검색에 필요한 값
	String KeyField = "", KeyWord = "";
	
	totalRecord = mgr.getTotalTitle(KeyField, KeyWord);
	/* totalRecord = mgr.getTotalTitle("name", "이승기");
	out.print(totalRecord); */
	
	// 총페이지 수 = (올림) 총 페이지 수 / 페이지당 레코드 수
	totalPage = (int)Math.ceil((double)totalRecord / numPerpage);
	out.print(totalRecord + " : " + totalPage);
%>
<html>
<head>
	<title>JSPBoard</title>
</head>
<link href="../guestbook/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

</script>
<body bgcolor="#FFFFCC">
	<div align="center">
		<p />
		<h2>JSPBoard</h2>
		<table>
			<tr>
				<td width="700">Total : <%=totalRecord%> Articles ( <font
					color="red"><%=nowPage + "/" + totalPage%></font>)
				</td>
			</tr>
		</table>
		<table>
			<tr align="center">
				<%
					Vector<BoardBean> vlist = mgr.getBoardList(KeyField, KeyWord, start, end);
					int listSize = vlist.size(); //브라우저 화면에 보여질 게시물 번호
					if (vlist.isEmpty()) {
						out.println("등록된 게시물이 없습니다.");
					}
					else {
				%>
				<table cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0">
						<td width="100">번 호</td>
						<td width="250">제 목</td>
						<td width="100">이 름</td>
						<td width="150">날 짜</td>
						<td width="100">조회수</td>
					</tr>
				<%
					for(int i = 0; i < numPerpage; ++i){
						BoardBean bean = vlist.get(i);
						int num = bean.getNum();
						String subject = bean.getSubject();
						String name = bean.getName();
						String regdate = bean.getRegdate();
						int depth = bean.getDepth();
						int count = bean.getCount();
						String filename = bean.getFilename();
						
				%>
				<tr align="center">
					<td><%= totalRecord-i %></td>
					<td align="left"><%= subject %></td>
					<td><%= name %></td>
					<td><%= regdate %></td>
					<td><%= count %></td>
				</tr>
				<% } %>
				</table>
				<%
					}
				%>
			</tr>
		</table>
	</div>
</body>
</html>