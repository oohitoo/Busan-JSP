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

/* http session �߰� */
@ServerEndpoint(value= "/broadcasting", configurator = GetHttpSessionConfigurator.class)
public class Broadsocket {

	// ������ Ŭ���̾�Ʈ ����
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	// ���� ����
	private static Set<Session> shopclients = Collections.synchronizedSet(new HashSet<Session>());
	// ���� ���� �� ����
	private static Map<Session, EndpointConfig> allSession = Collections.synchronizedMap(new HashMap<Session, EndpointConfig>()); 
	

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("�޼��� "+ message); //�޼��� ������
		String shopName = message.split(":")[0]; //���� �̸�
		String messages = message.split(":")[1];
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			// ����� ������ �ݺ� �Ͽ� ���ŵ� �޼����� ������.

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
		// ����� ���ǿ� �߰��ϱ�
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
		// ������ ����� ���� ����
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