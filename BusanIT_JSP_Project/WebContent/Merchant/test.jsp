<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="shopMenuUpdate.jsp" />

<div class="container">
    <input type="button" id="add" class="btn btn-success" value="항목추가" />
    <input type="button" id="clear" class="btn btn-primary" value="항목제거" />
 
    <div class="table" id="table">
    </div>
</div>    
 
<script type="text/javascript">
    $(document).ready(function(){
        $('#add').click(function(){
            $('#table').append('<table border="1">')
            $('#table').append('<tr><td rowspan="3"><img id="logo" src="http://placehold.it/200x200" width="200" height="200"><input id="pic" class="pis" onchange="readURL(this);" type="file"></td><td width="400"><div class="form-group">메뉴 이름<input type="text" class="form-control"></div></td></tr>')
            $('#table').append('<tr><td width="400"><div class="form-group">가격<input type="text" class="form-control" onkeyUp="this.value = SetComma(this.value)"></div></td></tr>')
            $('#table').append('<tr><td width="400"><div class="form-group">메뉴 설명<input type="text" class="form-control"></div></td>')
            $('#table').append('</table>')
        });
 
    $('#clear').click(function(){
            $('#table').empty();
        });
 
    });
</script>
