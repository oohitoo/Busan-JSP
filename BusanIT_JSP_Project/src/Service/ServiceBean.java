package Service;

public class ServiceBean {
	private int snum;
	private String sname;
	private String subject;
	private String content;
	private int pos;
	private int ref;
	private int depth;
	private String regdate;
	private String pass;
	private String ip;
	private int count;
	
	public int getsNum() {
		return snum;
	}
	public void setsNum(int snum) {
		this.snum = snum;
	}
	public String getsName() {
		return sname;
	}
	public void setsName(String sname) {
		this.sname =sname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}