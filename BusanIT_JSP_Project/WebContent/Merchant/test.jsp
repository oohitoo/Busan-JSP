<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<div class="container">
	<div class="row">
	    <div>
	<label class=newbtn>
	    <img id="blah" src="http://placehold.it/120x120" >
	    <input id="pic" class='pis' onchange="readURL(this);" type="file" >
	</label>
	</div>
	</div>
</div>
<script>
 
 $('.newbtn').bind("click" , function () {
        $('#pic').click();
 });
 
  function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah')
                        .attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
</script>
<style>


#pic{
     display: none;
       }
       
 .newbtn{
         cursor: pointer;
      }
      #blah{
  max-width:100px;
  height:100px;
  margin-top:20px;
}

</style>