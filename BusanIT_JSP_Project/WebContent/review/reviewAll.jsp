<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="review.reviewMgr"%>
<%@page import="review.reviewBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />

<%
  	request.setCharacterEncoding("EUC-KR");
	String shopName = request.getParameter("store");


  int num = 0;
  String content = null;
  String regdate = null;

  String rid  = (String)session.getAttribute("idKey");
  
%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<jsp:include page="designForm.jsp" />
<script type="text/javascript">
    
    function reviewInsert(){
      if(document.insert.rContent.value==""){
        alert("내용을 입력하세요.");
        document.insert.rContent.focus();
        return;
      }
      document.insert.action="../review/reviewInsert.jsp";      
    }  
    function reviewDelete(number){
      location.href ="../review/reviewDelete.jsp?rnum="+number;
    }
     function doDisplay(i){
          var con = document.getElementById("myDIV"+i);
          if(con.style.display=='block'){
              con.style.display = 'none';
          }else{
              con.style.display = 'block';
          }
      } 
</script>
<style>
table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 tr {
    width: 100%;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td{
	padding:10px;
}
.js-load {
    display: none;
}
.js-load.active {
    display: block;
}
</style>
</head>
<div class="container-fluid">
<div class="panel panel-success" style="margin-left: 10px; margin-top: 50px; width: 850px;">
		<div class="panel-heading">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<h2 class="text-center pull-left" style="padding-left: 30px; color:black">
						<span style=" color: navy"><strong>리뷰 내역</strong></span>
					</h2>
				</div>

			</div>
		</div>
	<table id="js-load" class="type04 main">
        <%
          Vector<reviewBean> vlist = mgr.reviewAll(rid);
          int listSize = vlist.size();
          if (vlist.isEmpty()) {%>
          <tr>
          	<td>등록된 리뷰가 없습니다</td>
          </tr>
          <%} else {%>
	      <%
	        for(int i=0; i<vlist.size(); i++){
	        	 reviewBean pbean = vlist.get(i);
	             int rnum = pbean.getrNum();
	             String id = pbean.getrId();
	             int rStar = pbean.getrStar();
	             String rcontent = pbean.getrContent();
	             String rregdate = pbean.getrRegdate().substring(0, 10);
	             String rNick = pbean.getrNick();
             
        %>
        <tr class="lists__item js-load">
          <td width="70"><img src="../img/Logo_21.png" width="height=66px"></td>    
          <td style="padding-top: 20px; width:100px;s"><%=rNick%></td>    
          <td width="322px;">
					<a href="javascript:doDisplay(<%=i%>);"> 
						<nobr style="display:block; text-overflow:ellipsis; width:200px; overflow:hidden"><%=rcontent %></nobr>
					</a>
					<div id="myDIV<%=i %>" style="display: none;">
					<p><%=rcontent %></p>
          </td>    
          <td>
					<%if(rStar==1){ %>★☆☆☆☆<%} %>
					<%if(rStar==2){ %>★★☆☆☆<%} %>
					<%if(rStar==3){ %>★★★☆☆<%} %>
					<%if(rStar==4){ %>★★★★☆<%} %>
   					<%if(rStar==5){ %>★★★★★<%} %>
          </td>    
          <td style="width: 120px;" align="right"> <%=rregdate%>&nbsp;</td> 
          <td>
          	<% if (rid.equals(pbean.getrId())) { %>          	
          	<input type="image"	src="../img/delete.png" value="content" onClick="javascript:reviewDelete(<%=rnum%>)">
          </td>
        	<%}%>
        <%} %>
      
    </tr>
    <tr id="js-btn-wrap" class="btn-wrap"> 
    <td align="center"><a href="javascript:load2()" class="button">더보기</a></td> 
    </tr>
  </table>
    <%} //else%>
</div>    
</div>    
      
<script>
  $(document).ready(load2());
  function load2() {
      load('#js-load', '5', '#js-btn-wrap');
  }
  function load(id, cnt, btn) {
      var girls_list = id + " .js-load:not(.active)";
      var girls_length = $(girls_list).length;
      var girls_total_cnt;
      if (cnt <= girls_length) {
          girls_total_cnt = cnt;
      }else {
          girls_total_cnt = girls_length;
          $('.button').hide()
      }
      $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
  }
  </script>
</html>