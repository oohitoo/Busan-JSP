import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/*@ServerEndpoint("/broadcasting")*/

/* http session �߰� */
@ServerEndpoint(value = "/broadcasting",configurator = GetHttpSessionConfigurator.class)
public class Broadsocket {

	// ������ Ŭ���̾�Ʈ ����
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	//������ shop�� ����
	private static Set<Session> shops = Collections.synchronizedSet(new HashSet<Session>());

	// ���� ����
	private static Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<Session, EndpointConfig>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("�޼��� "+ message); //�޼��� ������
		String[] shopname = message.split(":");
		String a = shopname[0];
		String b = shopname[1];

			synchronized (clients) {
				// Iterate over the connected sessions
				// and broadcast the received message
				// ����� ������ �ݺ� �Ͽ� ���ŵ� �޼����� ������.
//				for (Session client : clients) {
//					if (!client.equals(session)){ //Ŭ���̾�Ʈ session �� �ȿ� �ִ� ���ǰ�
//						client.getBasicRemote().sendText(message);
//					}
//				}
//				
				for(Session shop : shops) {
					System.out.println(a);
					EndpointConfig config = configs.get(shop);
					HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
					if(httpSession.getAttribute("shop").equals(a)) {
						shop.getBasicRemote().sendText(b);	
					}

				}
			}
		}

	@OnOpen
	public void onOpen(EndpointConfig config, Session session) {
		// Add session to the connected sessions set
		// ����� ���ǿ� �߰��ϱ�
		System.out.println(session);		
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		configs.put(session, config);
		if (httpSession.getAttribute("shop") != null) {
			shops.add(session);
		} else {
			clients.add(session);
		}
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		// ������ ����� ���� ����
		EndpointConfig config = configs.get(session);
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());

		if (httpSession.getAttribute("shop") != null) {
			shops.remove(session);
		} else {
			clients.remove(session);
		}
		configs.remove(session);
	}
}