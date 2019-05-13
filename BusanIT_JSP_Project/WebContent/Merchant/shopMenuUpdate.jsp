<%
String businessName = (String) session.getAttribute("name");
String businessId = (String) session.getAttribute("businessId");
String businessPhone = (String) session.getAttribute("phone");
String businessAddress = (String) session.getAttribute("address");
String businessCategory = (String) session.getAttribute("category");
if(businessName==null){
		%>
		<script>
		alert("�α����� �� �ּ���");
		location.href = "shopLogin.jsp";
		</script>
		<%}%>
		
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Update Info</title>
</head>
<body>
    <div>
        <h3 class="text-center text-white pt-5">��</h3>
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-md-6">
					<div class="col-md-12">
						<form class="form" action="shopMenuUpdateProc.jsp"	method="post">
							
							<!-- menu1 -->
							<label for="scategories" class="text-primary">�޴� ������Ʈ:</label>
							
							<!-- �޴� �̸�, ����, ���� table-->
							<table class="table table-bordered" id="list_table" width="100%" cellspacing="0">
							
								<thead>
									<tr>
										<th class="text-primary" style="text-align: center;">No</th>
										<th class="text-primary" style="text-align: center;">�޴� �̸�</th>
										<th class="text-primary" style="text-align: center;">����</th>
										<th class="text-primary" style="text-align: center;">�޴� ����</th>
										<th class="text-primary" style="text-align: center;">����</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									<tr>
										<td style="text-align: center;">
										<%
											int i =1;
											out.print(i);
										%>
										</td>
										<td style="text-align: center;">park</td>
										<td style="text-align: center;">930917</td>
										<td style="text-align: center;">������</td>
										<td style="text-align: center;"><a href="#" class="delete-link">Delete</a></td>
									</tr>
								</tbody>
							</table>
							
							<h3>�߰� �Է� ���̺�</h3>
							
							<table class="table table-bordered" "append_table" width="100%" cellspacing="0">

							<thead>
							   <tr>
							      <th style="text-align: center;"><label for="add_no">No.</label></th>
							      <th style="text-align: center;">�޴� �̸�</th>
							      <th style="text-align: center;">��  ��</th>
							      <th style="text-align: center;">�޴� ����</th>
							      <th style="text-align: center;">�߰�</th>
							   </tr>
							</thead>
							
							<tbody>
							   <tr style="text-align: center;">
							      <td>
							      <id="add_no" class="form-control">
							      	<% 
							      		i++;
							      		out.print(i); 
							      	%>
							      </td>
							      <td><input type="text" id="add_menuName" class="form-control"></td>
							      <td><input type="text" id="add_price" class="form-control" onchange="getNumber(this);" onkeyup="getNumber(this);"></td>
							      <td><input type="text" id="explaination" class="form-control"></td>
							      <td><button type="button" id="append_row" class="btn btn-success" value="�׸��߰�">+</button></td>
							   </tr>
							</tbody>
							</table>

<script type="text/javascript">
//�߰�
$("#append_row").on(
        "click",
        function() {
            $("#list_table").append(
                    $("<tr>").append(
                            $("<td>").append($("#add_no").val()),
                            $("<td>").append($("#add_menuName").val()),
                            $("<td>").append($("#add_price").val()),
                            $("<td>").append($("#explaination").val()),
                            $("<td>").append(
                                    $("<a>").prop("href", "#")
                                            .addClass("delete-link btn btn-primary")
                                            .append("-"))));
        });

// ����
$("#list_table").on("click", ".delete-link", function() {
    $(this).parent().parent().remove();
});

function getNumber(obj){
        
         var num01;
         var num02;
         num01 = obj.value;
         num02 = num01.replace(/\D/g,""); //���ڰ� �ƴѰ��� ����, 
                                          //�� [0-9]�� ������ ���� ����; /[^0-9]/g �� ���� ǥ��
         num01 = setComma(num02); //�޸� ���
         obj.value =  num01;

    }
    function setComma(n) {
         var reg = /(^[+-]?\d+)(\d{3})/;   // ���Խ�
         n += '';                          // ���ڸ� ���ڿ��� ��ȯ         
         while (reg.test(n)) {
            n = n.replace(reg, '$1' + ',' + '$2');
         }         
         return n;
    }
</script>
	
							<!-- Update Submit -->
							<div id="register-link" class="text-right">
								<input type="submit" name="submit" class="btn btn-primary btn-md" value="�����ϱ�">
							</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>