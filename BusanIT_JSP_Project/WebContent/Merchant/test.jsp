<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  
<link rel="stylesheet" href="style.css" type="text/css"
    media="print, projection, screen">
  
<!-- <script type="text/javascript" src="./jquery/jquery-latest.js"></script> -->
<script type="text/javascript" src="./jquery/jquery.tablesorter.js"></script>
<script type="text/javascript" src="./jquery/jquery.tablesorter.min.js"></script>
  
<style type="text/css">
#sampleTable td:nth-of-type(3) {
    text-align: right;
    padding-right: 0.7em;
}
#sampleTable td:nth-of-type(4) {
    text-align: right;
    padding-right: 0.7em;
}
#sampleTable td:nth-of-type(5) {
    text-align: right;
    padding-right: 0.7em;
}
</style>
  
</head>
<body>
  
    <h1>���� ���̺�</h1>
  
    <table id="list_table" class="tablesorter">
  
        <thead>
            <tr>
                <th>Number</th>
                <th>Name</th>
                <th>Birth</th>
                <th>Action</th>
            </tr>
        </thead>
  
        <tbody>
            <tr>
                <td>1</td>
                <td>ȫ�浿</td>
                <td>2001/02/24</td>
                <td><a href="#" class="delete-link">����</a></td>
            </tr>
            <tr>
                <td>2</td>
                <td>������</td>
                <td>1999/06/14</td>
                <td><a href="#" class="delete-link">����</a></td>
            </tr>
            <tr>
                <td>3</td>
                <td>�Ӳ���</td>
                <td>1997/09/01</td>
                <td><a href="#" class="delete-link">����</a></td>
            </tr>
        </tbody>
    </table>
  
     
 
     
 
  
    <h3>�߰� �Է� ���̺�</h3>
    <table border="1" id="append_table">
        <colgroup>
            <col style="width: 70px">
            <col style="width: 200px">
            <col style="width: 300px">
            <col style="width: 200px">
        </colgroup>
        <thead>
            <tr>
                <th><label for="add_no">��ȣ</label></th>
                <th>�̸�</th>
                <th>�������</th>
                <th>Action</th>
            </tr>
        </thead>
  
        <tbody>
            <tr>
                <td><input type="text" id="add_no"></td>
                <td><input type="text" id="add_name"></td>
                <td><input type="text" id="add_birth"></td>
                <td><button type="button" id="append_row">������ �߰�</button></td>
            </tr>
        </tbody>
    </table>
  
    <script type="text/javascript">
        $("#list_table").tablesorter();
  
        // �߰�
        $("#append_row").on(
                "click",
                function() {
                    $("#list_table").append(
                            $("<tr>").append(
                                    $("<td>").append($("#add_no").val()),
                                    $("<td>").append($("#add_name").val()),
                                    $("<td>").append($("#add_birth").val()),
                                    $("<td>").append(
                                            $("<a>").prop("href", "#")
                                                    .addClass("delete-link")
                                                    .append("����"))));
                    $("#list_table").trigger("update");
                });
  
        // ����
        $("#list_table").on("click", ".delete-link", function() {
            $(this).parent().parent().remove();
            $("#list_table").trigger("update");
        });
    </script>
  
</body>
</html>