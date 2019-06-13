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
     function reviewRevise(number){    	 
    	 var inputshow = document.getElementById("recontent"+number);
    	 var inputhidden = document.getElementById("content"+number);
    	 
    	 
    	 
    	 if ( inputshow.style.display== "none" ){
    		 //수정화면 보이기 true
    		 inputhidden.style.display= "none";
    		 inputshow.style.display= "block";
    	 } else {
    		//수정화면 안보이기 false
    		 inputhidden.style.display= "block";
    		 inputshow.style.display= "none";
			 location.href = "reviewUpdate.jsp?rnum="+number+"&content="+inputshow.value;    		 
    		 /* alert(inputshow.value); // 원래값
    		 alert("수정완료되었습니다."); */
    	 }
    	 
     }
     function orderdetail(onum) {
    	 location.href = "../orderdetail/orderdetail.jsp?oNum=" +onum;
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
	             num = i; 
        %>
        <tr >
          <td rowspan="2" width="70"><img src="../img/Logo_21.png" width="height=66px" style="padding-top: 18px;"></td>
          <td colspan="2">
        		<a onclick="javascript:orderdetail('<%=pbean.getoNum()%>')">
        			<h4 style="padding-top : 10px"><%=pbean.getShopName() %></h4>
        		</a>
        	</td> 
          <td>
					<%if(rStar==1){ %>★☆☆☆☆<%} %>
					<%if(rStar==2){ %>★★☆☆☆<%} %>
					<%if(rStar==3){ %>★★★☆☆<%} %>
					<%if(rStar==4){ %>★★★★☆<%} %>
   					<%if(rStar==5){ %>★★★★★<%} %>
          </td>    
          <td style="width: 120px;" align="right"> <%=rregdate%>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" style="width:65%; padding-bottom: 20px;">
				<p id="content<%=rnum %>"><%=rcontent %></p>
				<input id="recontent<%=rnum %>" value="<%=rcontent %>" class="form-control" style="display: none; height : auto">
          </td> 
          <td align="center" style="padding-top : 0px;">
          		<button type="button" id="revise<%= rnum %>" class="btn btn-primary" onClick="javascript:reviewRevise(<%=rnum%>)" style="cursor:pointer">수&nbsp;정</button>	
          </td>
          <td align="center" style="padding-top : 0px;">
          		<button type="button" class="btn btn-primary" onClick="javascript:reviewDelete(<%=rnum%>)" style="cursor:pointer">삭&nbsp;제</button>
          </td>
        </tr>
        <%}//--for %>

  </table>
    <%} //else%>
</div>    
</div>    

</html>