package spring.model.booking_room;

import java.util.List;
import java.util.Map;

import spring.model.yogiinter.DAOSTDInter;

public interface IBooking_roomDAO extends DAOSTDInter {
	
	public Map readMember(String id) throws Exception;
	public List mlist(Map map) throws Exception;
	public List hlist(Map map) throws Exception;
}
