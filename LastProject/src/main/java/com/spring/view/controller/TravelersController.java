package com.spring.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.Travelers.TravelersService;
import com.spring.biz.Travelers.TravelersVO;

@Controller
public class TravelersController {
	@Autowired
	private TravelersService travelersService;
	
	@RequestMapping("/getTravelersList.do")
	public String getBoardList(TravelersVO vo, Model model) {
		System.out.println(">> 글목록 조회 처리(getTravelersList)");
		
		List<TravelersVO> travelersList = travelersService.getTravelersList("Seoul");
		
		model.addAttribute("travelersList", travelersList);
		
		return "travelers/Travelers.jsp";
	}
}
