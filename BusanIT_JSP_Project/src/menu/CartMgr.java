package menu;

import java.util.Hashtable;
import orders.ordersBean;

public class CartMgr {
	
	private Hashtable<String, ordersBean> hCart = new Hashtable<>();
		
	//cart Insert
	// 새로운 장바구니
	public void addCart(ordersBean order) {
		String productName = order.getmName();
		int count = order.getCount(); // 주문 수량
		if(count > 0) {
			//cart에 기존에 저장된 것이 있다면
			System.out.println(productName);
			if(hCart.containsKey(productName)) {
				//기존에 저장된 주문 객체
				ordersBean temp = hCart.get(productName);
				//새로운 주문의 수량 + 기존의 주문 수량
				count += temp.getCount();
				//order 객체에 합쳐진 주문 수량 setter
				order.setCount(count);
				//카트에 다시 저장하면 기존에 주문 객체는 덮어쓰기 된다.
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
