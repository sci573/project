package solo.dto;

import java.sql.Date;

public class SoloDTO {
	//login, join
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private String hp;
	private String address;
	private Date join_date;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public SoloDTO() {
	}
	@Override
	public String toString() {
		return "SoloDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", hp=" + hp
				+ ", address=" + address + ", join_date=" + join_date + "]";
	}
	public SoloDTO(String userid, String passwd, String name, String email, String hp, String address, Date join_date) {
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.hp = hp;
		this.address = address;
		this.join_date = join_date;
	}
	
}