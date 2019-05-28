package menu;

import java.util.Hashtable;

public class CartMgr {

	private Hashtable<String, ordersBean> hCart = new Hashtable<>();

	//cart Insert
	// 새로운 장바구니
	public void addCart(ordersBean order) {
		String menuName = order.getMenu();
		System.out.println(menuName);
		int count = order.getCount(); // 주문 수량
		if(count > 0) {
			//cart에 기존에 저장된 것이 있다면
			if(hCart.containsKey(menuName)) {
				//기존에 저장된 주문 객체
				ordersBean temp = hCart.get(menuName);
				//새로운 주문의 수량 + 기존의 주문 수량
				count += temp.getCount();
				//order 객체에 합쳐진 주문 수량 setter
				order.setCount(count);
				//카트에 다시 저장하면 기존에 주문 객체는 덮어쓰기 된다.
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
		// 동일한 Key 값은 덮어쓰기
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