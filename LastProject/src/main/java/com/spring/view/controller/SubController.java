package com.spring.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SubController {
	
	@RequestMapping("/sub.do")
	public String moveController(@RequestParam("searchCondition") String searchCondition, @RequestParam("searchKeyword") String searchKeyword) {
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchKeyword : " + searchKeyword);
		String path = null;
		
		if(searchCondition.equals("find_travler")) {
			path = "/getTravelersList.do";
		} else if(searchCondition == "find_host") {
			path = "/getHostList.do";
		} else if(searchCondition == "find_event") {
			path = "/getEventList.do";
		} else if(searchCondition == "find_advice") {
			path = "/getAdviceList.do";
		}
		
		return path;
	}
	
	
	
	
	
	
	
	
	
	
}













