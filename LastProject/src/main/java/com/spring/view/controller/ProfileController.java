package com.spring.view.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.profile.ProfileService;
import com.spring.biz.profile.ProfileVO;

@Controller
public class ProfileController {
		
	@Autowired
	private ProfileService profileService;
	
	public ProfileController() {
		System.out.println("=======프로필 컨트롤러 시작");
	}
	//=======================================
	//마이 프로필
	@RequestMapping(value="myProfile.do", method=RequestMethod.GET)
		public String myProfile(ProfileVO vo, HttpSession session) {
		session.getAttribute("profile");
		return "views/profile/getProfile.jsp";
	}
	//=============================================================
	//프로필 등록

	
	@RequestMapping(value="insertProfile.do", method=RequestMethod.GET)
		public String insertProfileGet(ProfileVO vo, HttpSession session) {
			System.out.println("인서트 프로파일 ===========GET");
			session.getAttribute("profile");
			return "views/profile/ProfileInsert.jsp";
	}
	
	
	@RequestMapping(value="insertProfile.do", method=RequestMethod.POST) 
		public String isnertProfileGet(ProfileVO vo, Model model, @RequestParam("p_hobby") String p_hobby,
				@RequestParam("p_language") String p_language, @RequestParam("p_job") String p_job,
				@RequestParam("p_aboutme") String p_aboutme, @RequestParam("p_purpose") String p_purpose,
				@RequestParam("p_visitcountry") String p_visitcountry,  @RequestParam("m_id") String m_id, @RequestParam("p_route") String p_route, HttpSession session) throws Exception {
		System.out.println("인서트 프로파일 ============ POST");
		vo.setM_id(m_id);
		vo.setP_aboutme(p_aboutme);
		vo.setP_hobby(p_hobby);
		vo.setP_job(p_job);
		vo.setP_purpose(p_purpose);
		vo.setP_visitcountry(p_visitcountry);
		vo.setP_language(p_language);
		vo.setP_route(p_route);
		profileService.InsertProfile(vo);
		session.setAttribute("profile", vo);
		
		
		return "redirect:/sub2.do";
	}
	
	
	
	
	//==============================================================
	//==프로필 수정
	@RequestMapping(value = "/modifyProfile.do", method=RequestMethod.GET)
	public String modifyProfileGet(ProfileVO vo, HttpSession session) {
		System.out.println("=======겟방식");
		session.getAttribute("profile");
		return "views/profile/ProfileModify.jsp";
		}	
	//
	@RequestMapping(value = "/modifyProfile.do",  method=RequestMethod.POST) 
	public String modifyProfilePost(ProfileVO vo, HttpSession session, @RequestParam("p_hobby") String p_hobby,
			@RequestParam("p_language") String p_language, @RequestParam("p_job") String p_job,
			@RequestParam("p_aboutme") String p_aboutme, @RequestParam("p_purpose") String p_purpose,
			@RequestParam("p_visitcountry") String p_visitcountry,  @RequestParam("m_id") String m_id, Model model, @RequestParam("p_route") String p_route) throws Exception {
		System.out.println("프로필 수정 시작");
		vo.setM_id(m_id);
		vo.setP_aboutme(p_aboutme);
		vo.setP_hobby(p_hobby);
		vo.setP_job(p_job);
		vo.setP_purpose(p_purpose);
		vo.setP_visitcountry(p_visitcountry);
		vo.setP_language(p_language);
		vo.setP_route(p_route);
		profileService.ModifyProfile(vo);
		profileService.getProfile2(vo, session);
		session.setAttribute("profile", vo);
		
		
		return "redirect:/sub2.do";
	}
	
	@RequestMapping(value="/insetProfileJson.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> insertMessageJson(ProfileVO vo) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = profileService.insertProfileJson(vo);
		map.put("cnt", count);
		
		return map;
	}  

	
	
	
}
