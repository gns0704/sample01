package test.vo;
// VO(Value Object)클래스

import java.sql.Date;

public class MembersVo {
	private int num;
	private String name;
	private String phone;
	private String addr;
	private Date regdate;
	
	public MembersVo() {}
	
	public MembersVo(int num,String name,String phone,String addr,Date regdate) {
		this.num=num;
		this.name=name;
		this.phone=phone;
		this.addr=addr;
		this.regdate=regdate;
	}

	//alt+shift+s
	//setter메소드
	public void setNum(int num) {
		this.num=num;
	}
	public void setName(String name) {
		this.name=name;
	}
	public void setRegdate(Date regdate) {
		this.regdate=regdate;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}	


	public int getNum() {
		return num;
	}
	

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddr() {
		return addr;
	}

	public Date getRegdate() {
		return regdate;
	}
	
	
}



