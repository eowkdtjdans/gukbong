package com.spring.view.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.localAdvice.LocalAdviceService;
import com.spring.biz.localAdvice.LocalAdviceVO;

@Controller
@SessionAttributes("key")
public class LocalAdviceController {
	HttpSession session;
	@Autowired
	private LocalAdviceService localAdviceService;
	
	//키값을 받아 localAdvice게시판 전체조회
	@RequestMapping(value="/getLocalAdviceList.do" , method=RequestMethod.POST)
	public String getLocalAdviceList(Model model, @ModelAttribute("key") String key) {
		System.out.println(">> getlocalAdviceList조회");
		System.out.println("key: " + key);
		
		List<LocalAdviceVO> localAdviceList = localAdviceService.getLocalAdviceList(key);
		int countLocalAdvice = localAdviceService.countLocalAdvice(key);
		model.addAttribute("localAdviceList", localAdviceList);
		model.addAttribute("countLocalAdvice", countLocalAdvice);
		
		return "views/localAdvice/localAdvice.jsp";
	}
	
	
	//localAdvice게시판으로 단순 페이지이동
	@RequestMapping(value="/getLocalAdviceList.do", method=RequestMethod.GET)
	public String getLocalAdviceList() {	
		return "views/localAdvice/localAdvice.jsp";
	}
	
	
	//localAdvice에서 게시글작성 버튼누르면 작성페이지로 이동
	//, method=RequestMethod.GET
	@RequestMapping(value="/writeLocalAdvice.do")
	public String moveWriteLocalAdvice() {
		return "views/localAdvice/insertLocalAdvice.jsp";
	}
	
	
	//여기에는 localAdvice게시글작성하고 저장버튼 눌렀을때
	//@RequestMapping(value="/insertLocalAdvice.do")
	@RequestMapping(value="insertLocalAdvice.do")
	public String moveInsertLocalAdvice(LocalAdviceVO vo, HttpSession session, @RequestParam("l_subject") String l_subject, @RequestParam("l_content") String l_content) {
		System.out.println("게시글 등록");
		
		String m_id = (String)session.getAttribute("m_id");	
		System.out.println(m_id);
		vo.setM_id(m_id);
		vo.setL_subject(l_subject);
		vo.setL_content(l_content);
		localAdviceService.insertLocalAdvice(vo);
		
		session.getAttribute("searchCondition");
		session.getAttribute("searchKeyword");
		return "/sub.do";
	}
	
}






