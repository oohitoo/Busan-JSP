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
		<span style="font-size: 2.0em; color: navy">주문자 정보</span>
		<table class="table table-hover">
			
			<thead>
				<tr>
					<th>주문목록 ( 가게명 )</th>
					<th>주&nbsp;문&nbsp;량</th>
					<th class="text-center">Price</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<!-- 반복 돌리기 끝  -->
				<tr>
					<td class="col-sm-8 col-md-6">
						<div class="media">
							<a class="thumbnail pull-left" href="#" style="width: 90px; height: 90px;">
								<img class="media-object" src="../img/ready.gif" style="width: 72px; height: 72px;">
							</a>
							<div class="media-body">
								<h4 class="media-heading">
									<a href="#">주문 목록</a>
								</h4>
								<h5 class="media-heading">
									by <a href="#">가게명</a>
								</h5>
								<span>배달 예정 시간 :</span>
									<span class="text-success">
										<strong>50분</strong>
									</span>
							</div>
						</div>
					</td>
					<td class="col-sm-1 col-md-1" style="text-align: center">
						<input type="text" class="form-control" id="exampleInputEmail1"
						value="3">
					</td>
					<td class="col-sm-1 col-md-1 text-center"><strong>상품 가격</strong></td>
					<td class="col-sm-1 col-md-1">
						<p align="center"><button type="button" class="btn btn-danger">Remove</button></p>
					</td>
				</tr>
				<!-- 반복 돌리기 끝  -->
				<tr>
					<td></td>
					<td align="right">주 소 </td>
					<td colspan="2" align="right">
						<input type="text" id="addres" size="30" value="" style="vertical-align:middle;">
					</td>
					
				</tr>
				<!-- 배달지 정보 -->
				<tr>
					<td></td>
					<td align="right">전&nbsp;화<br>번&nbsp;호 </td>
					<td colspan="2" align="right">
						<input type="tel" id="phoneNumber" size="30" value="">
					</td>
				</tr>
				<tr>
					<td></td>
					<td align="right">요&nbsp;청<br>사&nbsp;항 </td>
					<td colspan="2" align="right">
						<input type="text" id="request" size="30" placeholder="30자리 까지 작성 할 수 있어요">
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>결&nbsp;제&nbsp;방&nbsp;식</td>
					<td class="text-right">
							<select id="payType">
									<option value="만나서 카드결제" selected>만나서 카드결제</option>
									<option value="만나서 현금결제">만나서 현금결제</option>
									<option value="카드 결제">카드 결제</option>
									<option value="무통장 입금">무통장 입금</option>
							</select>
					</td>
				</tr>
				<!-- 배달지 정보  끝-->
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
					<td align="right"><button type="button" class="btn btn-default">뒤&nbsp;로</button></td>					
					<td align="left" colspan="3"><button type="button" class="btn btn-success">주문하기</button></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>