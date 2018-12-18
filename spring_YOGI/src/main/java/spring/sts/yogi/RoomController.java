package spring.sts.yogi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.annotation.SessionScope;

import spring.model.hotel.HotelDAO;
import spring.model.room.RoomDAO;
import spring.model.room.RoomDTO;
import spring.utility.yogi.Utility;

@Controller
public class RoomController {
	
	@Autowired
	private RoomDAO dao;
	@Autowired
	private HotelDAO hdao;
	
	@RequestMapping(value="/room/create", method=RequestMethod.POST)
	public String create(RoomDTO dto, HttpServletRequest request, HttpSession session) throws Exception {
		
		//String hid = (String)session.getAttribute("id");
		String hid = "user1";
		
		int hnum = hdao.checkHnum(hid);
		double rrate = dto.getRrate()/100;
		System.out.println(rrate);
		dto.setHnum(hnum);
		dto.setRrate(rrate);
		
	 	String upDir = request.getRealPath("/room/storage");
	 	
		String rfname = "";
		rfname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
		
	 	dto.setRfname(rfname);
	 	
	 	boolean flag;
			flag = dao.create(dto);
			if(flag) {
				return "redirect:/room/list";
			}else {
				if(!rfname.equals(""))
					Utility.deleteFile(upDir, rfname);
				return "/error/error";
			}
		
	}
	
	@RequestMapping(value="/room/create", method=RequestMethod.GET)
	public String create() {
		
		return "/room/create";
	}
	
	@RequestMapping("/room/list")
	public String list(HttpServletRequest request, Model model) {
		
		int srprice = 0;
		int erprice = 500000;
		int rperson = 1;
		
		String type = Utility.checkNull(request.getParameter("type"));
		if(type.equals("선택")) {
			type = "";
		}
		if(request.getParameter("srprice")!=null && request.getParameter("srprice")!="") {
			srprice = Integer.parseInt(request.getParameter("srprice"));
		}
		if(request.getParameter("erprice")!=null && request.getParameter("erprice")!="") {
			erprice = Integer.parseInt(request.getParameter("erprice"));
		}
		String sdate = Utility.checkNull(request.getParameter("sdate"));
		String edate = Utility.checkNull(request.getParameter("edate"));
		if(request.getParameter("rperson")!=null) {
			rperson = Integer.parseInt(request.getParameter("rperson"));
		}
		
		
		//paging관련
		int nowPage = 1;
		int recordPerPage = 5;
		if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		//DB에서 가져올 레코드의 순번
		int sno = ((nowPage-1)*recordPerPage) + 1;
		int eno = nowPage * recordPerPage;	
		
		Map map = new HashMap();
		map.put("type", type);
		map.put("srprice", srprice);
		map.put("erprice", erprice);
		map.put("sdate", sdate);
		map.put("edate", edate);
		map.put("rperson", rperson);
		map.put("sno", sno);
		map.put("eno", eno);
		
		
		
		List list;
		int totalRecord;
		try {
			list = dao.list(map);
			totalRecord = dao.total(map);
			
			String paging = Utility.paging4(totalRecord, nowPage, recordPerPage, type, srprice, erprice, sdate, edate, rperson);
			
			
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("type", type);
			model.addAttribute("srprice", srprice);
			model.addAttribute("erprice", erprice);
			model.addAttribute("sdate", sdate);
			model.addAttribute("edate", edate);
			model.addAttribute("rperson", rperson);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/room/list";
	}
	
	@RequestMapping("/room/rlist")
	public String rlist(HttpServletRequest request, Model model) {
		
		int srprice = 0;
		int erprice = 500000;
		int rperson = 1;
		
		String type = Utility.checkNull(request.getParameter("type"));
		if(type.equals("선택")) {
			type = "";
		}
		if(request.getParameter("srprice")!=null && request.getParameter("srprice")!="") {
			srprice = Integer.parseInt(request.getParameter("srprice"));
		}
		if(request.getParameter("erprice")!=null && request.getParameter("erprice")!="") {
			erprice = Integer.parseInt(request.getParameter("erprice"));
		}
		String sdate = Utility.checkNull(request.getParameter("sdate"));
		String edate = Utility.checkNull(request.getParameter("edate"));
		if(request.getParameter("rperson")!=null) {
			rperson = Integer.parseInt(request.getParameter("rperson"));
		}
		
		
		//paging관련
		int nowPage = 1;
		int recordPerPage = 5;
		if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		//DB에서 가져올 레코드의 순번
		int sno = ((nowPage-1)*recordPerPage) + 1;
		int eno = nowPage * recordPerPage;	
		
		Map map = new HashMap();
		map.put("type", type);
		map.put("srprice", srprice);
		map.put("erprice", erprice);
		map.put("sdate", sdate);
		map.put("edate", edate);
		map.put("rperson", rperson);
		map.put("sno", sno);
		map.put("eno", eno);
		
		
		
		List list;
		int totalRecord;
		try {
			list = dao.list(map);
			totalRecord = dao.total(map);
			
			String paging = Utility.paging4(totalRecord, nowPage, recordPerPage, type, srprice, erprice, sdate, edate, rperson);
			
			
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("type", type);
			model.addAttribute("srprice", srprice);
			model.addAttribute("erprice", erprice);
			model.addAttribute("sdate", sdate);
			model.addAttribute("edate", edate);
			model.addAttribute("rperson", rperson);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/room/rlist";
	}
	
	
}
