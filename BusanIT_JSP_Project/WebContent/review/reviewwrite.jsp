<%@page import="review.reviewMgr"%>
<%@page import="review.reviewBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />


<%
  	request.setCharacterEncoding("EUC-KR");
	String shopName = (String)session.getAttribute("shop");
	String oDate = request.getParameter("oDate");

	int num = 0;
	String content = null;
	String regdate = null;
	String rid  = (String)session.getAttribute("idKey");
  
%>


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

</head>

<body>
    <p></p>
    <form method="post" name="insert" style="margin-left: 70px;">
    <table align="center">
    
      
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
    
    	 <input type="hidden" name="oDate" value="<%=oDate%>">
    	 <input type="hidden" name="shopName" value="<%=shopName%>">
     </form>

</body>
</html>