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

import spring.model.question.QuestionDAO;
import spring.model.question.QuestionDTO;
import spring.utility.yogi.Utility;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionDAO dao;
	
	@RequestMapping("/question/read")
	public String read(int qnum, Model model) {
		
		try {
			QuestionDTO dto = (QuestionDTO)dao.read(qnum);
			
			model.addAttribute("dto", dto);
			
			return "/question/read";
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return "/error/error";
		
	}
	
	@RequestMapping("/question/list")
	public String list(HttpServletRequest request, Model model) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) {
			word = "";
		}
		
		int nowPage = 1;
		int recordPerPage = 5;
		
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}		

		int sno = ((nowPage-1)*recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
				
		List<QuestionDTO> list;		
		int totalRecord;
		try {
			list = dao.list(map);
			totalRecord = dao.total(map);
			
			String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
			
			model.addAttribute("list", list);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("paging", paging);
						
			return "/question/list";
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return "/error/error";
		
	}
	
	@RequestMapping(value="/question/create", method=RequestMethod.GET)
	public String create() {
		return "/question/create";
	}
	
	@RequestMapping(value="/question/create", method=RequestMethod.POST)
	public String create(QuestionDTO dto) {
		
		try {
			if (dao.create(dto)) {
				return "redirect:/question/list";			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/error/error";				
	}

}
