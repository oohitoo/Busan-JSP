<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	session.setAttribute("shop", "����");
%>
<body>
	<fieldset>
		<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
		<br /> <input id="messid" type="text" size="8" value="����" /> <input
			id="inputMessage" type="text" /> <input type="submit" value="send"
			onclick="send()" />
	</fieldset>
</body>
<script type="text/javascript">
	/* ���� ó�� �ؾ��Ұ�
		1. ���Ժ� ������ ��Ƽ� ó��
		2. ������ �տ� ���� �̸� �ٿ��� ������
		   2 -1. �����̸� ������ hidden ���� �����ؼ� ��������
		3. ���� �� ������ �˶� ó��
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
		textarea.value += "��� : " + event.data + "\n";
	}
	function onOpen(event) {
		textarea.value += "���� ����\n";
	}
	function onError(event) {
		alert(event.data);
	}
	function send() {
		textarea.value += "�� : " + inputMessage.value + "\n";
		webSocket.send(id.value + ":" + inputMessage.value);
		inputMessage.value = "";
	}
</script>
</html>