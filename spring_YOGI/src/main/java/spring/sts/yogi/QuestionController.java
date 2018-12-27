package spring.sts.yogi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.question.QuestionDAO;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionDAO dao;
	
	@RequestMapping(value="/question/create", method=RequestMethod.GET)
	public String create() {
		return "/question/create";
	}
	
	@RequestMapping(value="/question/create", method=RequestMethod.POST)
	public String create(Model model) {
		return "redirect:/question/list";
	}

}
