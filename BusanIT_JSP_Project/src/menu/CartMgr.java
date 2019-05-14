package menu;

import java.util.Hashtable;
import orders.ordersBean;

public class CartMgr {
	
	private Hashtable<String, ordersBean> hCart = new Hashtable<>();
		
	//cart Insert
	// ���ο� ��ٱ���
	public void addCart(ordersBean order) {
		String productName = order.getmName();
		int count = order.getCount(); // �ֹ� ����
		if(count > 0) {
			//cart�� ������ ����� ���� �ִٸ�
			System.out.println(productName);
			if(hCart.containsKey(productName)) {
				//������ ����� �ֹ� ��ü
				ordersBean temp = hCart.get(productName);
				//���ο� �ֹ��� ���� + ������ �ֹ� ����
				count += temp.getCount();
				//order ��ü�� ������ �ֹ� ���� setter
				order.setCount(count);
				//īƮ�� �ٽ� �����ϸ� ������ �ֹ� ��ü�� ����� �ȴ�.
				hCart.put(productName, order);
			}
			else {
				hCart.put(productName, order);
			}
		}
	}
	//cart list
	public Hashtable<String, ordersBean> getCartList(){
		return hCart;
	}
}
