<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	session.setAttribute("shop", "가게");
%>
<body>
	<fieldset>
		<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
		<br /> <input id="messid" type="text" size="8" value="어드민" /> <input
			id="inputMessage" type="text" /> <input type="submit" value="send"
			onclick="send()" />
	</fieldset>
</body>
<script type="text/javascript">
	/* 소켓 처리 해야할것
		1. 가게별 세션을 담아서 처리
		2. 보낼때 앞에 가게 이름 붙여서 보내기
		   2 -1. 가게이름 보낼대 hidden 값에 셋팅해서 가져오기
		3. 보낸 후 받을때 알람 처리
	*/
    
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:80/BusanIT_JSP_Project/broadcasting');
	var inputMessage = document.getElementById('inputMessage');
	var id = document.getElementById('messid');

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
		textarea.value += "상대 : " + event.data + "\n";
	}
	function onOpen(event) {
		textarea.value += "연결 성공\n";
	}
	function onError(event) {
		alert(event.data);
	}
	function send() {
		textarea.value += "나 : " + inputMessage.value + "\n";
		webSocket.send(id.value + ":" + inputMessage.value);
		inputMessage.value = "";
	}
</script>
</html>