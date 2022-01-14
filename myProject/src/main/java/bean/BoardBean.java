package bean;

public class BoardBean {
	private int num;
	private String name;
	private String subject;
	private String content;
	private String regdate;
	private String pass;
	private int count;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	/*
	@Override
	public String toString() {
		return "BoardBean [num=" + num + ", name=" + name + ", subject=" + subject + ", content=" + content + ", date="
				+ regdate + ", pass=" + pass + ", count=" + count + "]";
	}
	*/
}
