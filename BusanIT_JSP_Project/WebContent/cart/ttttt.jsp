<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%@ include file="desienTest.jsp"%>

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row" style="margin-left: 100px;">
		<span style="font-size: 2.0em; color: navy">�ֹ��� ����</span>
		<table class="table table-hover">
			
			<thead>
				<tr>
					<th>�ֹ���� ( ���Ը� )</th>
					<th>��&nbsp;��&nbsp;��</th>
					<th class="text-center">Price</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<!-- �ݺ� ������ ��  -->
				<tr>
					<td class="col-sm-8 col-md-6">
						<div class="media">
							<a class="thumbnail pull-left" href="#" style="width: 90px; height: 90px;">
								<img class="media-object" src="../img/ready.gif" style="width: 72px; height: 72px;">
							</a>
							<div class="media-body">
								<h4 class="media-heading">
									<a href="#">�ֹ� ���</a>
								</h4>
								<h5 class="media-heading">
									by <a href="#">���Ը�</a>
								</h5>
								<span>��� ���� �ð� :</span>
									<span class="text-success">
										<strong>50��</strong>
									</span>
							</div>
						</div>
					</td>
					<td class="col-sm-1 col-md-1" style="text-align: center">
						<input type="text" class="form-control" id="exampleInputEmail1"
						value="3">
					</td>
					<td class="col-sm-1 col-md-1 text-center"><strong>��ǰ ����</strong></td>
					<td class="col-sm-1 col-md-1">
						<p align="center"><button type="button" class="btn btn-danger">Remove</button></p>
					</td>
				</tr>
				<!-- �ݺ� ������ ��  -->
				<tr>
					<td></td>
					<td align="right">�� �� </td>
					<td colspan="2" align="right">
						<input type="text" id="addres" size="30" value="" style="vertical-align:middle;">
					</td>
					
				</tr>
				<!-- ����� ���� -->
				<tr>
					<td></td>
					<td align="right">��&nbsp;ȭ<br>��&nbsp;ȣ </td>
					<td colspan="2" align="right">
						<input type="tel" id="phoneNumber" size="30" value="">
					</td>
				</tr>
				<tr>
					<td></td>
					<td align="right">��&nbsp;û<br>��&nbsp;�� </td>
					<td colspan="2" align="right">
						<input type="text" id="request" size="30" placeholder="30�ڸ� ���� �ۼ� �� �� �־��">
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>��&nbsp;��&nbsp;��&nbsp;��</td>
					<td class="text-right">
							<select id="payType">
									<option value="������ ī�����" selected>������ ī�����</option>
									<option value="������ ���ݰ���">������ ���ݰ���</option>
									<option value="ī�� ����">ī�� ����</option>
									<option value="������ �Ա�">������ �Ա�</option>
							</select>
					</td>
				</tr>
				<!-- ����� ����  ��-->
				<tr>
					<td></td>
					<td></td>				
					<td>Subtotal</td>
					<td class="text-right">
						<h5>
							<strong>$24.59</strong>
						</h5>
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td></td>					
					<td>Total</td>
					<td class="text-right">
						<h3>
							<strong>$31.53</strong>
						</h3>
					</td>
				</tr>
				<tr>
					<td align="right"><button type="button" class="btn btn-default">��&nbsp;��</button></td>					
					<td align="left" colspan="3"><button type="button" class="btn btn-success">�ֹ��ϱ�</button></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>