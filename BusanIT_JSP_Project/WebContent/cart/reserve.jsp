<%@page import="login.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="lMgr" class="login.LoginMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String rName = request.getParameter("shop");
	String id = (String) session.getAttribute("idKey");
	LoginBean lBean = lMgr.getCustomer(id);
%>
<script>
	function menulist(menu) {
		console.log(menu);
		location.href = 'item/itemProc.jsp?menu=' + menu;
	}
	function reserve() {
		documents.readFrm.submit();
	}
</script>

<jsp:include page="designForm.jsp"/>
<div class="container">
	<div class="row">
		<div id="accordion" style="margin-left: 100px;">
			<table style="width: 700px; margin-left: 50px; margin-top: 50px;">
				<tr>
					<!-- ���� �̸� ǥ���ϴ� �� -->
					<td colspan="3"><h5><%=rName%></h5></td>
				</tr>
				<tr>
					<td rowspan="3" width="100px" height="100px">�̹���</td>
					<td>�ּ� �ֹ��ݾ� 13,000 ��</td>
				</tr>
				<tr>
					<td>������� : ī��, ����</td>
				</tr>
				<tr>
					<td>��� ��� �ð� : 40��, ���� : 0��</td>
				</tr>
				<tr>
					<td colspan="3">����� �˸� �޼���</td>
				</tr>
			</table>

			<form name="reserve" action="reserveProc.jsp">

				<table
					style="width: 700px; height: 350px; margin-left: 50px; margin-top: 50px;">
					<tr>
						<td style="width: 150px"><label class="text-primary">������
								���� </label></td>
						<td><input name="name" class="form-control"
							style="width: 200px"></td>
						<td style="width: 150px"><label class="text-primary">������
								��ȭ��ȣ</label></td>
						<td colspan="2"><input name="cPhone" class="form-control"
							value="<%=lBean.getcPhone()%>" style="width: 200px"></td>

					</tr>

					<tr>
						<td><label class="text-primary">���� ��¥ ����</label></td>
						<td><input type="date" name="oDate" class="form-control"
							style="width: 200px"></td>
						<td><label class="text-primary">���� �ð� ����</label></td>
						<td width="120px;"><select name="hour" style="width: 100px"
							class="form-control">
								<option value="">��</option>
								<%
									for (int i = 11; i < 20; i++) {
								%>
								<option value="<%=i%>��"><%=i%>��
								</option>
								<%
									}
								%>
						</select></td>
						<td><select name="min" class="form-control"
							style="width: 100px">
								<option value="">��</option>
								<option value="00��">00��</option>
								<option value="30��">30��</option>
						</select></td>
					</tr>

					<tr>
						<td><label class="text-primary">���� �ο���</label></td>
						<td><select name="count" class="form-control"
							style="width: 201px">
								<option value="">�ο� ��</option>
								<%
									for (int i = 1; i < 10; i++) {
								%>
								<option value="<%=i%>"><%=i%>��
								</option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td><label class="text-primary">��û����</label></td>
						<td colspan="3"><input name="oRequest" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="5" align="center"><input type="hidden"
							name="rName" value="<%=rName%>" /> <input type="hidden"
							name="id" value="<%=id%>" /> <input type="hidden" name="cNick"
							value="<%=lBean.getcNick()%>" /> <input type="submit"
							name="submit" class="btn btn-primary btn-md" value="�����ϱ�"
							onclick="javascript:reserve()"></td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</div>
