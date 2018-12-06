package spring.sts.yogi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.alliance.AllianceDAO;
import spring.model.alliance.AllianceDTO;
import spring.utility.yogi.Utility;

@Controller
public class AllianceController {

	
	@Autowired
	private AllianceDAO dao;
	
	@RequestMapping(value="/alliance/create", method=RequestMethod.POST)
	public String create(AllianceDTO dto, HttpServletRequest request) throws Exception {
		String upDir = request.getRealPath("/storage");
		
		
		
		boolean flag = dao.create(dto);
		
		
		if(flag) {
			return "redirect:/alliance/list";
		}else {
			return "/error/error";
		}
		
	}
	@RequestMapping(value="/alliance/create", method=RequestMethod.GET)
	public String create() {
		
		return "/alliance/create";
	}
	@RequestMapping("/alliance/list")
	public String list(HttpServletRequest request) throws Exception {
		
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
			// 검색 관련 처리
			
		if (col.equals("total")) {
			word = "";
		}
			
		int nowPage = 1;
		int recordPerPage = 5;
			// paging 관련 처리
			
		if (request.getParameter("nowPage") != null) {	
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
			// 처음 가져온 nowPage의 값이 null일 경우 형변환을 시도하면 Exception에러가 날 수 있으므로
			
		int sno = ((nowPage-1)*recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
			// DB에서 가져올 레코드의 첫번호, 끝번호 설정
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		

		 
		List<AllianceDTO> list = dao.list(map);
		
		int totalRecord = dao.total(map);
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		
		
		return "/alliance/list";
	}
	
	@RequestMapping("/alliance/read")
	public String read(HttpServletRequest request,int anum) throws Exception {
		
		
		Object dto = dao.read(anum);
		
		request.setAttribute("dto", dto);
	
		
		
		
		
		return "/alliance/read";
		
	}
	@RequestMapping(value="/alliance/update", method=RequestMethod.POST)
	public String update(AllianceDTO dto, Model model) throws Exception {
		
		boolean flag = dao.update(dto);
		
		model.addAttribute("flag", flag);
		
		if(dao.update(dto)) {
			return "redirect:/alliance/list";
		}else {
			return "/error/error";
		}
		
	}
	
	
	@RequestMapping(value="/alliance/update", method=RequestMethod.GET)
	public String update(int anum, Model model) throws Exception {
		
		Object dto = dao.read(anum);
		
		
		model.addAttribute("dto", dto);
		
		
		
		
		return "/alliance/update";
	}
}
