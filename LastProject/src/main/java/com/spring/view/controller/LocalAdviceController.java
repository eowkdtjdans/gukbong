package com.spring.view.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.localAdvice.LocalAdviceService;
import com.spring.biz.localAdvice.LocalAdviceVO;

@Controller
public class LocalAdviceController {
	
	@Autowired
	private LocalAdviceService localAdviceService;
	HttpSession session;
	@RequestMapping("/getLocalAdviceList.do")
	public String getLocalAdviceList(String key, Model model) {
		System.out.println(">> getlocalAdviceList조회");
			
		key = (String)session.getAttribute("key");
		
		List<LocalAdviceVO> localAdviceList = localAdviceService.getLocalAdviceList(key);
		
		model.addAttribute("localAdviceList", localAdviceList);
		return "views/localAdvice.jsp";
	}
	
}






