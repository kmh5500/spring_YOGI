package spring.model.info;

public class InfoDTO {
	private int informnum ;
	private int viewcnt;
	private String content;
	private String title;
	private String wname;
	private String wdate;
	
	public int getInformnum() {
		return informnum;
	}
	public void setInformnum(int informnum) {
		this.informnum = informnum;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	

}
