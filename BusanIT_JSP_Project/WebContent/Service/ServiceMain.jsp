<%@page import="Service.ServiceBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="Service.ServiceMgr" />
<!-- ����������! -->
<jsp:include page="form.jsp" />
<%
	request.setCharacterEncoding("EUC-KR");

	int totalRecord = 0; //�� �Խù� ��
	int numPerPage = 10; //�������� ���ڵ� �� 5,10,15,30
	int pagePerBlock = 15; //���� ������ ��
	int totalPage = 0; //�� ������ ��=(�ø�)�ѰԽù��� / �������� ���ڵ� ��		
	int totalBlock = 0; //�� �� ��=(�ø�) �� �������� / ���� �������� 
	int nowPage = 1; //���� ������
	int nowBlock = 1; //���� ��

	//���������� ������ �Խù� ����
	if (request.getParameter("numPerPage") != null && !request.getParameter("numPerPage").equals("null")) {
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	}
	//tblService �� select ���۹�ȣ
	int start = 0;
	int end = numPerPage; //10��

	//�˻��� �ʿ��� �� 
	String keyField = "", keyWord = "";

	//�˻��϶�
	if (request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");

	}

	//�˻��Ŀ� �ٽ� �˻��ȵ� ������ ��û 
	if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
		keyField = "";
		keyWord = "";
		/* reload �� true �϶� �� */
	}

	totalRecord = mgr.getTotalCount(keyField, keyWord);
	//nowPage�� ��û�� ��� , ���� ��û���� ������ default ���� 0 �� �ȴ�
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	}
	start = (nowPage * numPerPage) - numPerPage;

	//��ü ��������
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

	//��ü ����
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

	//�����
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
<html>
<head>
<title>Service</title>
<link href="style.css" rel="stylesheet" type="text/css">
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
			alert("�˻�� �Է��ϼ���");
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
</head>
<body>
	<div align="center">
		<p />
		<br />
		<h1>������</h1>
		<br />

		<form name="searchFrm" method="post" action="ServiceMain.jsp">
			<table class="type09" border="0" width="900" align=center
				cellpadding="4" cellspacing="0">
				<tr>
					<!--�˻���-->
					<td align="center" valign="bottom">
						<!-- ����Ʈ �ڽ� --> <select name="keyField" size="1">
							<option value="subject">�� ��</option>
							<option value="content">�� ��</option>
					</select> <input size="30" name="keyWord"> <input type="button"
						value="ã��" onClick="javascript:check()"> <input
						type="hidden" name="nowPage" value="1">
					</td>
				</tr>
			</table>
		</form>
		<table>
			<tr>
				<td width="700">Total : <%=totalRecord%>Articles( <font
					color="red"><%=nowPage + "/" + totalPage%></font> )
				</td>
			</tr>
		</table>

		<table>
			<tr>
				<td align="center" colspan="2">
					<%
						Vector<ServiceBean> vlist = mgr.getServiceList(keyField, keyWord, start, end);
						int listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("��ϵ� �Խù��� �����ϴ�");

						} else {
					%>
					<table cellspacing="0"> 
						<tr align="center">
							<td width="100">�� ȣ</td>
							<td width="250">�� ��</td>
							<td width="100">�� ��</td>
							<td width="150">�� ¥</td>
							<td width="100">��ȸ��</td>
						</tr>
						<%
							for (int i = 0; i < numPerPage; i++) {
									if (i == listSize)
										break;
									ServiceBean bean = vlist.get(i);
									int num = bean.getSnum();
									String subject = bean.getSubject();
									String name = bean.getSname();
									String regdate = bean.getRegdate();
									int depth = bean.getDepth();
									int count = bean.getCount();
									String filename = bean.getFilename();
						%>
						<tr align="center">
							<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
							<td align="left">
								<%
									if (depth > 0) {
												for (int j = 0; j < depth; j++) {
													out.println("&nbsp;&nbsp;");
												}
											}
								%> <a href="javascript:read('<%=num%>')"><%=subject%></a> <%
 	if (filename != null && !filename.equals("")) {
 %>
								<img src="img/icon_file.gif" align="middle"> <%
 	}
 %>
							</td>
							<td><%=name%></td>
							<td><%=regdate%></td>
							<td><%=count%></td>
							<%
								}
							%>
						
					</table> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<td colspan="2"><br />
				<br /></td>
			</tr>
			<tr>
				<td>
					<!-- ��� �Է� --> <%
 	int pageStart = (nowBlock - 1) * pagePerBlock + 1;
 	int pageEnd = ((pageStart + pagePerBlock) < totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
 %> <%
 	if (totalPage != 0) {
 %> <!-- ������ --> <%
 	if (nowBlock > 1) {
 %> <a
					href="javascript:bloc('<%=nowBlock - 1%> ')">prev...</a> <%
 	}
 %>&nbsp; <!-- ����¡ -->
					<%
						for (; pageStart < pageEnd; pageStart++) {
					%> <a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (nowPage == pageStart) {
 %>
						<font color="red"> <%
 	}
 %> [<%=pageStart%>]</a> <%
 	if (nowPage == pageStart) {
 %>
					</font> <%
 	}
 %> <%
 	} //for
 %>&nbsp; <!-- ������ --> <%
 	if (totalBlock > nowBlock) {
 %>
					<a href="javascript:block('<%=nowBlock + 1%>')">...next</a> <%
 	}
 %><!-- if -->
					<%
						}
					%><!--  if-->
				</td>
				<td align="right"><a href="post.jsp">[�۾���]</a> <a
					href="ServiceMain.jsp">[ó������]</a></td>
		</table>
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