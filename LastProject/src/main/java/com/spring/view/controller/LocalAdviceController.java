package com.spring.view.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.localAdvice.LocalAdviceService;
import com.spring.biz.localAdvice.LocalAdviceVO;

@Controller
@SessionAttributes("key")
public class LocalAdviceController {
	
	@Autowired
	private LocalAdviceService localAdviceService;
	
	@RequestMapping("/getLocalAdviceList.do")
	public String getLocalAdviceList(Model model, @ModelAttribute("key") String key) {
		System.out.println(">> getlocalAdviceList조회");
		System.out.println("key: " + key);
	
		List<LocalAdviceVO> localAdviceList = localAdviceService.getLocalAdviceList(key);
		
		model.addAttribute("localAdviceList", localAdviceList);
		return "views/localAdvice/localAdvice.jsp";
	}
	
}






