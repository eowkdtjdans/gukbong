package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.hostImage.HostImageService;
import com.spring.biz.hostImage.HostImageVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profile.ProfileService;
import com.spring.biz.profile.ProfileVO;
import com.spring.biz.profileImage.FileUploadService;
import com.spring.biz.profileImage.ProfileImageService;
import com.spring.biz.profileImage.ProfileImageVO;

@Controller
public class ProfileImageController {
	@Autowired
	private ProfileImageService profileImageService;
	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private ProfileService profileService;
	@Autowired
	private HostImageService hostImageService;
	public ProfileImageController () {
		System.out.println("ProfileImageController 컨트롤러");
	}
		@RequestMapping(value="HostImageList.do", method=RequestMethod.POST )
		public String HostImageListPost(HostImageVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
			vo.setM_id(m_id);
			System.out.println("m_id = " + m_id);
			System.out.println("vo : " + vo);
			List<HostImageVO> hostImageList = hostImageService.getHostImageList(m_id);
			System.out.println("list : " + hostImageList);
			session.setAttribute("hostImageList", hostImageList);
			return "/views/profile/HostImageList.jsp";
		}
		@RequestMapping(value="HostImageList.do", method=RequestMethod.GET )
		public String HostImageListGet(HostImageVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
			vo.setM_id(m_id);
			System.out.println("m_id = " + m_id);
			System.out.println("vo : " + vo);
			List<HostImageVO> hostImageList = hostImageService.getHostImageList(m_id);
			System.out.println("list : " + hostImageList);
			session.setAttribute("hostImageList", hostImageList);
			return "/views/profile/HostImageList.jsp";
		}
	@RequestMapping(value="profileImageList.do", method=RequestMethod.POST )
	public String profileImageListPost(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
		vo.setM_id(m_id);
		System.out.println("m_id = " + m_id);
		System.out.println("vo : " + vo);
		List<ProfileImageVO> profileImageList = profileImageService.getProfileImageList(m_id);
		System.out.println("list : " + profileImageList);
		session.setAttribute("profileImageList", profileImageList);
		return "/views/profile/ProfileImageList.jsp";

	}
	@RequestMapping(value="profileImageList.do", method=RequestMethod.GET )
	public String profileImageListGet(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
		vo.setM_id(m_id);
		System.out.println("m_id = " + m_id);
		System.out.println("vo : " + vo);
		List<ProfileImageVO> profileImageList = profileImageService.getProfileImageList(m_id);
		System.out.println("list : " + profileImageList);
		session.setAttribute("profileImageList", profileImageList);
		return "/views/profile/ProfileImageList.jsp";
	}

	@RequestMapping(value="deleteHostImage.do", method=RequestMethod.POST)
	public String deleteHostImagePost(HostImageVO vo, @RequestParam("m_id") String m_id, @RequestParam("h_route") String h_route) {
		vo.setM_id(m_id);
		vo.setH_route(h_route);
		hostImageService.deleteHostImage(vo);
		return "HostImageList.do";
	}
	@RequestMapping(value="deleteHostImage.do", method=RequestMethod.GET)
	public String deleteHostImageGet(HostImageVO vo, @RequestParam("m_id") String m_id, @RequestParam("h_route") String h_route) {
		vo.setM_id(m_id);
		vo.setH_route(h_route);
		hostImageService.deleteHostImage(vo);
		return "HostImageList.do";
	}
	
	@RequestMapping(value="deleteProfileImage.do", method=RequestMethod.POST) 
	public String deleteProfileImage(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id, @RequestParam("p_route") String p_route) {
		System.out.println("컨트롤러 딜리트 포스트");
		vo.setM_id(m_id);
		vo.setP_route(p_route);
		profileImageService.deleteProfileImage(vo);
		
		return "profileImageList.do";
	}
	@RequestMapping(value="deleteProfileImage.do", method=RequestMethod.GET) 
	public String deleteProfileImageGet(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id, @RequestParam("p_route") String p_route) {
		System.out.println("컨트롤러 딜리트 겟");
		vo.setM_id(m_id);
		vo.setP_route(p_route);
		profileImageService.deleteProfileImage(vo);
		
		System.out.println("컨트롤러 옴");
		return "profileImageList.do";
	}
	@RequestMapping(value="updateMainProfileImage.do", method=RequestMethod.POST)
	public String updateMainProfileImage(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
		vo.setM_id(m_id);
		profileImageService.mainProfileImageInit(vo);
		return "updateMainProfileImage2.do";
	}
	@RequestMapping(value="updateMainProfileImage2.do", method=RequestMethod.POST) 
	public String updateProfileImage2(ProfileImageVO vo, ProfileVO profileVO, HttpSession session, @RequestParam("m_id") String m_id, @RequestParam("p_route") String p_route) {
		
		vo.setM_id(m_id);
		vo.setP_route(p_route);
		profileImageService.updateMainProfileImage(vo);
		
		ProfileVO vo2 = profileService.getProfile2(profileVO, session);
		vo2.setP_route(p_route);
		
		session.setAttribute("profile", vo2);
		return "profileImageList.do";
	}
	@RequestMapping(value="updateMainHostImage.do", method=RequestMethod.POST)
	public String updateMainHostImage(HostImageVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
		vo.setM_id(m_id);
		hostImageService.mainHostImageInit(vo);
		return "updateMainHostImage2.do";
	}
	
