package spring.sts.yogi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import spring.model.member.MemberDAO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberdao;
	
	public String create() {
		return "";
	}

}
