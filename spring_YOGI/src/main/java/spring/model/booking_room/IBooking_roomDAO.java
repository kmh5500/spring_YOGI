package spring.model.booking_room;

import java.util.Map;

import spring.model.yogiinter.DAOSTDInter;

public interface IBooking_roomDAO extends DAOSTDInter {
	
	public Map readMember(String id) throws Exception;

}
