package spring.model.hotel;

import org.springframework.web.multipart.MultipartFile;

public class HotelDTO {
	private int hnum;
	private String hname;
	private String hphone;
	private String hemail;
	private String hzipcode;
	private String haddress1;
	private String haddress2;
	private String hfname;
	private String hinfo;
	private String hcheckin;
	private String hcheckout;
	private double hstar;
	private MultipartFile filenameMF;
	
	
	public MultipartFile getFilenameMF() {
		return filenameMF;
	}

	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}

	public int getHnum() {
		return hnum;
	}

	public void setHnum(int hnum) {
		this.hnum = hnum;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHphone() {
		return hphone;
	}

	public void setHphone(String hphone) {
		this.hphone = hphone;
	}

	public String getHemail() {
		return hemail;
	}

	public void setHemail(String hemail) {
		this.hemail = hemail;
	}

	public String getHzipcode() {
		return hzipcode;
	}

	public void setHzipcode(String hzipcode) {
		this.hzipcode = hzipcode;
	}

	public String getHaddress1() {
		return haddress1;
	}

	public void setHaddress1(String haddress1) {
		this.haddress1 = haddress1;
	}

	public String getHaddress2() {
		return haddress2;
	}

	public void setHaddress2(String haddress2) {
		this.haddress2 = haddress2;
	}

	public String getHfname() {
		return hfname;
	}

	public void setHfname(String hfname) {
		this.hfname = hfname;
	}

	public String getHinfo() {
		return hinfo;
	}

	public void setHinfo(String hinfo) {
		this.hinfo = hinfo;
	}

	public String getHcheckin() {
		return hcheckin;
	}

	public void setHcheckin(String hcheckin) {
		this.hcheckin = hcheckin;
	}

	public String getHcheckout() {
		return hcheckout;
	}

	public void setHcheckout(String hcheckout) {
		this.hcheckout = hcheckout;
	}

	public double getHstar() {
		return hstar;
	}

	public void setHstar(double hstar) {
		this.hstar = hstar;
	}

}
