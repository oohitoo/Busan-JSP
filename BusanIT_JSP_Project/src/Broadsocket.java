import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/* http session 추가 */
@ServerEndpoint(value= "/broadcasting", configurator = GetHttpSessionConfigurator.class)
public class Broadsocket {

	// 접속한 클라이언트 세션
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	// 서블릿 세션
	private static Set<Session> shopclients = Collections.synchronizedSet(new HashSet<Session>());
	// 서블릿 세션 값 저장
	private static Map<Session, EndpointConfig> allSession = Collections.synchronizedMap(new HashMap<Session, EndpointConfig>()); 
	

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메세지 "+ message); //메세지 가져옴
		String shopName = message.split(":")[0]; //가게 이름
		String messages = message.split(":")[1];
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			// 연결된 세션을 반복 하여 수신된 메세지를 보낸다.

			for(Session shop : shopclients) {
				EndpointConfig config = allSession.get(shop);
				HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
				if(httpSession.getAttribute("shop").equals(shopName)) {
					shop.getBasicRemote().sendText(messages);	
				}
			}
			
		}
	}

	@OnOpen
	public void onOpen(EndpointConfig config,Session session) {
		// Add session to the connected sessions set
		// 연결된 세션에 추가하기
		System.out.println(session);		
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		allSession.put(session, config);
		if (httpSession.getAttribute("shop") != null) {
			shopclients.add(session);
		} else {
			clients.add(session);
		}
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		// 연결이 끊기면 세션 삭제
		EndpointConfig config = allSession.get(session);
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());

		if (httpSession.getAttribute("shop") != null) {
			shopclients.remove(session);
		} else {
			clients.remove(session);
		}
		allSession.remove(session);
	}
}