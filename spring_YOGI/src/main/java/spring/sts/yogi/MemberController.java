package spring.sts.yogi;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberdao;
	
	
	
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
	
	@RequestMapping(value="/member/login" , method=RequestMethod.POST)
	public String login(HttpServletRequest request,HttpSession session,Model model,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Map map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		int flag = memberdao.loginCheck(map);
		
		String url = "/error/passwdError";
		
		// 회원등급
		if (flag==1) {// 회원인경우
			String grade = memberdao.getGrade(id);
			System.out.println(grade);
			request.getSession().setAttribute("id", id);
			
			request.getSession().setAttribute("grade", grade);

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
		return "home";
		}else {
			
			return url;
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
	
		try {
			boolean flag = memberdao.create(memberdto);
			if(flag)return "redirect:/member/cLogin";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/member/choice";
	}
	
	
	@RequestMapping(value="/member/cLogin")
	public String cLogin() {
		return "/member/cLogin";
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

}
