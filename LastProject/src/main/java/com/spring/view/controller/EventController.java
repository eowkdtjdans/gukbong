package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.event.EventService;
import com.spring.biz.event.EventVO;
import com.spring.biz.eventComment.EventCommentService;
import com.spring.biz.eventComment.EventCommentVO;
import com.spring.biz.eventImage.EventImageService;
import com.spring.biz.eventImage.EventImageVO;
import com.spring.pagination.PagingVO;

@Controller
@SessionAttributes({"key", "cPage"})
public class EventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private EventCommentService eventCommentService;
	@Autowired
	private EventImageService eventImageService;
	
	
	public EventController() {
		System.out.println("Reach EventController!");
	}
	
	@RequestMapping(value = "/getEventList.do", method=RequestMethod.POST)
	public String getEventList (Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage) {
		System.out.println("getEventList() 실행 === POST");
		System.out.println("cPage : " + cPage);
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(10);
		p.setPagePerBlock(10);
		int countEvent = eventService.countEvent(key);
		System.out.println("countEvent : " + countEvent);
		p.setTotalRecord(countEvent);
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
		System.out.println("EventController Map: " + map);
		
		List<EventVO> eventList = eventService.getEventList(map);
		System.out.println("eventList : " + eventList);
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("countEvent", countEvent);
		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		
		return "/views/event/EventList.jsp";
	}
	
	@RequestMapping(value = "/getEventList.do", method=RequestMethod.GET)
	public String getEventList2 (Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage) {
		System.out.println("getEventList() 실행 === GET");
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(10);
		p.setPagePerBlock(3);
		int countEvent = eventService.countEvent(key);
		p.setTotalRecord(countEvent);
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
		
		List<EventVO> eventList = eventService.getEventList(map);
		System.out.println("eventList");
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("countEvent", countEvent);
		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		
		return "/views/event/EventList.jsp";
	}
	
	
	@RequestMapping(value = "/getEvent.do")
	public String getEvent(@RequestParam("e_idx") int e_idx, Model model) {
		System.out.println("event 상세페이지");
		System.out.println("e_idx : " + e_idx);
		eventService.upreviewcount(e_idx);
		
		EventVO getEvent = eventService.getEvent(e_idx);
		System.out.println("getEvent : " + getEvent);
		
		List<EventImageVO> getEventImageList = eventImageService.getEventImageList(e_idx);
		System.out.println("getEventImageList : " + getEventImageList);
		System.out.println(getEventImageList.get(0));
		
		List<EventCommentVO> getEventCommentList = eventCommentService.getEventCommentList(e_idx);
		System.out.println("getEventCommentList : " + getEventCommentList);
		
		model.addAttribute("getEvent", getEvent);
		model.addAttribute("getEventImageList", getEventImageList);
		model.addAttribute("getEventImageList0", getEventImageList.get(0));
		model.addAttribute("getEventCommentList", getEventCommentList);
		
		return "/views/event/getEvent.jsp";				
	}
	
	
	//좋아요기능(+)
	@RequestMapping(value="/goodEventJson.do" ,method=RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> goodEventJson(@RequestBody String e_idx) {
	    System.out.println("ajax로 good컨트롤");
	    System.out.println("e_idx : " + e_idx);
	    
	    int count = eventService.goodEvent(Integer.parseInt(e_idx));
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("count", count);
	    System.out.println("마지막부분");
	    return map;
    }
	
	//좋아요기능(-)
	@RequestMapping(value="/badEventJson.do" ,method=RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> badEventJson(@RequestBody String e_idx) {
	    System.out.println("ajax로 bad컨트롤");
	    System.out.println("e_idx : " + e_idx);
	    
	    int count = eventService.badEvent(Integer.parseInt(e_idx));
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("count", count);
	    System.out.println("마지막부분");
	    return map;
    }
	
	
	//댓글 수정ajax
	@RequestMapping(value="/updateEventComment.do" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> updateEventComment(@RequestBody String ec_idx, @RequestParam("ec_content") String ec_content, EventCommentVO vo){
		System.out.println("댓글 수정 ajax");
		System.out.println("ec_idx : " + ec_idx);
		System.out.println("ec_content : " + ec_content);
		vo.setEc_idx(Integer.parseInt(ec_idx));
		
		vo.setEc_content(ec_content);
		eventCommentService.updateEventComment(vo);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("ec_idx", ec_idx);
		map.put("ec_content", ec_content);
		
		return map;
	}
	
	
	@RequestMapping(value="/deleteEventComment.do" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> deleteEventComment(@RequestBody String ec_idx, @RequestParam("e_idx") String e_idx){
		//댓글이 삭제되면 댓글수 1감소
		eventService.downdet(Integer.parseInt(e_idx));
		
		System.out.println("댓글 삭제 ajax");
		System.out.println("ec_idx : " + ec_idx);
		
		eventCommentService.deleteEventComment(Integer.parseInt(ec_idx));
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("ec_idx", ec_idx);
		return map;
	}
	
	@RequestMapping(value="/insertEventComment.do" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> insertEventComment(@RequestBody String ec_content, @RequestParam("e_idx") String e_idx, HttpSession session, EventCommentVO vo){
		//댓글이 입력되면 댓글수 1증가
		eventService.updet(Integer.parseInt(e_idx));
		
		String m_id = (String)session.getAttribute("m_id");
		System.out.println("현재 로그인한 m_id : " + m_id);
		System.out.println("댓글 입력 ajax");
		System.out.println("ec_content : " + ec_content);
		System.out.println("e_idx : " + e_idx);
		
		vo.setM_id(m_id);
		vo.setE_idx(Integer.parseInt(e_idx));
		vo.setEc_content(ec_content);
		eventCommentService.insertEventComment(vo);
		
		EventCommentVO getEventComment = eventCommentService.getEventComment(vo);
		System.out.println("댓글입력시 나올 : " + getEventComment);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("m_id", m_id);
		map.put("ec_content", ec_content);
		map.put("e_idx", e_idx);
		map.put("getEventComment", getEventComment);
		
		return map;
	}

}











