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
	if(search.equals("y")){//When Search button click
		street = request.getParameter("street");
		vlist = mgr.zipcodeRead(street);
	}
%>

<html>
<head>
<title>Search zipdoe</title>
<link href="../css/ZipcodeStyle.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

	function loadSearch() {
		frm = document.zipFrm;
		if(frm.street.value==""){
				alert("Input street name");
				return;
			}
			frm.action = "zipSearch.jsp";
			frm.submit();
	}
	function sendAdd(zipcode, adds) {
		opener.document.regFrm.zipcode.value=zipcode;
		opener.document.regFrm.address.value=adds;
		self.close();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td><br />Input street name : <input name="street"> 
					<input type="button" value="검색" onclick="loadSearch()"></td>
				</tr>
				<!-- 	검색결과 시작 -->
				<%
						if(search.equals("y")){
							if(vlist.isEmpty())	{
					%>
				<tr>
					<td align="center"><br />No Results Found.</td>
				</tr>


				<%}	else	{
						%>
				<tr>
					<td align="center"><br />※After searching, click the zip code below and it will be filled in automatically.</td>
				</tr>
				<%
						for(int i = 0; i<vlist.size();i++)
						{
							
							ZipcodeBean bean = vlist.get(i);
							String postnum = bean.getPostnum();
							String city = bean.getCity();
							String gu = bean.getGu();
							String streets = bean.getStreet();
							String streetNum = bean.getStreetNum();
							String addrs = city + " " + gu + " " + streets + " ";
							 
					%>
				<tr>
					<td>
						<a href="#" onclick="javascript:sendAdd('<%=postnum%>','<%=addrs%>')"><%=postnum + " " +addrs%></a>
					</td>
				</tr>
				<%	}//for		
					  }
					}
					%>
				<!-- 	검색결과 끝 -->
				<tr>
					<td align="center"><br /> <a href="#" onClick="self.close()">Close</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>