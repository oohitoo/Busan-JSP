<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="menu.ordersMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	String oDate = request.getParameter("oDate");
	
	boolean flag = mgr.orderCancle(id, oDate);
%>
<style>
	.modal {
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        opacity: 1;
        visibility: visible;
        transform: scale(1.1);
        transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;
    }
    .modal-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        padding: 1rem 1.5rem;
        width: 450px;
        height: 200px;
        border-radius: 0.5rem;
    }
    .close-button {
        float: right;
        width: 1.5rem;
        line-height: 1.5rem;
        text-align: center;
        cursor: pointer;
        border-radius: 0.25rem;
        background-color: lightgray;
    }
    .close-button:hover {
        background-color: darkgray;
    }
       
</style>
<!--  팝업 될 레이어 -->
		<div class="modal">
			<div class="modal-content">
				<span class="close-button">&times;</span>
				<img width="150px" alt="없다." src="../img/Logo_1.png" style="margin-bottom: 10px;">
				<br>
				<h1 align="center" style="padding-top : 10px"><font color="#4e73df">주문이 취소되었습니다.</font></h1>
				<!-- window 클릭시 발생하는 거임 -->
				<input type="hidden" id="cancel" value="취소">
			</div>
		</div>


<script type="text/javascript">
 			var modal = document.querySelector(".modal");
		    var closeButton = document.querySelector(".close-button");
		    var cancelButton = document.querySelector("#cancel");
		    function toggleModal() {
		        
		        location.href="orderList.jsp";
		    }
		    function windowOnClick(event) {
		        if (event.target === modal) {
		            toggleModal();
		        }
		    }
		    closeButton.addEventListener("click", toggleModal);
		    cancel.addEventListener("click", toggleModal);
		    window.addEventListener("click", windowOnClick);
</script>