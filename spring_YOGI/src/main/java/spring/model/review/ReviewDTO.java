package spring.model.review;

public class ReviewDTO {
	private int revnum;
	private String revcontent;
	private String revtitle;
	private String revdate;
	private String revid;
	private double revstar;
	private int hnum;

	
	public String getRevdate() {
		return revdate;
	}
	public void setRevdate(String revdate) {
		this.revdate = revdate;
	}
	public int getRevnum() {
		return revnum;
	}
	public void setRevnum(int revnum) {
		this.revnum = revnum;
	}
	public String getRevcontent() {
		return revcontent;
	}
	public void setRevcontent(String revcontent) {
		this.revcontent = revcontent;
	}
	public String getRevtitle() {
		return revtitle;
	}
	public void setRevtitle(String revtitle) {
		this.revtitle = revtitle;
	}
	public String getRevid() {
		return revid;
	}
	public void setRevid(String revid) {
		this.revid = revid;
	}
	public double getRevstar() {
		return revstar;
	}
	public void setRevstar(double revstar) {
		this.revstar = revstar;
	}
	public int getHnum() {
		return hnum;
	}
	public void setHnum(int hnum) {
		this.hnum = hnum;
	}
	
	
}
