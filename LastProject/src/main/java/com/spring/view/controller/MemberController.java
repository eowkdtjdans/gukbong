package com.spring.view.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller 
@SessionAttributes("sessionScope")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	public MemberController() {
		System.out.println("=======멤버 컨트롤러 시작");
	}
	
	@RequestMapping("/test2.do")
	public String main() {
		return "views/test2.jsp";
	}
	
	//회원가입
	@RequestMapping("/insertMember.do")
	public String insertMember(MemberVO vo) {
		System.out.println("=======인서트시작");
		memberService.insertMember(vo);
		return "/test2.do";
	}
	
	
	//로그인
	@RequestMapping("/loginMember.do")
	public ModelAndView insertMember(@ModelAttribute MemberVO vo, Model model) {
		System.out.println("=======로그인 시작");
		memberService.loginMember(vo, model);
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/test2.do");
			mav.addObject("msg", "success");
		return mav;
	}
	
	
	//로그아웃
	@RequestMapping("/logoutMember.do")
	public ModelAndView logoutMember(HttpSession session) {
		memberService.logoutMember(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main.do");
		mav.addObject("msg", "success");
		return mav;
	}
	
}
