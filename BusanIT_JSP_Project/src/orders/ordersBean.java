package orders;

public class ordersBean {

	private int oNum; // �ֹ���ȣ
	private String id; // ���̵�
	private String cNick; //�г���
	private String cAddress; // �ּ�
	private String rName; // �Ĵ��̸�
	private String cPhone; // ����� ����ȣ
	private String menu; // �޴� �̸�
	private int count; // �ֹ� ����
	private String oDate; // �ֹ� �ð�
	private String oRequest; //��û����
	private String orderType; // ���, �����̳�
	private String payType;	 // ���� Ÿ��

	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getcNick() {
		return cNick;
	}
	public void setcNick(String cNick) {
		this.cNick = cNick;
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getcPhone() {
		return cPhone;
	}
	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getoRequest() {
		return oRequest;
	}
	public void setoRequest(String oRequest) {
		this.oRequest = oRequest;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
}
