<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="Service.UtilMgr"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="menu.ordersBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="menu.ordersMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	int end = 10, a=0;
	
	if(request.getParameter("end")!=null){
		if(Integer.parseInt(request.getParameter("end"))>0){
			a = Integer.parseInt(request.getParameter("end"));
		}
		end += a;
	}
%>
<jsp:include page="designForm.jsp" />
<!------ Include the above in your HEAD tag ---------->
<script>
	function no(oDate) {
		location.href = "reservedetail.jsp?oDate=" + oDate;
	}
	function plus(end){
		document.readFrm.end.value= <%=end%>;
		document.readFrm.submit();
	}
</script>
<div class="container-fluid">
	<div class="panel panel-success"
		style="margin-left: 10px; margin-top: 50px; width: 850px;">
		<div class="panel-heading">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<h2 class="text-center pull-left" style="padding-left: 30px; color:black">
						<span style=" color: navy"><strong>���� ����</strong></span>
					</h2>
				</div>

			</div>
		</div>

		<div class="panel-body table-responsive">
			<table class="table table-hover">
				<thead>
					<tr style="color: black">
						<th class="text-center">��ȣ</th>
						<th class="text-center">���� ��¥</th>
						<th class="text-center">�Ĵ� �̸�</th>
						<th class="text-center">���� �ð�</th>
						<th class="text-center">���� �ο�</th>
					</tr>
				</thead>
				<tbody>
					<%
						//���� �����ѹ��� �ֹ���� ���� ���
						Vector<ordersBean> list = mgr.reserveList(id, end);
						if (list.isEmpty()) {
					%>
					<tr>
						<td colspan="5">���೻���� �����ϴ�.</td>
					</tr>
					<%
						} else  {
							String oDate = null;
							int j = 1;
							for (int i= 0; i < list.size(); i++) {
								ordersBean bean = list.get(i);
									String d = bean.getoDate();
									if (oDate == null) {
										oDate = bean.getoDate();
									} else if (oDate.equals(bean.getoDate())) {
										continue;
									} else {
										oDate = bean.getoDate();
										j = j + 1;
								}
									//���� �ð� ó���ϱ�
									String month = bean.getoDate().substring(6,7 );
									String day = bean.getoDate().substring(9, 10);
									String hour = bean.getoDate().substring(11, 13);
									String min = bean.getoDate().substring(14, 16);
					%>
					<tr class="edit" id="detail" onclick="javascript:no('<%=oDate%>')"
						style="cursor: pointer">
						<td id="no" class="text-center"><%=j%></td>
						<td id="name" class="text-center"><%=bean.getoDate().substring(5, 7) + "�� " + bean.getoDate().substring(8, 10) + "��"%></td>
						<td id="mobile" class="text-center"><%=bean.getrName()%></td>
						<td id="city" class="text-center"><%=month+"�� "+ day+"��  "+ hour+" : "+ min%></td>
						<td id="mail" class="text-center"><%=bean.getCount()%>��</td>
						
					</tr>
					<%	
								
							} //for
						} //if
					%>
				</tbody>
			</table>
			<table width="800px">
				<tr align ="center">
					<td><input type="button" class="btn btn-primary" value="������" onclick="javascript:plus('<%=end%>')"></td>
				</tr>
			</table>
			<form name="readFrm" action="">
				<input type="hidden" name="end" value=<%=end%>>	
			</form>
			<!-- ����¡ ó��-->
		</div>
	</div>
</div>