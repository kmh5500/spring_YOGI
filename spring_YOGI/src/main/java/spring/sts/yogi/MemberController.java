package spring.sts.yogi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.model.member.MemberService;
import spring.utility.yogi.Utility;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberdao;
	
	@Autowired
	private MemberService memebersv;
	
	@Autowired 
	private JavaMailSenderImpl mailSender;

	
	@RequestMapping(value="/member/findid")
	public String findid() {
		return "/member/findid";
	}
	
	@RequestMapping(value="/member/id")
	public String sendid(final String email, Model model) {
		boolean flag = false;
		
		//이메일 발송 부분
		
		String findId = memberdao.findid(email);
		final StringBuffer sb = new StringBuffer();
		if(findId!=null) {
			sb.append("<div align='center' style='border:1px solid black; font-family:verdana'>");
			sb.append("<h3 style='color: blue;'>");
			sb.append("귀하의 아이디 찾기 결과입니다.</h3>");
			sb.append("<p>아이디는 : "+findId);
			sb.append("</p></div>");
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("soldeskyogi@gmail.com"); 
					helper.setTo(email);
					helper.setSubject("테스트 메일입니다");
					helper.setText(sb.toString(), true);
				} 
			}; 
			flag = true;
			mailSender.send(preparator); 
		}
		model.addAttribute("flag", flag);
		return "/member/sendid";
		
	}
	
	
	@RequestMapping(value="/member/findpass")
	public String findpass() {
		return "/member/findpass";
	}
	
	@RequestMapping(value="/member/pass")
	public String sendpass(final String email, Model model) {
		boolean flag = false;
		String newpass = memberdao.getRamdomPassword(8);
		Map map = new HashMap();
	//	map.put("id", id);
		map.put("email", email);
		map.put("newpass", newpass);
		
		//이메일 발송 부분
		
		String findPass = memberdao.findpass(email);
		final StringBuffer sb = new StringBuffer();
		if(memberdao.updatenewPass(map)) {
			
			sb.append("<div align='center' style='border:1px solid black; font-family:verdana'>");
			sb.append("<h3 style='color: blue;'>");
			sb.append("님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>");
			sb.append("<p>임시 비밀번호 : "+newpass);
			sb.append("</p></div>");
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("soldeskyogi@gmail.com"); 
					helper.setTo(email);
					helper.setSubject("yogi 임시 비밀번호 발급입니다.");
					helper.setText(sb.toString(), true);
				} 
			}; 
			flag = true;
			mailSender.send(preparator); 
		}
		model.addAttribute("flag", flag);
		return "/member/sendpass";
		
	}
	
	
	@RequestMapping(value="/member/login" , method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		 
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		 
		if (cookies != null){ 
		 for (int i = 0; i < cookies.length; i++) { 
		   cookie = cookies[i]; 
		 
		   if (cookie.getName().equals("c_id")){ 
		     c_id = cookie.getValue();     // Y 
		   }else if(cookie.getName().equals("c_id_val")){ 
		     c_id_val = cookie.getValue(); // user1... 
		   } 
		 } 
		} 

		/*----쿠키설정 내용 끝----------------------------*/
		 
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);
		
		return "/member/login"; 
			
	}
	
	@ResponseBody //모달로그인 이전 기존 로그인시 삭제바람
	@RequestMapping(value="/member/login" , method=RequestMethod.POST)
	public String login(String id ,String pass, HttpServletRequest request,HttpSession session,Model model,
			HttpServletResponse response) {
//		String id = request.getParameter("id");
//		String pass = request.getParameter("pass");
		System.out.println(id);
		System.out.println(pass);
		Map map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		int flag = memberdao.loginCheck(map);
		
		String url = "/error/passwdError";
		
		
		if (flag==1) {// 회원인경우
			// 회원등급
			String grade = memberdao.getGrade(id);
			
			request.getSession().setAttribute("id", id);
			
			request.getSession().setAttribute("grade", grade);
			System.out.println(grade);
			// ----------------------------------------------
			// Cookie 저장, Checkbox는 선택하지 않으면 null 임
			// ----------------------------------------------
			Cookie cookie = null;

			String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부

			if (c_id != null) { // 처음에는 값이 없음으로 null 체크로 처리
				cookie = new Cookie("c_id", "Y"); // 아이디 저장 여부 쿠키
				cookie.setMaxAge(120); // 2 분 유지
				response.addCookie(cookie); // 쿠키 기록

				cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키
				cookie.setMaxAge(120); // 2 분 유지
				response.addCookie(cookie); // 쿠키 기록

			} else {
				cookie = new Cookie("c_id", ""); // 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", ""); // 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		//return "home";  //모달로그인 이전 기존 로그인시 리턴주소
		return "1";
		}else {
			
			//return url;
			return "0";
		}

	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/choice",method=RequestMethod.GET)
	public String choice() {
		
		
		return "/member/choice";
	}
	@RequestMapping(value="/member/create",method=RequestMethod.GET)
	public String create() {
		
		
		return "/member/create";
	}
	@RequestMapping(value="/member/create",method=RequestMethod.POST)
	public String create(MemberDTO memberdto,Model model) {
		String phone=memberdto.getPh1()+memberdto.getPh2()+
				memberdto.getPh3();
		System.out.println("phone:"+memberdto.getPhone());
		memberdto.setPhone(phone);
		try {
			boolean flag = memberdao.create(memberdto);
			if(flag) {
				model.addAttribute("dto", memberdto);
				return "/member/cLogin";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/error/error";
	}
	
	
	
	
	@RequestMapping("/member/read")
	public String read(String id, HttpSession session, Model model) {
		if(id==null) {
			id=(String)session.getAttribute("id");
		}
		try {
			MemberDTO memberdto = (MemberDTO)memberdao.read(id);
			model.addAttribute("dto", memberdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/member/read";
	}
	
	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) {
		
		String col= Utility.checkNull(request.getParameter("col"));
	 	String word= Utility.checkNull(request.getParameter("word"));
	 	if(col.equals("total")){
	 		word="";
	 	}
	 	//페이징
	 	int nowPage	=1;
	 	int recordPerPage=5;
	 	if(request.getParameter("nowPage")!=null){
	 		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	 	}
	 	//db에서 가져올 순번
	 	int sno= ((nowPage-1)*recordPerPage)+1;
	 	int eno= nowPage* recordPerPage;
	 	
	 	Map map= new HashMap();
	 	map.put("col", col);
	 	map.put("word", word);
	 	map.put("sno", sno);
	 	map.put("eno", eno);
	 	
		int total= memberdao.total(map);
	 	List<MemberDTO> list =memberdao.list(map);
	 	
	 	String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
	 			
	 	request.setAttribute("list",list);
	 	
	 	request.setAttribute("paging",paging);
	 	request.setAttribute("col",col);
	 	request.setAttribute("word",word);
	 	request.setAttribute("nowPage", nowPage);
		
		return "/member/list";
				
	}
	
	@RequestMapping(value="/member/update",method = RequestMethod.POST)
	public String update(MemberDTO memberdto, HttpSession session, Model model) throws Exception {
		
		
		String id=(String)session.getAttribute("id");
		//String grade=(String)session.getAttribute("grade");
		if(id==memberdto.getId()) {
		memberdto.setId(id);
		}
		if(memberdao.update(memberdto)) {
			model.addAttribute("id", memberdto.getId());
			return "redirect:/member/read";
		}else {
		return "/member/choice";
		}
	}
	
	@RequestMapping(value="/member/updatepass",method = RequestMethod.GET)
	public String updatepass(HttpSession session, Model model) throws Exception {
		
		
		String id=(String)session.getAttribute("id");
		if(id==null) {
		return "/error/error";	
		}else {
			model.addAttribute("id", id);
			return "/member/updatepass";
		}
		
	}
	@RequestMapping(value="/member/updatepass",method = RequestMethod.POST)
	public String updatepass(String newpass,String oldpass, HttpSession session, Model model) throws Exception {
		
		
		String id=(String)session.getAttribute("id");
		Map map = new HashMap();
		map.put("oldpass", oldpass);
		map.put("id",id);
		map.put("newpass", newpass);
		if(memberdao.updatePass(map)) {
			
			session.invalidate();
			return "/member/passcom";
		}else {
			return "/error/passwdError";
		}
	}
	
	@RequestMapping(value="/member/delete",method = RequestMethod.GET)
	public String delete(HttpSession session, Model model) {
		String id=(String)session.getAttribute("id");
		if(id!=null) {
			model.addAttribute("id", id);
			return "/member/del";
		}else {
		
		return "/error/delete";
		}
	}
	
	@RequestMapping(value="/member/delete",method = RequestMethod.POST)
	public String delete(HttpSession session) {
		String id=(String)session.getAttribute("id");
		if(id!=null) {
			if(memebersv.allDelete(id)) {
				session.invalidate();
				return "/member/delete";
			}return "/error/delete";
		}else {
			
			return "/error/delete";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/member/idCheck", method=RequestMethod.GET)
	public String idCheck(String id) {
		
		String check = "0";
		if(memberdao.idCheck(id)==1) {
			check="1";
		}
		System.out.println(check);
		return check;
	}
	@ResponseBody
	@RequestMapping(value="/member/emailCheck", method=RequestMethod.GET)
	public String emailCheck(String email) {
		
		String check = "0"; //중복이 아니면 문자열 0을 리턴
		if(memberdao.emailCheck(email)==1) {
			check="1"; //중복이면 문자열 1을 리턴
		}
		System.out.println(check);
		return check;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/idEmailCheck", method=RequestMethod.GET)
	public String idEmailCheck(String email,String id) {
		
		String check = "0"; //중복이 아니면 문자열 0을 리턴
		Map map = new HashMap();
		map.put("id", id);
		map.put("email", email);
		if(memberdao.idEmailCheck(map)==1) {
			check="1"; //id 와  email이 일치하면 문자열 1을 리턴
		}
		System.out.println(check);
		return check;
	}
  
}
