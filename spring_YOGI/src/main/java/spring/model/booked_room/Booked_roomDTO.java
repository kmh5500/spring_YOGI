package spring.model.booked_room;

public class Booked_roomDTO {
	
    private int bookedRnum           ;
    private String bookedHname       ;
    private String bookedRtype_Person;
    private String finalPrice_Rate   ;
    private String bookedName        ;
    private String bookedPhone       ;
    private String bookedTerm        ;
    private String bookedInfo        ;
    private String id_FK             ;
    
	public int getBookedRnum() {
		return bookedRnum;
	}
	public void setBookedRnum(int bookedRnum) {
		this.bookedRnum = bookedRnum;
	}
	public String getBookedHname() {
		return bookedHname;
	}
	public void setBookedHname(String bookedHname) {
		this.bookedHname = bookedHname;
	}
	public String getBookedRtype_Person() {
		return bookedRtype_Person;
	}
	public void setBookedRtype_Person(String bookedRtype_Person) {
		this.bookedRtype_Person = bookedRtype_Person;
	}
	public String getFinalPrice_Rate() {
		return finalPrice_Rate;
	}
	public void setFinalPrice_Rate(String finalPrice_Rate) {
		this.finalPrice_Rate = finalPrice_Rate;
	}
	public String getBookedName() {
		return bookedName;
	}
	public void setBookedName(String bookedName) {
		this.bookedName = bookedName;
	}
	public String getBookedPhone() {
		return bookedPhone;
	}
	public void setBookedPhone(String bookedPhone) {
		this.bookedPhone = bookedPhone;
	}
	public String getBookedTerm() {
		return bookedTerm;
	}
	public void setBookedTerm(String bookedTerm) {
		this.bookedTerm = bookedTerm;
	}
	public String getBookedInfo() {
		return bookedInfo;
	}
	public void setBookedInfo(String bookedInfo) {
		this.bookedInfo = bookedInfo;
	}
	public String getId_FK() {
		return id_FK;
	}
	public void setId_FK(String id_FK) {
		this.id_FK = id_FK;
	}

}
