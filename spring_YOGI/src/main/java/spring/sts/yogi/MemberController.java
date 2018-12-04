package spring.sts.yogi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.member.MemberDAO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberdao;
	
	@RequestMapping(value="/member/create")
	public String create() {
		
		
		return "/member/create";
	}

}
