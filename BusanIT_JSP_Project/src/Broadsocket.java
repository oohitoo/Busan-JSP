import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class Broadsocket {

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메세지 "+ message); //메세지 가져옴
		String shop = message.split(":")[0];
		String ma = message.split(":")[1];
		System.err.println(shop);
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			// 연결된 세션을 반복 하여 수신된 메세지를 보낸다.

			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		// 연결된 세션에 추가하기
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		// 연결이 끊기면 세션 삭제
		clients.remove(session);
	}
}