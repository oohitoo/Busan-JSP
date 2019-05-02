<%@page import="Board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="Board.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	
	int totalRecord = 0; //�� �Խù� ��	
	int numPerpage = 10; //�������� ���ڵ� �� 5, 10, 15, 30
	int pagePerBlock = 15; // ���� ������ �� -> �ؿ� 15�� ǥ�����ִ°�
	int totalPage = 0; // �������� �� = (�ø�) �� ������ �� / �������� ���ڵ� ��
	int totalBlock = 0; // �� �� �� = (�ø�)�� ������ �� / ���� ������ ��
	int nowPage = 1; // ���� ������
	int nowBlock = 1; // ���� ��
	
	/* Limit �� ���� ������ */
	int start = 0; //tblBoard �� select ���۹�ȣ
	int end = numPerpage;
	/* Limit �� ���� ������ �� */
	
	//�˻��� �ʿ��� ��
	String KeyField = "", KeyWord = "";
	
	totalRecord = mgr.getTotalTitle(KeyField, KeyWord);
	/* totalRecord = mgr.getTotalTitle("name", "�̽±�");
	out.print(totalRecord); */
	
	// �������� �� = (�ø�) �� ������ �� / �������� ���ڵ� ��
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
					int listSize = vlist.size(); //������ ȭ�鿡 ������ �Խù� ��ȣ
					if (vlist.isEmpty()) {
						out.println("��ϵ� �Խù��� �����ϴ�.");
					}
					else {
				%>
				<table cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0">
						<td width="100">�� ȣ</td>
						<td width="250">�� ��</td>
						<td width="100">�� ��</td>
						<td width="150">�� ¥</td>
						<td width="100">��ȸ��</td>
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