	@RequestMapping(value="updateMainHostImage2.do", method=RequestMethod.POST)
	public String updateMainHostImage2(HostImageVO vo, HttpSession session, @RequestParam("m_id") String m_id, @RequestParam("h_route") String h_route) {
		vo.setM_id(m_id);
		vo.setH_route(h_route);
		hostImageService.updateMainHostImage(vo);
		HostImageVO hostImageVO2 = hostImageService.getHostImage(vo);
		hostImageVO2.setH_route(h_route);
		
		session.setAttribute("hostImg", hostImageVO2);
		return "HostImageList.do";
	}
	
	
	@RequestMapping(value="profileImageInsert.do", method=RequestMethod.GET)
	public String ProfileImageInsert() {
		System.out.println("프로필이미지인서트");
		return "/views/profile/ProfileImageInsert.jsp";
	}
	
	@RequestMapping(value="uploadProfileImg.do", method=RequestMethod.POST)
	public String uploadProfileImg(MemberVO vo,HttpSession session, ProfileVO profilevo, @RequestParam("profileImg") MultipartFile profileImg, @RequestParam("m_id") String m_id) {
		
		String url = fileUploadService.fileUpload(profileImg);
		String path = session.getServletContext().getRealPath("/");
		System.out.println(path);
		
		int profileMainCnt = ProfileImageMainCount(m_id);
		String p_main = "0";
		
		Map<String, String> profileImageMap = new HashMap<String, String>();
		profileImageMap.put("m_id", m_id);
		profileImageMap.put("p_route", url);
		
		if(profileMainCnt > 0) {
			profileImageMap.put("p_main", p_main);
			profileImageService.ProfileImageInsert(profileImageMap);
			ProfileVO profileVO2 = profileService.getProfile2(profilevo, session);
			profilevo.setM_id(vo.getM_id());
			session.setAttribute("profile", profileVO2);
		} else {
			p_main = "1";
			profileImageMap.put("p_main", p_main);
			profileImageService.ProfileImageInsert(profileImageMap);
			ProfileVO profileVO2 = profileService.getProfile2(profilevo, session);
			profilevo.setM_id(vo.getM_id());
			session.setAttribute("profile", profileVO2);
		}
		
		return "redirect:/sub2.do";
	}
	
	
	private int ProfileImageMainCount(String m_id) {
		int result = 0;
		
		result = profileImageService.ProfileImageMainCount(m_id);
		
		return result;
	}
	
	/* ========================================================================================================== */
	
	@RequestMapping(value="uploadHostImg.do", method=RequestMethod.POST)
	public String uploadHostImg(MemberVO vo, HostImageVO hostimageVO, HttpSession session, @RequestParam("uploadHostImg") MultipartFile hostImg, @RequestParam("m_id") String m_id) {
		
		String url = fileUploadService.fileUpload(hostImg);
		
		int hostMainCnt = hostMainCnt(m_id);
		String h_main = "0";
		
		Map<String, String> hostImageMap = new HashMap<String, String>();
		hostImageMap.put("h_route", url);
		hostImageMap.put("m_id", m_id);
		
		if(hostMainCnt > 0) {
			hostImageMap.put("h_main", h_main);
			profileImageService.HostImageInsert(hostImageMap);
			hostimageVO.setM_id(vo.getM_id());
			HostImageVO hostimageVO2 = hostImageService.getHostImage(hostimageVO);
			session.setAttribute("hostImg", hostimageVO2);
		} else {
			h_main = "1";
			hostImageMap.put("h_main", h_main);
			profileImageService.HostImageInsert(hostImageMap);
			hostimageVO.setM_id(vo.getM_id());
			HostImageVO hostimageVO2 = hostImageService.getHostImage(hostimageVO);
			session.setAttribute("hostImg", hostimageVO2);
		}
		
		return "redirect:/sub2.do";
	}
	
	private int hostMainCnt(String m_id) {
		int result = 0;
		
		result = profileImageService.HostImageMainCount(m_id);
		
		return result;
	}
}
