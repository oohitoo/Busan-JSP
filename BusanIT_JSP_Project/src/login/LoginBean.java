package login;

public class LoginBean {
	
	private String id; // 아이디
	private String pwd; // 패스워드
	private String name; // 이름
	private String cNick; // 닉네임
	private String cPhone; // 핸드폰 번호
	private String cPost; // 우편번호
	private String cAddress; //주소
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getcNick() {
		return cNick;
	}
	public void setcNick(String cNick) {
		this.cNick = cNick;
	}
	public String getcPhone() {
		return cPhone;
	}
	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}
	public String getcPost() {
		return cPost;
	}
	public void setcPost(String cPost) {
		this.cPost = cPost;
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}	
}