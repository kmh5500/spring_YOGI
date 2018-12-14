package spring.sts.yogi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.room.RoomDAO;
import spring.model.room.RoomDTO;
import spring.utility.yogi.Utility;

@Controller
public class RoomController {
	
	@Autowired
	private RoomDAO dao;
	
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
	
}
