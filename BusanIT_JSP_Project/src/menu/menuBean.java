package menu;

public class menuBean {
	
	private int idx; //인덱스 번호  
	private String rName; // 식당이름 
	private String category; 
	private String menu; // 메뉴이름 
	private int mPrice; // 메뉴가격 1
	private String mInfo; // 메뉴 설명 
	private String mImg; // 메뉴 이미지 
	private String mImgsize; // 메뉴 파일 크기 
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
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