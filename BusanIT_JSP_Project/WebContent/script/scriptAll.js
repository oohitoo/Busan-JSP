function creatUpdate(menu, num) {
	var count = document.getElementById("count" + num).value;
	if(count < 1){
		alert("�ּ� 1�� �̻� �ֹ� �� �� �־��");
		count =1;
	}else if(count > 99)	{
		alert("�ѹ��� 99������ �ֹ� �� �� �־��");
		count=99;
	}else{
		location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=update&count="+count;
	}
}
function creatdelete(menu, num) {
	var count = document.getElementById("count" + num).value;
	location.href = "../item/privateShopProc.jsp?menu="+menu+"&flag=del&count="+count; 
}
/* Order proc�� �ѱ�� */
function order() {
	/*  1. ���̺��� td�� tageName���� �ڸ��� 
			2. split�� �̿��Ͽ� �ڸ���.
			3. ����Ѵ�.
	 */
	var str = document.getElementById("minimum").value;
	var strsplit = str.split(',');
	if(parseInt(strsplit[0]) <= "13"){
		var popupX = (window.screen.width / 2);
		var popupY = (window.screen.height / 2);
		
		url = "orderMinium.html";
		window.open(url, "orderMinium", "width=400, height=190, resizable=no, left="+ popupX + ",top="+ popupY);
	}
	else{

		var addres = document.getElementById("addres").value;
		var phoneNumber = document.getElementById("phoneNumber").value;
		var request = document.getElementById("request").value;
		var Box = document.getElementById("payType");
		var selectBox = Box.options[Box.selectedIndex].value;

		/* ������� */
		var webSocket = new WebSocket('ws://'+location.host+'/BusanIT_JSP_Project/broadcasting');
		/* ���� ��  (id)*/
		var shopName = $("#shopName");			
		/* ���� �޼��� */
		var Message = "�ֹ��� �Ϸ�Ǿ����ϴ�.\n";

		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onMessage(event) {
			/* textarea.value += "�ֹ��� �Ϸ�Ǿ����ϴ�.\n"; */
			/* alert("�ֹ��� �Ϸ�Ǿ����ϴ�.\n"); */
		}
		function onOpen(event) {
			/* alert("���� ����\n"); */
			send();
		}
		function onError(event) {
			alert(event.data);
		}
		function send() {
			webSocket.send(shopName.val() + ":" + Message);
			Message = "";

			$("div[class=modal]").addClass("show-modal");


			setTimeout(function() {
				location.href = "orderProc.jsp?addres="+addres+"&phoneNumber="+phoneNumber+"&request="+request+"&selectBox="+selectBox; 					
			}, 1000);
		}
	}
}
function reset() {
	addres = document.getElementById("addres").value ="";
	phoneNumber = document.getElementById("phoneNumber").value = "";
	request = document.getElementById("request").value ="";
	Box = document.getElementById("payType") = "";
}
function back() {
	history.back();
}

/* reserve.jsp (Js ����)*/
function menulist(menu) {
	console.log(menu);
	location.href = 'item/itemProc.jsp?menu=' + menu;
}
function check() {
	
	if(document.getElementsByName('name')[0].value <= 1){
		document.reserve.name.focus();
		return ;
	}
	if(document.getElementsByName('cPhone')[0].value <= 1){
		document.reserve.cPhone.focus();
		return ;
	}
	if(document.getElementsByName('oDate')[0].value <= 1){
		document.reserve.oDate.focus();
		return ;
	}
	if(document.getElementsByName('oRequest')[0].value <= 1){
		document.reserve.oRequest.focus();
		return ;
	}
	document.reserve.submit();
}