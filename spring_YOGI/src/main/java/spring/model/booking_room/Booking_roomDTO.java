package spring.model.booking_room;

public class Booking_roomDTO {

	private int bookingRnum     ;
    private String startDate    ;
    private String endDate      ;
    private String id_FK        ;
    private String bookingStatus;
    private int rnum_FK         ;
    
	public int getBookingRnum() {
		return bookingRnum;
	}
	public void setBookingRnum(int bookingRnum) {
		this.bookingRnum = bookingRnum;
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
	public String getBookingStatus() {
		return bookingStatus;
	}
	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}
	public int getRnum_FK() {
		return rnum_FK;
	}
	public void setRnum_FK(int rnum_FK) {
		this.rnum_FK = rnum_FK;
	}
	
}
