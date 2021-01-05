package solo.dto;

public class NotiDTO {
	private int idx;
	private String name;
	private String passwd;
	private String content;
	private String post_date;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "NotiDTO [idx=" + idx + ", name=" + name + ", passwd=" + passwd + ", content="
				+ content + ", post_date=" + post_date + "]";
	}
	public NotiDTO() {

	}
	public NotiDTO(int idx, String name, String passwd, String content, String post_date) {
		this.idx = idx;
		this.name = name;
		this.passwd = passwd;
		this.content = content;
		this.post_date = post_date;
	}
}
