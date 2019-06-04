<%@page import="review.reviewMgr"%>
<%@page import="review.reviewBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />

<%
  request.setCharacterEncoding("EUC-KR");
/*   int totalRecord = 0; //총 게시물 수 */
  int numPerPage = 15; //페이지당 레코드 수 5,10,15,30
/*   int pagePerBlock = 15; //블럭당 페이지 수
  int totalPage = 0; //총 페이지 수=(올림)총게시물수 / 페이지당 레코드 수    
  int totalBlock = 0; //총 블럭 수=(올림) 총 페이지수 / 블럭당 페이지수 
  int nowPage = 1; //현재 페이지
  int nowBlock = 1; //현재 블럭 */

  int num = 0;
  String content = null;
  String regdate = null;
  
  //한페이지에 보여질 게시물 갯수
  if (request.getParameter("numPerPage") != null && !request.getParameter("numPerPage").equals("null")) {
    numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
  }
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
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 --><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
    

  
<%--     function pageing(page){
      document.readFrm.nowPage.value=page;
      document.readFrm.submit();
    }

yu changmin, [04.06.19 13:33]
function block(block){
      document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
      document.readFrm.submit();
      }
    function numPerFn(numPerPage){
      document.readFrm.numPerPage.value=numPerPage;
      document.readFrm.submit();
      
    } --%>
    function reviewInsert(){
      if(document.insert.rContent.value==""){
        alert("내용을 입력하세요.");
        document.insert.rContent.focus();
        return;
      }
      document.insert.action="http://localhost/BusanIT_JSP_Project/review/reviewInsert.jsp";
      document.insert.submit();
      
    }  
    function reviewDelete(number){
      location.href ="http://localhost/BusanIT_JSP_Project/review/reviewDelete.jsp?rnum="+number;
      //location.reload();
    }
    function reviewRead(){
      document.read.action="http://localhost/BusanIT_JSP_Project/review/reviewRead.jsp";
      document.read.submit();
      
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
table.type04 td {
    width: 250px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type03 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type03 th {
  width: 80px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;;

}
table.type03 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>

<body>
    <p>
    <table align="center">
    <form method="post" name="insert">
      <table>
      <th>
      <img src="img/Logo_21.png" width= "height=66px">
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
            <label class="radio-inline"> <input type="radio" name="rStar" id="rStar" value="4">★★★★☆</label> 
            <label class="radio-inline"> 
            <input type="radio" name="rStar" id="rStar" value="5">★★★★★</label>
        </p>
          <p><input type="image" src="img/review.png" width="700px" height="50" value="content" onClick="javascript:reviewInsert()"></p>
      </div>
        <div align="center">
        <%
          Vector<reviewBean> vlist = mgr.reviewList();
          int listSize = vlist.size();
          if (vlist.isEmpty()) {
            out.println("등록된 리뷰가 없습니다");

          } else {
        
        %>
        </div>

     <input type="hidden" name="rId">
     <input type="hidden" name="rregdate">
     </form>
  <!--       <button class="btn" id="btn" type="submit" action="reviewInsert.jsp"><img class="btn-img" src="img/review.jpg"></button> -->

<table class="type04" align="center">      
        <div class="btn-group">
        <%
        
          for (int i = 0; i < numPerPage; i++) {
              if (i == listSize)
                break;
              reviewBean pbean = vlist.get(i);
              int rnum = pbean.getrNum();
              String rId = pbean.getrId();
              int rStar = pbean.getrStar();
              String rcontent = pbean.getrContent();
              String rregdate = pbean.getrRegdate();
        %>
        <tr class="text-primary">
          <tr>
          <td><img src="img/Logo_21.png" width= "height=66px"></td>
          <td ><%=rId%></td>

    <!-- drop down -->   
    <td>
      <a href="javascript:doDisplay(<%=i%>);">
          <nobr style="display:block; text-overflow:ellipsis; width:80px; overflow:hidden"><%=rcontent %></nobr>
          </a> 
      <div id="myDIV<%=i %>"  style="display:none;">
              <p><%=rcontent %></p>
          </div>
          
          <%if(rStar==1){ %><td>★☆☆☆☆</td>
          <%} %>
          <%if(rStar==2){ %><td>★★☆☆☆</td>
          <%} %>
          <%if(rStar==3){ %><td>★★★☆☆</td>
          <%} %>
          <%if(rStar==4){ %><td>★★★★☆</td>
          <%} %>
          <%if(rStar==5){ %><td>★★★★★</td>
          <%} %>
          <td><%=rregdate%>&nbsp;<input type="image" src="img/delete.png" value="content" onClick="javascript:reviewDelete(<%=rnum%>)">
          </td>
        </tr>
        
        
        <%}%>
        </div>
        </table>
        <% }%>


    </table>
    <form name="listFrm" method="post">
      <input type="hidden" name="reload" value="true"> <input
        type="hidden" name="nowPage" value="1">
    </form>
    <!--ReadFrm  -->
    <form name="readFrm">
      <input type="hidden" name="num"><%--  <input type="hidden"
        name="nowPage" value="<%=nowPage%>"> --%> <input type="hidden"
        name="numPerPage" value="<%=numPerPage%>">
    </form>  
    
</body>
</html>