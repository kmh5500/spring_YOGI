package spring.model.alliance;

import org.springframework.web.multipart.MultipartFile;

public class AllianceDTO {

	
	private int anum;
	private String content;
	private String aname;
	private String fname;
	private String sname;
	private MultipartFile FnameMF;
	private MultipartFile SnameMF;
	private String hname;
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public MultipartFile getFnameMF() {
		return FnameMF;
	}
	public void setFnameMF(MultipartFile fnameMF) {
		FnameMF = fnameMF;
	}
	public MultipartFile getSnameMF() {
		return SnameMF;
	}
	public void setSnameMF(MultipartFile snameMF) {
		SnameMF = snameMF;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	
	
	
	
	
	
	
	
}
	