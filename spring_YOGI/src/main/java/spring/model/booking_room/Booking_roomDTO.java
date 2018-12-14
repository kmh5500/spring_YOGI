package spring.model.booking_room;

public class Booking_roomDTO {

    private int bnum       ;
    private String bname    ;
    private String bphone   ;
    private String bhname   ;
    private String brtype   ;
    private String brinfo   ;
    private int bperson     ;
    private String bcapacity;
    private int bprice      ;
    private String bcheckIn ;
    private String bcheckOut;
    private String startDate;
    private String endDate  ;
    private String id_FK    ;
    private String bstatus  ;
    private int rnum_FK     ;
    
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBphone() {
		return bphone;
	}
	public void setBphone(String bphone) {
		this.bphone = bphone;
	}
	public String getBhname() {
		return bhname;
	}
	public void setBhname(String bhname) {
		this.bhname = bhname;
	}
	public String getBrtype() {
		return brtype;
	}
	public void setBrtype(String brtype) {
		this.brtype = brtype;
	}
	public String getBrinfo() {
		return brinfo;
	}
	public void setBrinfo(String brinfo) {
		this.brinfo = brinfo;
	}
	public int getBperson() {
		return bperson;
	}
	public void setBperson(int bperson) {
		this.bperson = bperson;
	}
	public String getBcapacity() {
		return bcapacity;
	}
	public void setBcapacity(String bcapacity) {
		this.bcapacity = bcapacity;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public String getBcheckIn() {
		return bcheckIn;
	}
	public void setBcheckIn(String bcheckIn) {
		this.bcheckIn = bcheckIn;
	}
	public String getBcheckOut() {
		return bcheckOut;
	}
	public void setBcheckOut(String bcheckOut) {
		this.bcheckOut = bcheckOut;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getId_FK() {
		return id_FK;
	}
	public void setId_FK(String id_FK) {
		this.id_FK = id_FK;
	}
	public String getBstatus() {
		return bstatus;
	}
	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}
	public int getRnum_FK() {
		return rnum_FK;
	}
	public void setRnum_FK(int rnum_FK) {
		this.rnum_FK = rnum_FK;
	}
	
}
