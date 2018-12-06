package com.spring.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.travelers.TravelersService;
import com.spring.biz.travelers.TravelersVO;

@Controller
public class TravelersController {
	@Autowired
	private TravelersService travelersService;
	
	public TravelersController() {
		System.out.println("TravelersController 실행");
	}
	
	@RequestMapping("/getTravelersList.do")
	public String getTravelersList(String key, Model model) {
		System.out.println(">> 글목록 조회 처리(getTravelersList)");
		
		
		key="Seoul";
		
		List<TravelersVO> travelersList = travelersService.getTravelersList(key);
		
		model.addAttribute("travelersList", travelersList);
		return "views/travelers/Travelers.jsp";
	}
}
