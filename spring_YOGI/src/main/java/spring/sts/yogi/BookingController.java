package spring.sts.yogi;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.booking_affiliation.BookingDAO;
import spring.model.booking_affiliation.BookingDTO;


@Controller
public class BookingController {
	@Autowired
	private BookingDAO dao;
	
	@RequestMapping(value="/booking/create", method=RequestMethod.POST)
	public String create(BookingDTO dto,HttpServletRequest request) {
		boolean flag = false;
		
		try {
			flag = dao.create(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 	
	 	if(flag) {
	 		return "redirect:/booking/check";
	 	}else {
	 			return "/error/error";
	 	}
	}
	@RequestMapping(value="/booking/create", method=RequestMethod.GET)
	public String create() {
		
			return "/booking/create";
		
	}
	@RequestMapping("/booking/list")
	public String list(HttpServletRequest request) {
		
		
		
		
		
		return "/booking/list";
	}
	@RequestMapping("/booking/read")
	public String read(int b_num, HttpServletRequest request) {
		
		
		
		
		
		return "/booking/read";
	}
	

}
