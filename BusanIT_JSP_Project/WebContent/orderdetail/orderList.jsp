<%@page import="menu.ordersBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="menu.ordersMgr"/>

<%	
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	//id를 넣어서 오더넘버 얻기
	Vector<ordersBean> vorderlist = mgr.getorders(id);
	for(int i = 0; vorderlist.size();i++){
	out.print(vorderlist.get(i));
	}
	//얻은 오더넘버로 주문목록 정보 얻기
	Vector<ordersBean> list = mgr.orderList(vorderlist);
	
%>
<jsp:include page="designForm.jsp"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container-fluid">
    <div class="panel panel-success" style="margin-left: 10px; margin-top: 50px; width:850px;">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-3">
            <h2 class="text-center pull-left" style="padding-left: 30px;"> <span class="glyphicon glyphicon-list-alt"> </span>주문 내역 </h2>
          </div>
          
        </div>
      </div>
		
      <div class="panel-body table-responsive">
        <table class="table table-hover">
          <thead>
            <tr>
              <th class="text-center"> 번호 </th>
              <th class="text-center"> 주문날짜</th>
              <th class="text-center"> 식당이름 </th>
              <th class="text-center"> 메뉴 </th>
              <th class="text-center"> 가격 </th>
            </tr>
          </thead>

          <tbody>
          
          <%
			if(list.isEmpty()){
			%>
				<tr>
					<td colspan="5"> 주문내역이 없습니다.</td>
				</tr>
			<% }else{ 
				for(int i = 0; i< list.size();i++) {
					ordersBean bean = list.get(i);
				%>
					<tr class="edit" id="detail">
 						<td id="no" class="text-center">i+1</td>
						<td id="name" class="text-center"><%=bean.getoDate()%></td>
						<td id="mobile" class="text-center"><%=bean.getrName() %></td>
						<td id="mail" class="text-center"><%=bean.getMenu() %></td>
						<td id="city" class="text-center"><%=bean.getTotalPrice() %></td>
					</tr>

			<%}//for 
				}//if
			%>          
            <tr class="edit" id="detail">
            
              <td id="no" class="text-center"> 1 </td>
              <td id="name" class="text-center"> <%=id %> </td>
              <td id="mobile" class="text-center"> 5412547854 </td>
              <td id="mail" class="text-center"> abc@gmail.com </td>
              <td id="city" class="text-center"> New York </td>
            </tr>

          
          </tbody>
        </table>
      </div>

    </div>
  </div>