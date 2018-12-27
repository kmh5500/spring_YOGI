package spring.sts.yogi;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.hotel.HotelDAO;
import spring.model.hotel.HotelDTO;
import spring.utility.yogi.Utility;

@Controller
public class HotelController {

	@Autowired
	private HotelDAO dao;
	
	@RequestMapping(value="/hotel/update", method=RequestMethod.POST)
	public String update(HotelDTO dto, int hnum, Model model, HttpServletRequest request, String oldfile) throws Exception {
		
		
		String basePath = request.getRealPath("/hotel/storage");
		
		dto.setHfname(Utility.saveFileSpring(dto.getFnameMF(), basePath));
		if(dto.getHfname() == null || dto.getHfname() == "") {
			String hfname = oldfile;
			dto.setHfname(hfname);
		}
		
		boolean flag = false;
			flag = dao.update(dto);
			if(flag) {
				if(dto.getHfname() != oldfile) {
					Utility.deleteFile(basePath, oldfile);
				}
			}

		model.addAttribute("hnum", hnum);	
		model.addAttribute("dto", dto);
		return "redirect:/hotel/read";
	}
	
	@RequestMapping(value="/hotel/update", method=RequestMethod.GET)
	public String update(int hnum, Model model) throws Exception {
		
		HotelDTO dto = (HotelDTO) dao.read(hnum);
		model.addAttribute("dto", dto);
		
		return "/hotel/update";
	}
	
	@RequestMapping("/hotel/read")
	public String read(int hnum, Model model, HttpServletRequest request) throws Exception {
		
		
		HotelDTO dto = (HotelDTO)dao.read(hnum);
		
		String hinfo = dto.getHinfo();
		hinfo = hinfo.replaceAll("\r\n", "<br>");
		
		dto.setHinfo(hinfo);
		
		model.addAttribute("dto", dto);
		
		return "/hotel/read";
	}
	
	@ResponseBody
	@RequestMapping(value="/hotel/hemailCheck", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String hemailCheck(String hemail) {
		
		boolean flag;
		try {
			flag = dao.duplicateHemail(hemail);
			String str = null;
			if(flag) {
				str = "중복되어서 사용할 수 없습니다.";
			}else {
				str = "중복아님, 사용가능합니다.";
			}
			return str;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "/error/error";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/hotel/hnameCheck", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String hnameCheck(String hname) {
		
		boolean flag;
		try {
			flag = dao.duplicateHname(hname);
			String str = null;
			if(flag) {
				str = "중복되어서 사용할 수 없습니다.";
			}else {
				str = "중복아님, 사용 가능합니다.";
			}
			
			return str;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "/error/error";
		}
	}
	
	@RequestMapping("/hotel/createProc")
	public String create(HotelDTO dto, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		String str = null;
		String url = "/hotel/pcreate";
		int hstar = 0;
		String hid = (String)session.getAttribute("id");
			if(dao.duplicateHname(dto.getHname())){
				str = "중복된 호텔명입니다. 호텔명 중복확인을 하세요";
				model.addAttribute("str", str);
				
			}else if(dao.duplicateHemail(dto.getHemail())){
				str = "중복된 이메일입니다. 이메일 중복확인을 하세요";
				model.addAttribute("str", str);
				
			}else{
				String upDir = request.getRealPath("/hotel/storage");
			
				String hfname = null;
					hfname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
				
				dto.setHfname(hfname);
				dto.setHstar(hstar);
				dto.setHid(hid);
				
				boolean flag;
				
					flag = dao.create(dto);
					
					//String hid = (String)session.getAttribute("id");
					int hnum = dao.checkHnum(hid);
					dto.setHnum(hnum);
					model.addAttribute("dto", dto);
					model.addAttribute("flag", flag);
					
					url = "/hotel/createProc";
		}
		return url;
	}
	
	@RequestMapping("/hotel/create")
	public String create() {
		
		return "/hotel/create";
	}
}
