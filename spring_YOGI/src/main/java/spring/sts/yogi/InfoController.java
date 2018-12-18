package spring.sts.yogi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.info.InfoDAO;
import spring.model.info.InfoDTO;
import spring.utility.yogi.Utility;

@Controller
public class InfoController {

	@Autowired
	private InfoDAO infoDao;
	
	@RequestMapping("/info/list")
	public String info(Model model,HttpServletRequest request) {
		
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

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		// DB에서 가져올 레코드의 첫번호, 끝번호 설정
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
	

		List<InfoDTO> infoList=infoDao.list(map);
		model.addAttribute("list", infoList);
		
		int totalRecord = infoDao.total(map);

		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		// 전체 레코드 개수는 col, word 필요
		// 검색 시에도 페이징을 해줘야 하기 때문에

		
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		
		return "/info/list";
	}
	
	@RequestMapping(value="info/create",method=RequestMethod.GET)
	public String create() {
		
		
		return "/info/create";
	}
	@RequestMapping(value="/info/create",method=RequestMethod.POST)
	public String create(InfoDTO infoDto,Model model,HttpServletRequest request) {
		
		

		boolean flag = infoDao.create(infoDto);
		if(flag) {
			return "redirect:/info/list";
		}else {
			
		}
		
		return "/info";
	}
	@RequestMapping("/info/read")
	public String read(int informnum,HttpServletRequest request,Model model) {
		
		InfoDTO  infoDto = (InfoDTO) infoDao.read(informnum);
		infoDto.setContent(infoDto.getContent().replaceAll("\r\n","<br>"));
		infoDao.upViewcnt(infoDto.getInformnum());
		model.addAttribute("dto", infoDto);
		
		return "/info/read";
	}
	@RequestMapping(value="/info/update",method=RequestMethod.GET)
	public String update(int informnum,Model model,HttpServletRequest request) {
		
		InfoDTO infoDto = (InfoDTO) infoDao.read(informnum);
		model.addAttribute("dto", infoDto);
		
	return "/info/update";	
	}
	
	@RequestMapping(value="/info/update",method=RequestMethod.POST)
	public String update(InfoDTO infoDto,Model model,HttpServletRequest request) {
		
		
		boolean flag = infoDao.update(infoDto);
		if(flag) {
			model.addAttribute("informnum", infoDto.getInformnum());
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/info/read";
		
		}
		else {
			
			return "/error";
		}
	}
	
	@RequestMapping(value="/info/delete",method=RequestMethod.GET)
	public String delete(int informnum) {
		
		boolean flag = infoDao.delete(informnum);
		
		return "/info/delete";
	}
	
}
