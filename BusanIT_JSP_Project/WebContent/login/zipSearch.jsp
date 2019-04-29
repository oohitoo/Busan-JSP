<!-- zipSearch.jsp -->
<%@page import="login.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="login.loginMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String search = request.getParameter("search");
	String street = null;
	Vector<ZipcodeBean> vlist = null;
	if (search.equals("y")) {//�˻���ư Ŭ����
		street = request.getParameter("street");
		vlist = mgr.zipcodeRead(street);
	}
%>

<html>
<head>
<title>�����ȣ �˻�</title>
<link href="../css/ZipcodeStyle.css" rel="stylesheet" type="text/css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	function loadSearch() {
		frm = document.zipFrm;
		if (frm.street.value == "") {
			alert("���θ��� �Է��ϼ���.");
			return;
		}
		frm.action = "zipSearch.jsp";
		frm.submit();
	}
	function sendAdd(zipcode, adds) {
		opener.document.signup.cPostNumber.value = zipcode;
		opener.document.signup.caddress1.value = adds;
		self.close();
	}
</script>
</head>
<body>
	<div align="center">
		<br />
		<form name="zipFrm" method="post" calss="form-group">
			<table>
				<tr>
					<td><br />
						<label class="text-info">
						<font size=4px> ���θ� �Է� : </font></label>
						<input name="street">
						<input type="button" value="�˻�" onclick="loadSearch()">
					</td>
				</tr>
				<!-- 	�˻���� ���� -->
				<%
					if (search.equals("y")) {
						if (vlist.isEmpty()) {
				%>
				<tr>
					<td align="center"><br />�˻��� ����� �����ϴ�.</td>
				</tr>

				<%
					} else {
				%>
				<tr>
					<td align="center"><br />�ذ˻� ��, �Ʒ� �����ȣ�� Ŭ���ϸ� �ڵ����� �Էµ˴ϴ�.</td>
				</tr>
				<%
					for (int i = 0; i < vlist.size(); i++) {
								ZipcodeBean bean = vlist.get(i);
								String postnum = bean.getPostnum();
								String city = bean.getCity();
								String gu = bean.getGu();
								String streets = bean.getStreet();
								String streetNum = bean.getStreetNum();
								streetNum = streetNum.replaceAll("(\r\n|\r|\n|\n\r)", " ");
								String addrs = city + " " + gu + " " + streets + " " + streetNum + " ";
				%>
				<tr>
					<td><a href="#" onclick="javascript:sendAdd('<%=postnum%>','<%=addrs%>')"><%=postnum + " " + addrs%></a>
					</td>
				</tr>
				<%
					} //for		
						}
					}
				%>
				<!-- 	�˻���� �� -->
				<tr>
					<td align="center"><br />
					<a href="#" onclick="self.close()" class="text-info">
						<font size=4px>�ݱ�</font></a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>