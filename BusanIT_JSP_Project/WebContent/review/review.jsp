<%@page import="review.reviewMgr"%>
<%@page import="review.reviewBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />

<%
  request.setCharacterEncoding("EUC-KR");
	String shopName = request.getParameter("store");
/*   int totalRecord = 0; //총 게시물 수 */
  //int numPerPage = 15; //페이지당 레코드 수 5,10,15,30
/*   int pagePerBlock = 15; //블럭당 페이지 수
  int totalPage = 0; //총 페이지 수=(올림)총게시물수 / 페이지당 레코드 수    
  int totalBlock = 0; //총 블럭 수=(올림) 총 페이지수 / 블럭당 페이지수 
  int nowPage = 1; //현재 페이지
  int nowBlock = 1; //현재 블럭 */

  int num = 0;
  String content = null;
  String regdate = null;
  
  //한페이지에 보여질 게시물 갯수
/*   if (request.getParameter("numPerPage") != null && !request.getParameter("numPerPage").equals("null")) {
    numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
  } */
 /* 
  totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

  totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

  nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
   */ 
  String rid  = (String)session.getAttribute("idKey");
  
  
%>
<!-- <html>
<head>
<title></title> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

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
.js-load {
    display: none;
}
.js-load.active {
    display: block;
}
</style>
</head>

<body>
    <p>
    <table align="center">
    <form method="post" name="insert">
      <table>
      <th>
      <img src="../img/Logo_21.png" width= "height=66px">
      </th>
      <th>
      <textarea style="width:700px ; height:66px" name="rContent"></textarea>
      </th>
      </table>
      <div class="radio" align="center">
          <p>
          <label class="radio-inline">
            <input type="radio" name="rStar" id="rStar" value="1" checked="checked">★☆☆☆☆</label> 
            <label class="radio-inline"> 
            <input type="radio" name="rStar" id="rStar" value="2">★★☆☆☆</label> 
            <label class="radio-inline"> 
            <input type="radio" name="rStar" id="rStar" value="3">★★★☆☆</label> 
            <label class="radio-inline"> 
            <input type="radio" name="rStar" id="rStar" value="4">★★★★☆</label> 
            <label class="radio-inline"> 
            <input type="radio" name="rStar" id="rStar" value="5">★★★★★</label>
        </p>
          <p><input type="image" src="../img/review.png" width="700px" height="50" value="content" onClick="javascript:reviewInsert()"></p>
      </div>
        <div align="center">
        <%
          Vector<reviewBean> vlist = mgr.reviewList(shopName);
          int listSize = vlist.size();
          if (vlist.isEmpty()) {
            out.println("등록된 리뷰가 없습니다");

          } else {
        
        %>
        </div>
     <input type="hidden" name="rId">
     <input type="hidden" name="rregdate">
     </form>

	<table id="js-load" class="type04 main">
    
      <%
        for(int i=0; i<vlist.size(); i++){
        	 reviewBean pbean = vlist.get(i);
             int rnum = pbean.getrNum();
             String rId = pbean.getrId();
             int rStar = pbean.getrStar();
             String rcontent = pbean.getrContent();
             String rregdate = pbean.getrRegdate();
        %>
        <tr class="lists__item js-load">
          <td width="70"><img src="../img/Logo_21.png" width="height=66px"></td>    
          <td width="200"><%=rId%></td>    
          <td width="250">
					<a href="javascript:doDisplay(<%=i%>);"> 
						<nobr style="display:block; text-overflow:ellipsis; width:80px; overflow:hidden"><%=rcontent %></nobr>
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
          <td >
    				<%=rregdate%>&nbsp;<input type="image"	src="../img/delete.png" value="content" onClick="javascript:reviewDelete(<%=rnum%>)">
          </td>    
        <%}%>
      
    </tr>
    <tr id="js-btn-wrap" class="btn-wrap"> 
    <td align="center"><a href="javascript:load2()" class="button">더보기</a></td> 
    </tr>
  </table>
    <%} //else%>

    <form name="listFrm" method="post">
      <input type="hidden" name="reload" value="true"> <input
        type="hidden" name="nowPage" value="1">
    </form>
    <!--ReadFrm  -->
    <form name="readFrm">
      <input type="hidden" name="num"><%--  <input type="hidden"
        name="nowPage" value="<%=nowPage%>"> --%>
         <%-- <input type="hidden" name="numPerPage" value="<%=numPerPage%>"> --%>
    </form>
    
      
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
</body>
</html>