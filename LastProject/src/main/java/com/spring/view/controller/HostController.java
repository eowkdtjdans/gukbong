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

import com.spring.biz.host.HostService;
import com.spring.biz.host.HostVO;
import com.spring.biz.profile.ProfileVO;
import com.spring.pagination.PagingVO;

@Controller
@SessionAttributes({"key", "cPage"})
public class HostController {
	@Autowired
	private HostService hostService;
	
	public HostController() {
		System.out.println("HostController 실행");
	}
	//호스트 게시판 글 작성 유무 확인
	@RequestMapping(value="/checkHostJson.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> insertMessageJson(ProfileVO vo) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = hostService.checkHostJson(vo);
		map.put("cnt", count);
		
		return map;
	}  
	
	//호스트 게시판 글 작성
	@RequestMapping(value="insertHost.do", method=RequestMethod.POST)
	public String insertHostPost(HostVO vo, HttpSession session, 
			@RequestParam("m_id") String m_id, @RequestParam("h_maximumguest") String h_maximumguest, 
			@RequestParam("h_gender") String h_gender, @RequestParam("h_smoke") String h_smoke, 
			@RequestParam("h_roomtype") String h_roomtype, @RequestParam("h_rule") String h_rule, 
			@RequestParam("h_startdate") Date h_startdate , @RequestParam("h_haspet") String h_haspet, 
			@RequestParam("h_haschild") String h_haschild, @RequestParam("h_enddate") Date h_enddate) {
		System.out.println("insertHost ==== POST");
		System.out.println("vo :" + vo);
		vo.setH_enddate(h_enddate);
		vo.setH_gender(h_gender);
		vo.setH_haschild(h_haschild);
		vo.setH_haspet(h_haspet);
		vo.setH_maximumguest(h_maximumguest);
		vo.setH_roomtype(h_roomtype);
		vo.setH_rule(h_rule);
		vo.setH_smoke(h_smoke);
		vo.setH_startdate(h_startdate);
		vo.setM_id(m_id);
		hostService.insertHost(vo);
		session.setAttribute("host", vo);
		return "redirect:/getHostList.do";
	}
	@RequestMapping(value="updateHost.do", method=RequestMethod.POST)
	public String updateHostPost(HostVO vo, HttpSession session, 
			@RequestParam("m_id") String m_id, @RequestParam("h_maximumguest") String h_maximumguest, 
			@RequestParam("h_gender") String h_gender, @RequestParam("h_smoke") String h_smoke, 
			@RequestParam("h_roomtype") String h_roomtype, @RequestParam("h_rule") String h_rule, 
			@RequestParam("h_startdate") Date h_startdate , @RequestParam("h_haspet") String h_haspet, 
			@RequestParam("h_haschild") String h_haschild, @RequestParam("h_enddate") Date h_enddate) {
		System.out.println("updateHost ==== POST");
		System.out.println("vo :" + vo);
		vo.setH_enddate(h_enddate);
		vo.setH_gender(h_gender);
		vo.setH_haschild(h_haschild);
		vo.setH_haspet(h_haspet);
		vo.setH_maximumguest(h_maximumguest);
		vo.setH_roomtype(h_roomtype);
		vo.setH_rule(h_rule);
		vo.setH_smoke(h_smoke);
		vo.setH_startdate(h_startdate);
		vo.setM_id(m_id);
		hostService.updateHost(vo);
		session.setAttribute("host", vo);
		return "redirect:/getHostList.do";
	}
	
	@RequestMapping(value="deleteHost.do", method=RequestMethod.GET)
	public String deleteHostPost(HttpSession session, @RequestParam("m_id") String m_id) {
		hostService.deleteHost(m_id);
		
		return "redirect:/getHostList.do";
	}
	
	//만들어만놓은거
	@RequestMapping(value="hostGetInfo.do", method=RequestMethod.GET)
	public String hostGetInfo(HostVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
		System.out.println(m_id);
		//hostService.getHostInfo(vo);
		return "views/host/getHost.jsp";
	}
	
	@RequestMapping(value="/getHostList.do", method=RequestMethod.POST)
	public String getTravelersList(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage, HttpSession session) {
		System.out.println(">> 글목록 조회 처리(getHostList) - POST");
		System.out.println("key: " + key);
		System.out.println("cPage : " + cPage);
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(5);
		p.setPagePerBlock(5);
		int countHost = hostService.countHost(key);
		System.out.println("countHost : " + countHost);
		p.setTotalRecord(countHost);
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
		
		List<HostVO> hostList = hostService.getHostList(map);
		System.out.println("hostList: " + hostList);
		
		model.addAttribute("hostList", hostList);
		model.addAttribute("countHost", countHost);
		model.addAttribute("pvo", p);
		
		session.setAttribute("cPage", cPage);
		
		return "views/host/HostList.jsp";
	}
	
	@RequestMapping(value="/getHostList.do", method=RequestMethod.GET)
	public String getTravelersList2(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage, HttpSession session) {
		System.out.println(">> 글목록 조회 처리(getHostList) - POST");
		System.out.println("key : " + key);
		System.out.println("cPage : " + cPage);
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(5);
		p.setPagePerBlock(5);
		int countHost = hostService.countHost(key);
		System.out.println("countHost : " + countHost);
		p.setTotalRecord(countHost);
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
		
		List<HostVO> hostList = hostService.getHostList(map);
		System.out.println("hostList: " + hostList);
		
		model.addAttribute("hostList", hostList);
		model.addAttribute("countHost", countHost);
		model.addAttribute("pvo", p);
		
		session.setAttribute("cPage", cPage);
		
		return "views/host/HostList.jsp";
	}
}
