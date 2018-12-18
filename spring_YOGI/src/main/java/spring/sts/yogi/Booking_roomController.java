package spring.sts.yogi;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.booking_room.Booking_roomDAO;
import spring.model.booking_room.Booking_roomDTO;

@Controller
public class Booking_roomController {

	@Autowired
	private Booking_roomDAO dao;
	
	
	
	@RequestMapping(value="/booking_room/delete", method=RequestMethod.POST)
	public String delete() {
		
		return "/error/error";
		
	}
	
	@RequestMapping(value="/booking_room/delete", method=RequestMethod.GET)
	public String delete(int bnum) {
		
		return "/error/error";
		
	}
	
	@RequestMapping(value="/booking_room/update", method=RequestMethod.POST)
	public String update(Booking_roomDTO dto) {
		
		return "/error/error";
		
	}
	
	@RequestMapping(value="/booking_room/update", method=RequestMethod.GET)
	public String update() {
		
		return "/error/error";
		
	}
	
	@RequestMapping("/booking_room/read")
	public String read() {
		
		return "/error/error";
		
	}
	
	@RequestMapping("/booking_room/hlist")
	public String hlist() {
		
		return "/error/error";
		
	}
	
	@RequestMapping("/booking_room/mlist")
	public String mlist(HttpServletRequest request, Model model) {
		
		
		String inSdate = 
		
		String[] sdate = request.getParameter("sdate").split("/");
		String[] edate = request.getParameter("edate").split("/");
		
		String term = String.format("%s-%s-%s ~ %s-%s-%s", 
				sdate[2], sdate[1], sdate[0], edate[2], edate[1], edate[0]);
		
		
		Map map = new HashMap();
		map.put("inId", request.getParameter("id"));
		map.put("inSdate", inSdate);
		map.put("inEdate", inEdate);
		map.put("sno", sno);
		map.put("end", eno);
		
		
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("inSdate", inSdate);
		model.addAttribute("inEdate", inEdate);
		model.addAttribute("nowPage", nowPage);
		
		
		
		
		
		return "/error/error";
		
	}
	
	@RequestMapping(value="/booking_room/create", method=RequestMethod.POST)
	public String create(Booking_roomDTO dto, HttpServletRequest request) {		
		
		dto.setBhname(request.getParameter("bhname"));
		dto.setBrtype(request.getParameter("brtype"));
		dto.setBrinfo(request.getParameter("brinfo"));
		dto.setBperson(Integer.parseInt(request.getParameter("bperson")));
		dto.setBcapacity(request.getParameter("bcapacity"));
		dto.setBprice(Integer.parseInt(request.getParameter("bprice")));
		dto.setStartDate(request.getParameter("startDate"));
		dto.setEndDate(request.getParameter("endDate"));
		dto.setBcheckIn(request.getParameter("bcheckIn"));
		dto.setBcheckOut(request.getParameter("bcheckOut"));
		// 예약할 수 있는 것은 등급 'P'만.
		// @session의 id값 사용 -> 만약 session 로그인이 풀린다면? -> 다시 로그인 페이지가 떠야함 
		dto.setId_FK(request.getParameter("id_FK"));
		dto.setRnum_FK(Integer.parseInt(request.getParameter("rnum_FK")));		
		
		try {
			if(dao.create(dto))
			
			return "/booking_room/create";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/error/error";
		
	}
	
	@RequestMapping(value="/booking_room/create", method=RequestMethod.GET)
	public String create(HttpServletRequest request, Model model) {
		
		// 계산이나 정리가 필요한 params
		int acperson = Integer.parseInt(request.getParameter("acperson"));
		int adperson = Integer.parseInt(request.getParameter("adperson"));
		int rprice = Integer.parseInt(request.getParameter("rprice"));
		double rrate = Double.parseDouble(request.getParameter("rrate"));
		int bperson = Integer.parseInt(request.getParameter("bperson"));
		
		// 예약당시 방의 수용량, 수용인원(추가인원)
		String bcapacity = acperson + "(" + adperson + ")";
				
		String[] sdate = request.getParameter("sdate").split("/");
		String[] edate = request.getParameter("edate").split("/");
		
		String term = String.format("%s-%s-%s ~ %s-%s-%s", 
				sdate[2], sdate[1], sdate[0], edate[2], edate[1], edate[0]);
		
		try {
			Map map = dao.readMember(request.getParameter("id"));
			
			// @예약 횟수가 10번 이상인 경우 고정
			double bcnt = ((BigDecimal)map.get("BCNT")).doubleValue() * 0.01;
			// 최종 가격, 방 가격*방 할인율*회원 예약횟수
			int bprice = (int)Math.round(rprice * (1-(rrate+bcnt)));
			String brate = (rrate+bcnt)*100 + "%";
			
			// 예약인원>수용인원 일 때, 명당 10000원씩 추가요금 발생
			if(bperson > acperson) {
				bprice += (bperson - acperson) * 10000;
			}
			
			model.addAttribute("term", term);
			model.addAttribute("bperson", bperson);
			model.addAttribute("bcapacity", bcapacity);
			model.addAttribute("bprice", bprice);
			model.addAttribute("brate", brate);
			model.addAttribute("name", map.get("NAME"));
			model.addAttribute("phone", map.get("PHONE"));
			
			return "/booking_room/create";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/error/error";
		
	}
	
}
