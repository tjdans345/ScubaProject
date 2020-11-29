package com.scuba.jobSearchboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/jobboard/*")
public class jobSearchboardController {
	@Autowired
	jobSearchboardService jobsearchboardService;
	
	ModelAndView mav = new ModelAndView();
	
	
}
