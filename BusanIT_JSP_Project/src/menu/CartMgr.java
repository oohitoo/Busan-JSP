package menu;

import java.util.Hashtable;

public class CartMgr {

	private Hashtable<String, ordersBean> hCart = new Hashtable<>();

	//cart Insert
	// ���ο� ��ٱ���
	public void addCart(ordersBean order) {
		String menuName = order.getMenu();
		System.out.println(menuName);
		int count = order.getCount(); // �ֹ� ����
		if(count > 0) {
			//cart�� ������ ����� ���� �ִٸ�
			if(hCart.containsKey(menuName)) {
				//������ ����� �ֹ� ��ü
				ordersBean temp = hCart.get(menuName);
				//���ο� �ֹ��� ���� + ������ �ֹ� ����
				count += temp.getCount();
				//order ��ü�� ������ �ֹ� ���� setter
				order.setCount(count);
				//īƮ�� �ٽ� �����ϸ� ������ �ֹ� ��ü�� ����� �ȴ�.
				hCart.put(menuName, order);
			}
			else {
				hCart.put(menuName, order);
			}
		}
	}

	//cart update
	public void updateCart(ordersBean order) {
		String menuName = order.getMenu();
		System.err.println(menuName);
		// ������ Key ���� �����
		hCart.put(menuName, order);
	}
	//cart delete
	public void deleteCart(ordersBean order) {
		String menuName = order.getMenu();
		hCart.remove(menuName);
	}
	//cart list
	public Hashtable<String, ordersBean> getCartList(){
		System.out.println("size : "+hCart.size());
		return hCart;
	}
}