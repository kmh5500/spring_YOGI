package spring.model.room;

import org.springframework.web.multipart.MultipartFile;

import spring.model.hotel.HotelDTO;

public class RoomDTO {
	private int rnum;
	private String rtype;
	private int acperson;
	private int adperson;
	private String rfname;
	private String rinfo;
	private int hnum;
	private int rprice;
	private double rrate;
	private MultipartFile filenameMF;
	
	private HotelDTO hdto;
	
	
	public MultipartFile getFilenameMF() {
		return filenameMF;
	}
	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}
	public HotelDTO getHdto() {
		return hdto;
	}
	public void setHdto(HotelDTO hdto) {
		this.hdto = hdto;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public int getAcperson() {
		return acperson;
	}
	public void setAcperson(int acperson) {
		this.acperson = acperson;
	}
	public int getAdperson() {
		return adperson;
	}
	public void setAdperson(int adperson) {
		this.adperson = adperson;
	}
	public String getRfname() {
		return rfname;
	}
	public void setRfname(String rfname) {
		this.rfname = rfname;
	}
	public String getRinfo() {
		return rinfo;
	}
	public void setRinfo(String rinfo) {
		this.rinfo = rinfo;
	}
	public int getHnum() {
		return hnum;
	}
	public void setHnum(int hnum) {
		this.hnum = hnum;
	}
	public int getRprice() {
		return rprice;
	}
	public void setRprice(int rprice) {
		this.rprice = rprice;
	}
	public double getRrate() {
		return rrate;
	}
	public void setRrate(double rrate) {
		this.rrate = rrate;
	}
	
	
}