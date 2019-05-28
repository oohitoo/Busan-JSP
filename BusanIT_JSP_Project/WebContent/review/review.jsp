<%@page import="review.reviewMgr"%>
<%@page import="review.reviewBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />

<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0; //총 게시물 수
	int numPerPage = 5; //페이지당 레코드 수 5,10,15,30
	int pagePerBlock = 15; //블럭당 페이지 수
	int totalPage = 0; //총 페이지 수=(올림)총게시물수 / 페이지당 레코드 수		
	int totalBlock = 0; //총 블럭 수=(올림) 총 페이지수 / 블럭당 페이지수 
	int nowPage = 1; //현재 페이지
	int nowBlock = 1; //현재 블럭

	int num = 0;
	String id = null;
	String subject = null;
	String content = null;
	String regdate = null;
	
	//한페이지에 보여질 게시물 갯수
	if (request.getParameter("numPerPage") != null && !request.getParameter("numPerPage").equals("null")) {
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	}

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
<!-- <html>
<head>
<title></title> -->
<link href="style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<%-- BootStrap CDN --%>
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
		

	
		function pageing(page){
			document.readFrm.nowPage.value=page;
			document.readFrm.submit();
		}

		function block(block){
			document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
			document.readFrm.submit();
			}
		function numPerFn(numPerPage){
			document.readFrm.numPerPage.value=numPerPage;
			document.readFrm.submit();
			
		}
		function reviewInsert(){
			document.insert.action="insertreview.jsp";
			document.insert.submit();
			
		}	
		function reviewDelete(number){
			location.href ="reviewDelete.jsp?rnum="+number;
			
		}
		function reviewRead(){
			document.read.action="reviewRead.jsp";
			document.read.submit();
			
		}
		
</script>
</head>
<body>
	<div class="container">
		<table class="table">
			<thead>
				<tr class="info">
					<th></th>
					<th>ID</th>
					<th>Title</th>
					<th>내용</th>
					<th></th>
					<th>별점</th>
					<th>작성일</th>
				</tr>
			</thead>

			<tbody>
				<!--리스트-->
				<%
					Vector<reviewBean> vlist = mgr.reviewList();
					int listSize = vlist.size();
					if (vlist.isEmpty()) {
						out.println("등록된 리뷰가 없습니다");

					} else {
				%>

				<%
					for (int i = 0; i < numPerPage; i++) {
							if (i == listSize)
								break;
							reviewBean pbean = vlist.get(i);
							int rnum = pbean.getrNum();
							String rid = pbean.getrId();
							String rsubject = pbean.getrSubject();
							int rStar = pbean.getrStar();
							String rcontent = pbean.getrContent();
							String rregdate = pbean.getrRegdate();
				%>
				<tr>
					<td><%=rnum%></td>
					<td><%=rid%></td>					
					<td><a data-toggle="modal" data-target="#myModal<%=rnum%>"<%-- onclick="review_read(${review_Bean.review_num})">${review_Bean.review_title} --%>>
					<%=rsubject%></a>
					<td><%=rcontent%></td>
					<td>
						<%if(rStar==1){ %><td>★☆☆☆☆</td><%} %>
						<%if(rStar==2){ %><td>★★☆☆☆</td><%} %>
						<%if(rStar==3){ %><td>★★★☆☆</td><%} %>
						<%if(rStar==4){ %><td>★★★★☆</td><%} %>
						<%if(rStar==5){ %><td>★★★★★</td><%} %>			
					</td>
					<td><%=rregdate%></td>
				</tr>
					
			<!-- 작성페이지 -->
			
			<div class="modal fade" id="myModal<%=rnum%>" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
	
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Review Detail</h4>
					</div>
						<div class="modal-body">						
							<textarea rows="10" class="form-control" readonly="readonly"
								id="content"><%=rcontent%></textarea>
							<!-- readonly ->읽기전용 -->						
						</div>
					<form class="form-horizontal" role="form" name="reviewDelete()" method="post">
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" onclick="javascript:reviewDelete(<%=rnum%>)">Delete
							</button>											
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>

						</div>
					</form>

				</div>

			</div>
		</div>
					<%}%>

					<%}%>
			</tbody>

		</table>
		<!-- 버튼-->
		<div class="col-sm-2"></div>
		<div class="col-sm-4 text-success" style="text-align: right;">
			<button type="button" class="btn btn-success btn-lg"
				data-toggle="modal" data-target="#myModal">Write</button>
		</div>
		
		<!-- 작성페이지 -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">

						<div class="panel-group">
							<div class="panel panel-success" style="margin-top: 10px;">
								<div class="panel-heading">Goods Review</div>
								<div class="panel-body">
									<%-- form --%>
									
									<form class="form-horizontal" role="form" action="reviewInsert.jsp" method="post" accept-charset="UTF-8">
									<div class="form-group">
											<label class="control-label col-sm-2">작성자(ID):</label>
											<div class="col-sm-10">
												<input class="form-control" id="rId" name="rId"
													placeholder="ID">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="pwd" onClick="javascript:subject()">제목:</label>
											<div class="col-sm-10">
												<input class="form-control" id="rSubject"
													name="rSubject" placeholder="Title">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-sm-2" for="pwd">내용:</label>
											<div class="col-sm-10">
												<textarea class="form-control" rows="5"
													placeholder="content" name="rContent" id="rContent"></textarea>
											</div>
										</div>
										<div class="radio" align="center">
											<label class="radio-inline"> <input type="radio" name="rStar" id="rStar" value="1" checked="checked">★☆☆☆☆</label>
							                  <label class="radio-inline"> <input type="radio" name="rStar" id="rStar" value="2">★★☆☆☆</label>
							                  <label class="radio-inline"> <input type="radio" name="rStar" id="rStar" value="3">★★★☆☆</label>
							                  <label class="radio-inline"> <input type="radio" name="rStar" id="rStar" value="4">★★★★☆</label>
							                  <label class="radio-inline"> <input type="radio" name="rStar" id="rStar" value="5">★★★★★</label>										
										</div>
										&nbsp
									 		

										<!-- <div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="radio">
								
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="1" checked="checked">★☆☆☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="2">★★☆☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="3">★★★☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="4">★★★★☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="5">★★★★★</label>
									
								</div>
							</div>
						</div> -->
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit" class="btn btn-success">작 성</button>
												<button type="reset" class="btn btn-danger">초기화</button>
											</div>
										</div>
										<input type="hidden" name="num" value="<%=num %>"> 
									 		<input type="hidden" name="id" value="<%=id %>"> 
									 		<input type="hidden" name="subject" value="<%=subject %>"> 
									 		<input type="hidden" name="content" value="<%=content %>"> 
									 		<input type="hidden" name="regdate" value="<%=regdate %>"> 
									</form>


								</div>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- detail -->

		
		
	

		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> <input
				type="hidden" name="nowPage" value="1">
		</form>
		<!--ReadFrm  -->
		<form name="readFrm">
			<input type="hidden" name="num"> <input type="hidden"
				name="nowPage" value="<%=nowPage%>"> 
				<input type="hidden"name="numPerPage" value="<%=numPerPage%>">
		</form>
	</div>
</body>
</html>
