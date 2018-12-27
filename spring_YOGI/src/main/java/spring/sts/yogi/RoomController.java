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

import spring.model.hotel.HotelDAO;
import spring.model.hotel.HotelDTO;
import spring.model.review.ReviewDAO;
import spring.model.review.ReviewDTO;
import spring.model.review.ReviewService;
import spring.model.room.RoomDAO;
import spring.model.room.RoomDTO;
import spring.utility.yogi.Utility;

@Controller
public class RoomController {
	
	@Autowired
	private RoomDAO dao;
	@Autowired
	private HotelDAO hdao;
	@Autowired
	private ReviewDAO redao;
	@Autowired
	private ReviewService mgr;
	
	@RequestMapping("/room/redelete")
	public String rdelete(int revnum, int rnum, int hnum, String nowPage, 
			int nPage, Model model) throws Exception{
		
		int total = redao.total(hnum);
		int totalPage = (int)Math.ceil((double)total/3);
		int pk = revnum;
		mgr.delete(pk, hnum);
			if(nPage!=1 && nPage==totalPage && total%3==1) nPage = nPage - 1;
			model.addAttribute("hnum", hnum);
			model.addAttribute("rnum", rnum);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			
			return "redirect:/room/read";
		
	}
	
	@RequestMapping("/room/reupdate")
	public String rupdate(ReviewDTO redto, Model model,
			String nowPage, int hnum, int rnum, String nPage) throws Exception {
		mgr.update(redto, hnum);
		model.addAttribute("hnum", hnum);
		model.addAttribute("rnum", rnum);
		model.addAttribute("nPage", nPage);
		model.addAttribute("nowPage", nowPage);
		
		return "redirect:/room/read";
		
	}
	
	
	@RequestMapping("/room/recreate")
	public String rcreate(ReviewDTO redto, HttpSession session, Model model,
			String nowPage, String nPage, int hnum, int rnum) throws Exception {
		
		String revid = (String)session.getAttribute("id");
		redto.setRevid(revid);
		mgr.create(redto, hnum);
		
		model.addAttribute("hnum", hnum);
		model.addAttribute("rnum", rnum);
		model.addAttribute("nPage", nPage);
		model.addAttribute("nowPage", nowPage);
		
		return "redirect:/room/read";
		
	}
	
	
	@RequestMapping("room/read")
	public String read(int rnum, int hnum, Model model, HttpServletRequest request) throws Exception {
		
		RoomDTO dto = (RoomDTO) dao.read(rnum);
		
		String rinfo = dto.getRinfo();
		rinfo = rinfo.replaceAll("\r\n", "<br>");
		
		dto.setRinfo(rinfo);
		
		HotelDTO hdto = (HotelDTO) hdao.read(hnum);
		
		String hinfo = hdto.getHinfo();
		hinfo = hinfo.replaceAll("\r\n", "<br>");
		
		dto.setRinfo(rinfo);
		
		model.addAttribute("dto", dto);
		model.addAttribute("hdto", hdto);
		
/*		댓글 처리 */
		
		String url = "read";//댓글페이지에 매개변수
		int nPage = 1;
		
		if(request.getParameter("nPage")!=null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 3;
		int sno = ((nPage-1) * recordPerPage) + 1;
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("hnum", hnum);
		
		List<ReviewDTO> relist = redao.list(map);
		int total = redao.total(hnum);
	
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		String paging = Utility.repaging(total, nowPage, recordPerPage, hnum, rnum, nPage, url);
		
		model.addAttribute("relist", relist);
		model.addAttribute("nPage", nPage);
		model.addAttribute("paging", paging);

		//댓글 처리 end
		
		return "/room/read";
	}
	
	@RequestMapping(value="/room/update", method=RequestMethod.POST)
	public String update(RoomDTO dto, int rnum, Model model, HttpSession session, HttpServletRequest request, String oldfile) throws Exception {
		
		String hid = (String)session.getAttribute("id");
		
		int hnum = hdao.checkHnum(hid);
		double rrate = dto.getRrate()/100;
		
		dto.setHnum(hnum);
		dto.setRrate(rrate);
		
		String basePath = request.getRealPath("/room/storage");
		
		dto.setRfname(Utility.saveFileSpring(dto.getFnameMF(), basePath));
		if(dto.getRfname() == null || dto.getRfname() == "") {
			String rfname = oldfile;
			dto.setRfname(rfname);
		}
		
		boolean flag = false;
			flag = dao.update(dto);
			if(flag) {
				if(dto.getRfname() != oldfile) {
					Utility.deleteFile(basePath, oldfile);
				}
			}

		model.addAttribute("hnum", hnum);	
		model.addAttribute("rnum", rnum);	
		model.addAttribute("dto", dto);
		
		return "redirect:/room/rread";
	}
	
	@RequestMapping(value="/room/update", method=RequestMethod.GET)
	public String update(int rnum, HttpSession session, Model model) throws Exception {
		
		String hid = (String)session.getAttribute("id");
		
		int hnum = hdao.checkHnum(hid);
		
		Map map = new HashMap();
		map.put("rnum", rnum);
		map.put("hnum", hnum);
		
		RoomDTO dto = dao.read(map);
		model.addAttribute("dto", dto);
		
		return "/room/update";
	}
	
	@RequestMapping("room/rread")
	public String rread(int rnum, HttpSession session, Model model) throws Exception {
		
		String hid = (String)session.getAttribute("id");
		
		int hnum = hdao.checkHnum(hid);
		Map map = new HashMap();
		map.put("rnum", rnum);
		map.put("hnum", hnum);
		
		RoomDTO dto = dao.read(map);
		
		String rinfo = dto.getRinfo();
		rinfo = rinfo.replaceAll("\r\n", "<br>");
		
		dto.setRinfo(rinfo);
		
		model.addAttribute("dto", dto);
		
		return "/room/rread";
	}
	
	@RequestMapping(value="/room/create", method=RequestMethod.POST)
	public String create(RoomDTO dto, HttpServletRequest request, HttpSession session) throws Exception {
		
		String hid = (String)session.getAttribute("id");
		
		int hnum = hdao.checkHnum(hid);
		double rrate = dto.getRrate()/100;
		
		dto.setHnum(hnum);
		dto.setRrate(rrate);
		
	 	String upDir = request.getRealPath("/room/storage");
	 	
		String rfname = "";
		rfname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
		
	 	dto.setRfname(rfname);
	 	
	 	boolean flag;
			flag = dao.create(dto);
			if(flag) {
				return "redirect:/room/rlist";
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
	public String list(HttpServletRequest request, Model model) throws Exception {
		
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
			
		return "/room/list";
	}
	
	@RequestMapping("/room/rlist")
	public String rlist(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		
		String hid = (String)session.getAttribute("id");
		
		
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
		map.put("hid", hid);
		map.put("sno", sno);
		map.put("eno", eno);
		
		
		
		List list;
		int totalRecord;
			list = dao.rlist(map);
			totalRecord = dao.rtotal(map);
			
			String paging = Utility.paging5(totalRecord, nowPage, recordPerPage);
			
			
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("nowPage", nowPage);
			
		return "/room/rlist";
	}
	
	
}
