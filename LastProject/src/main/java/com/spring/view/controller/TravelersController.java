package com.spring.view.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.host.HostVO;
import com.spring.biz.profile.ProfileVO;
import com.spring.biz.travelers.TravelersService;
import com.spring.biz.travelers.TravelersVO;
import com.spring.pagination.PagingVO;

@Controller
@SessionAttributes({"key","cPage"})
public class TravelersController {
	@Autowired
	private TravelersService travelersService;
	
	public TravelersController() {
		System.out.println("TravelersController 실행");
	}
	
	@RequestMapping(value="/getTravelersList.do", method=RequestMethod.POST)
	public String getTravelersList(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage) {
		System.out.println(">> 글목록 조회 처리(getTravelersList) - POST");
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(5);
		p.setPagePerBlock(5);
		int countTravelers = travelersService.countTravelers(key);
		p.setTotalRecord(countTravelers);
		p.setTotalPage();
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
				
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("key", key);
		
		List<TravelersVO> travelersList = travelersService.getTravelersList(map);
		System.out.println("travelersList: " + travelersList);
		
		model.addAttribute("travelersList", travelersList);
		model.addAttribute("countTravelers", countTravelers);
		model.addAttribute("pvo", p);
		
		model.addAttribute("cPage", cPage);
		
		return "/views/travelers/Travelers.jsp";
	}
	
	@RequestMapping(value="/getTravelersList.do", method=RequestMethod.GET)
	public String getTravelersList2(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage) {
		System.out.println(">> 글목록 조회 처리(getTravelersList) - GET");

		PagingVO p = new PagingVO();
		p.setNumPerPage(5);
		p.setPagePerBlock(5);
		int countTravelers = travelersService.countTravelers(key);
		System.out.println("countTravelers : " + countTravelers);
		
		p.setTotalRecord(countTravelers);
		p.setTotalPage();
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
				
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("key", key);
		
		System.out.println("p.getBegin() : " + p.getBegin());
		System.out.println("p.getEnd() :" +p.getEnd());
		System.out.println("key : " + key);
		
		
		List<TravelersVO> travelersList = travelersService.getTravelersList(map);
		System.out.println("travelersList : " + travelersList);
		
		model.addAttribute("travelersList", travelersList);
		model.addAttribute("countTravelers", countTravelers);
		model.addAttribute("pvo", p);
		
		model.addAttribute("cPage", cPage);
		
		return "/views/travelers/Travelers.jsp";
	}
	
	
	@RequestMapping(value="/travelersGetInfo.do", method=RequestMethod.GET)
	public String travelersGetInfo(@RequestParam("m_id") String m_id, Model model, TravelersVO vo) {
		System.out.println("travelersGetInfo.do로 이동");
		System.out.println("m_id : " + m_id);
		
		TravelersVO getTravelers = travelersService.getTravelers(m_id);
		System.out.println("getTravelers : " + getTravelers);
		model.addAttribute("getTravelers", getTravelers);
		
		return "/views/travelers/getTravelers.jsp";
	}
	
	//트레블러 게시판 글 작성 유무 확인
	@RequestMapping(value="/checkTravelersJson.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> insertMessageJson(ProfileVO vo) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = travelersService.checkTravelersJson(vo);
		map.put("cnt", count);
		
		return map;
	}
	
	
	//호스트 게시판 글 작성
	@RequestMapping(value="insertTravelers.do", method=RequestMethod.POST)
	public String insertTravelers(TravelersVO vo, HttpSession session, 
		@RequestParam("m_id") String m_id, @RequestParam("t_visits") int t_visits, 
		@RequestParam("t_motive") String t_motive, @RequestParam("t_country") String t_country,
		@RequestParam("t_startdate") Date t_startdate, @RequestParam("t_enddate") Date t_enddate) {
		System.out.println("insertTravelers ==== POST");
		System.out.println("vo :" + vo);
		vo.setM_id(m_id);
		vo.setT_visits(t_visits);
		vo.setT_motive(t_motive);
		vo.setT_country(t_country);
		vo.setT_startdate(t_startdate);
		vo.setT_enddate(t_enddate);
		
		travelersService.insertTravelers(vo);
		session.setAttribute("travelers", vo);
		return "redirect:/getTravelersList.do";
	}
	
	@RequestMapping(value="updateTravelers.do", method=RequestMethod.POST)
	public String updateTravelers(TravelersVO vo, HttpSession session, 
		@RequestParam("m_id") String m_id, @RequestParam("t_visits") int t_visits, 
		@RequestParam("t_motive") String t_motive, @RequestParam("t_country") String t_country,
		@RequestParam("t_startdate") Date t_startdate, @RequestParam("t_enddate") Date t_enddate) {
		System.out.println("insertTravelers ==== POST");
		System.out.println("vo :" + vo);
		vo.setM_id(m_id);
		vo.setT_visits(t_visits);
		vo.setT_motive(t_motive);
		vo.setT_country(t_country);
		vo.setT_startdate(t_startdate);
		vo.setT_enddate(t_enddate);
		
		travelersService.updateTravelers(vo);
		session.setAttribute("travelers", vo);
		return "redirect:/getTravelersList.do";
	}
	
	@RequestMapping(value="deleteTravelers.do", method=RequestMethod.GET)
	public String deleteTravelers(HttpSession session, @RequestParam("m_id") String m_id) {
		
		travelersService.deleteTravelers(m_id);
		
		return "redirect:/getTravelersList.do";
	}
	
	
	
	
	
	
	
	
	
}
