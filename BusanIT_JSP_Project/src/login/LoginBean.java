package login;

public class LoginBean {
	
	private String id;
	private String pwd;
	private String name;
	private String phonenumber;
	private String cPostnumber;
	private String cAddress;
	
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
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getcPostnumber() {
		return cPostnumber;
	}
	public void setcPostnumber(String cPostnumber) {
		this.cPostnumber = cPostnumber;
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}
	
}