package com.spring.view.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.admin.AdminCntVO;
import com.spring.biz.admin.AdminService;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.UserAdminViewVO;
import com.spring.biz.event.EventVO;
import com.spring.biz.member.Email;
import com.spring.biz.member.EmailSender;
import com.spring.biz.member.MemberVO;
import com.spring.biz.message.MessageRecieveVO;
import com.spring.biz.message.MessageService;
import com.spring.biz.profileImage.FileUploadService;
import com.spring.biz.profileImage.ProfileImageVO;

@Controller
@SessionAttributes({"userAdminList", "userAdminViewVO", "userAdminPostList", "userAdminCommentList", "userAdminImageSelect", "eventAdminList", "adminCnt"})
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private Email email;
	@Autowired
	private EmailSender emailSender;
	
	public AdminController() {
		System.out.println("AdminController로 옴");
	}
	
	@RequestMapping(value="/Admin.do")
	public String AdminMain(HttpServletRequest request, Model model) {
		System.out.println("AdminController의 사이트 조회수 누적 메소드");
		
		AdminCntVO adminCnt = adminService.adminCnt();
		
		model.addAttribute("adminCnt", adminCnt);
		
		return "redirect:/views/admin/testAdmin.jsp";
	}
	
	@RequestMapping(value="/logVisit.do", method=RequestMethod.GET)
	public String LogVisit(HttpServletRequest request) {
		System.out.println("AdminController의 사이트 조회수 누적 메소드");
		
		String lv_ip = request.getParameter("lv_ip");
		String lv_country = request.getParameter("lv_country");
		String lv_browser = request.getParameter("lv_browser");
		
		Map<String, String> lvMap = new HashMap<String, String>();
		lvMap.put("lv_ip", lv_ip);
		lvMap.put("lv_country", lv_country);
		lvMap.put("lv_browser", lv_browser);
		
		System.out.println("ip: " + lv_ip);
		System.out.println("country: " + lv_country);
		System.out.println("browser: " + lv_browser);
		
		adminService.logVisit(lvMap);
		
		return "redirect:/views/test.jsp";
	}
	
	@RequestMapping(value="/logLogin.do", method=RequestMethod.GET)
	public String LogLogin(HttpServletRequest request) {
		System.out.println("AdminController의 로그인 로그 메소드");
		
		String ll_id = request.getParameter("ll_id");
		String ll_ip = request.getParameter("ll_ip");
		String ll_country = request.getParameter("ll_country");
		String ll_device = request.getParameter("ll_device");
		String ll_result = request.getParameter("ll_result");
		
		Map<String, String> llMap = new HashMap<String, String>();
		llMap.put("ll_id", ll_id);
		llMap.put("ll_ip", ll_ip);
		llMap.put("ll_country", ll_country);
		llMap.put("ll_device", ll_device);
		llMap.put("ll_result", ll_result);
		
		
		adminService.logLogin(llMap);
		
		return "redirect:/loginMember.do";
	}
	
	@RequestMapping(value="/userAdmin.do")
	public String userAdminList(Model model) {
		List<MemberVO> list = null;
		
		list = adminService.userAdminList();
		
		model.addAttribute("userAdminList", list);
		return "redirect:/views/admin/pages/tables/userAdmin.jsp";
	}
	
	@RequestMapping(value="/adminGetReceiveMessageList.do")
	public String getAdminGetReceiveMessageList(MessageRecieveVO vo, HttpSession session) {
			vo.setReceive_receiver("admin");
			System.out.println("메세지리스트 컨트롤러 옴");
			System.out.println(vo.getReceive_receiver());
			List<MessageRecieveVO> messageList = messageService.getAdminReceiveMessageList(vo);
			session.setAttribute("adminMessageList", messageList);
		return "redirect:/views/admin/pages/tables/messageAdmin.jsp";	
	}
	@RequestMapping(value="/adminMessageGet.do")
	public String adminMessageGet(MessageRecieveVO vo,  Model model, HttpSession session, @RequestParam("receive_idx") int receive_idx) {
		session.setAttribute("adminMessage", messageService.getReceiveMessage(vo));
		vo.setReceive_idx(receive_idx);
		messageService.readRecieveMessage(vo);
			
		return "redirect:/views/admin/pages/tables/adminMessageGet.jsp";
	}
	
	@RequestMapping(value="/adminSendEmail.do", method=RequestMethod.POST)
    public String sendEmailFindId (@RequestParam("message_receiver") String message_receiver
    		, @RequestParam("message_title") String message_title, 
    		@RequestParam("message_content") String message_content) throws Exception {
    	
    		email.setSubject(message_title);
    		email.setReceiver(message_receiver);
    		email.setContent(message_content);
    		emailSender.SendEmail(email);
            return "redirect:/adminGetReceiveMessageList.do";
    	}
	
	@RequestMapping(value="/userAdminView.do")
	public String userAdminView(Model model, HttpServletRequest request) {
		UserAdminViewVO uvo = null;
		
		List<UserAdminPostVO> uplist = null;
		List<UserAdminCommentVO> upclist = null;
		
		String m_id = request.getParameter("m_id");
		
		uvo = adminService.userAdminView(m_id);
		uplist = adminService.userAdminPostList(m_id);
		upclist = adminService.userAdminCommentList(m_id);
		
		model.addAttribute("userAdminViewVO", uvo);
		model.addAttribute("userAdminPostList", uplist);
		model.addAttribute("userAdminCommentList", upclist);
		
		return "redirect:/views/admin/pages/examples/userAdminView.jsp";
	}
	
	@RequestMapping(value="/eventAdmin.do")
	public String eventAdminList(Model model) {
		List<EventVO> list = null;
		
		list = adminService.eventAdminList();
		
		model.addAttribute("eventAdminList", list);
		return "redirect:/views/admin/pages/tables/eventAdmin.jsp";
	}
	
	@RequestMapping(value="/insertEvent.do", method=RequestMethod.GET)
	public String insertEvent(Model model) {
		
		return "redirect:/views/admin/insertEvent.jsp";
	}
	
	@RequestMapping(value="/insertEvent.do", method=RequestMethod.POST)
	public String insertEventPost(Model model,
			@RequestParam("e_name") String e_name,
			@RequestParam("e_content") String e_content,
			@RequestParam("e_startdate") String e_startdate,
			@RequestParam("e_enddate") String e_enddate,
			@RequestParam("e_address") String e_address,
			@RequestParam("lat") String lat,
			@RequestParam("lng") String lng,
			@RequestParam("e_region") String e_region,
			@RequestParam(value="e_tag", required=false) String e_tag,
			@RequestParam(value="file1", required=false) MultipartFile e_img1,
			@RequestParam(value="file2", required=false) MultipartFile e_img2,
			@RequestParam(value="file3", required=false) MultipartFile e_img3,
			@RequestParam(value="file4", required=false) MultipartFile e_img4,
			@RequestParam(value="file5", required=false) MultipartFile e_img5,
			@RequestParam(value="file6", required=false) MultipartFile e_img6,
			@RequestParam(value="file7", required=false) MultipartFile e_img7,
			@RequestParam(value="file8", required=false) MultipartFile e_img8,
			@RequestParam(value="file9", required=false) MultipartFile e_img9,
			@RequestParam(value="file10", required=false) MultipartFile e_img10) throws ParseException {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = transFormat.parse(e_startdate);
		Date enddate = transFormat.parse(e_enddate);
		
		System.out.println("e_name: " + e_name);
		System.out.println("e_content: " + e_content);
		System.out.println("startdate: " + startdate);
		System.out.println("enddate: " + enddate);
		System.out.println("e_address: " + e_address);
		System.out.println("lat: " + lat);
		System.out.println("lng: " + lng);
		System.out.println("e_region: " + e_region);
		System.out.println("e_tag: " + e_tag);
		
		EventVO eventVO = new EventVO();
		eventVO.setE_name(e_name);
		eventVO.setE_content(e_content);
		eventVO.setE_startdate(startdate);
		eventVO.setE_enddate(enddate);
		eventVO.setE_address(e_address);
		eventVO.setLat(Double.parseDouble(lat));
		eventVO.setLng(Double.parseDouble(lng));
		eventVO.setE_region(e_region);
		eventVO.setE_tag(e_tag);
		
		adminService.insertEvent(eventVO);
		
		if(e_img1 != null) {
			String url = fileUploadService.fileUpload(e_img1);
			System.out.println("url: " + url);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "1");
			System.out.println("eventImgMap: " + eventImgMap);
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img2 != null) {
			String url = fileUploadService.fileUpload(e_img2);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "2");
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img3 != null) {
			System.out.println("싴발e_img3: " + e_img3);
			String url = fileUploadService.fileUpload(e_img3);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "3");
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img4 != null) {
			String url = fileUploadService.fileUpload(e_img4);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "4");
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img5 != null) {
			String url = fileUploadService.fileUpload(e_img5);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "5");
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img6 != null) {
			String url = fileUploadService.fileUpload(e_img6);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "6");
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img7 != null) {
			String url = fileUploadService.fileUpload(e_img7);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "7");
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img8 != null) {
			String url = fileUploadService.fileUpload(e_img8);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "8");
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img9 != null) {
			String url = fileUploadService.fileUpload(e_img9);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "9");
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img10 != null) {
			String url = fileUploadService.fileUpload(e_img10);
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "10");
			adminService.insertEventImg(eventImgMap);
		}
		
		return "redirect:/eventAdmin.do";
	}
}
