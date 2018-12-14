package spring.sts.yogi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.booking_room.Booking_roomDAO;
import spring.model.booking_room.Booking_roomDTO;

@Controller
public class Booking_roomController {

	@Autowired
	private Booking_roomDAO dao;
	
	@RequestMapping(value="/booking_room/create", method=RequestMethod.POST)
	public String create(Booking_roomDTO dto) {
		
		return "/booking_room/create";
		
	}
	
	@RequestMapping(value="/booking_room/create", method=RequestMethod.GET)
	public String create() {
		
		return "/booking_room/test";
		
	}
	
}
