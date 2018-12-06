package com.spring.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("key")
public class SubController {
	
	HttpSession session;
	
	@RequestMapping("/sub.do")
	public String moveController(@RequestParam("searchCondition") String searchCondition, @RequestParam("searchKeyword") String searchKeyword, Model model) {
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchKeyword : " + searchKeyword);
		String path = null;
		
		if(searchCondition.equals("find_travler")) {
			path = "/getTravelersList.do";
		} else if(searchCondition == "find_host") {
			path = "/getHostList.do";
		} else if(searchCondition == "find_event") {
			path = "/getEventList.do";
		} else if(searchCondition.equals("find_advice")) {
			path = "/getLocalAdviceList.do";	
		}
		
		model.addAttribute("key", searchKeyword);
		
		return path;
	}
	
	
	
}














