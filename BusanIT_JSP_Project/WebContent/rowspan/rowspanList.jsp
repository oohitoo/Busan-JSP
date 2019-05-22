<%@page import="rowspan.RowspanBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="rowspan.RowspanMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	Vector<RowspanBean> vlist = mgr.getRowspanList();
%>
<html>
<body>
	<table border="1">
		<tr align="center">
			<td width="50">번호</td>
			<td width="100">배달상태</td>
			<td width="150">주문메뉴</td>
			<td width="50">수량</td>
			<td width="150">픽업/배달</td>
		</tr>
		<%
		    int rcnt  = 1 , scnt = 0;	
			for (int i = 0; i < vlist.size(); i++) {
				RowspanBean bean = vlist.get(i);
				int num = bean.getNum();
				int menuNum = bean.getMenuNum();
				int delState = bean.getDelState();
				String menu = bean.getMenu();
				int cnt = bean.getCnt();
				String note = bean.getNote();
				//동일한 num으로 레코드 갯수
				rcnt = mgr.getNumCnt(num) - scnt;
				//System.out.println(rcnt + " : " + scnt);
		%>
		<%if(rcnt==1&&scnt==0){%>
		<tr>
			 <td><%=num%></td>
			 <td><%=delState%></td>
			<td><%=menu%></td>
			<td><%=cnt%></td>
			 <td><%=note%></td>
		</tr>
		<%}else{%>
		<tr>
			 <%if(rcnt!=1&&scnt==0){%><td rowspan="<%=rcnt%>"><%=num%></td><%}%>
			 <%if(rcnt!=1&&scnt==0){%><td rowspan="<%=rcnt%>"><%=delState%></td><%}%>
			<td><%=menu%></td>
			<td><%=cnt%></td>
			 <%if(rcnt!=1&&scnt==0){%><td rowspan="<%=rcnt%>"><%=note%></td><%}%>
		</tr>
		<%
				scnt++;
				if(mgr.getNumCnt(num)==scnt){	
					scnt = 0;
				}
		%>
		<%
			}
		}%>
	</table>
</body>
</html>





