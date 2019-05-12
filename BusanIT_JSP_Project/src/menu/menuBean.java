package menu;

public class menuBean {
	private String rName; // 식당이름
	private String Catagore;
	private String mName; // 메뉴이름
	private int mPrice; // 메뉴가격
	private String mInfo; // 메뉴 설명
	private String mImg; // 메뉴 이미지
	private String mImgsize; // 메뉴 파일 크기
	
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
