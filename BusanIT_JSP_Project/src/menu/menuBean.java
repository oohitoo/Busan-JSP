package menu;

public class menuBean {
	private String rName; // �Ĵ��̸�
	private String Catagore;
	private String mName; // �޴��̸�
	private int mPrice; // �޴�����
	private String mInfo; // �޴� ����
	private String mImg; // �޴� �̹���
	private String mImgsize; // �޴� ���� ũ��
	
	public String getCatagore() {
		return Catagore;
	}
	public void setCatagore(String catagore) {
		Catagore = catagore;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	public String getmInfo() {
		return mInfo;
	}
	public void setmInfo(String mInfo) {
		this.mInfo = mInfo;
	}
	public String getmImg() {
		return mImg;
	}
	public void setmImg(String mImg) {
		this.mImg = mImg;
	}
	public String getmImgsize() {
		return mImgsize;
	}
	public void setmImgsize(String mImgsize) {
		this.mImgsize = mImgsize;
	}
	
}
