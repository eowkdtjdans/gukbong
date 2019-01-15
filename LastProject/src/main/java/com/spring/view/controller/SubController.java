package com.spring.view.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.event.EventService;
import com.spring.biz.event.EventVO;

@Controller
@SessionAttributes({"key", "searchCondition", "firstLat", "firstLng"})
public class SubController {
	@Autowired
	private EventService eventService;
	HttpSession session;
	
	@RequestMapping("/sub.do")
	public String moveController(@RequestParam("searchCondition") String searchCondition, @RequestParam("searchKeyword") String searchKeyword, @RequestParam("lat") String lat, @RequestParam("lng") String lng, Model model) {
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchKeyword : " + searchKeyword);
		String path = null;
		
		if(searchCondition.equals("find_travler")) {
			path = "redirect:/getTravelersList.do?cPage=1";
		} else if(searchCondition.equals("find_host")) {
			System.out.println("host");
			path = "redirect:/getHostList.do?cPage=1";
		} else if(searchCondition.equals("find_event")) {
			path = "redirect:/getEventList.do?cPage=1";
		} else if(searchCondition.equals("find_advice")) {
			System.out.println("/getLocalAdviceList.do?cPage=1");
			path = "redirect:/getLocalAdviceList2.do?cPage=1";	
		}
		
		model.addAttribute("firstLat", lat);
		model.addAttribute("firstLng", lng);
		model.addAttribute("key", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);
		return path;
	}
	

	
	
	@RequestMapping(value="/sub2.do", method=RequestMethod.GET)
	public String moveController(Model model) {
		System.out.println("sub2.do === get방식");
		List<EventVO> eventList =  eventService.EventList();
		System.out.println("eventList : " + eventList);
		model.addAttribute("eventList", eventList);
			
		List<EventVO> selectRegionAsia = eventService.selectRegionAsia();
		model.addAttribute("selectRegionAsia", selectRegionAsia);
		
		List<EventVO> selectRegionEurope = eventService.selectRegionEurope();
		model.addAttribute("selectRegionEurope", selectRegionEurope);
		
		List<EventVO> selectRegionNorthAmerica = eventService.selectRegionNorthAmerica();
		model.addAttribute("selectRegionNorthAmerica", selectRegionNorthAmerica);
		
		List<EventVO> selectRegionOceania = eventService.selectRegionOceania();
		model.addAttribute("selectRegionOceania", selectRegionOceania);
		
		List<EventVO> selectRegionSouthAmerica = eventService.selectRegionSouthAmerica();
		model.addAttribute("selectRegionSouthAmerica", selectRegionSouthAmerica);			
		
		return "views/sub.jsp";
	}
	

	
	@RequestMapping(value="/selectRegion.do" ,method=RequestMethod.POST)
    @ResponseBody
    public List<EventVO> selectRegion(@RequestBody String e_region, Model model) {
	    System.out.println("region = 아시아");
	    System.out.println("e_region : " + e_region);
	    	    
	    List<EventVO> selectRegion = eventService.selectRegion(e_region);
	    System.out.println("selectRegion : " + selectRegion);
	    model.addAttribute("selectRegion", selectRegion);	    
	    
	    System.out.println("마지막부분");
	    return selectRegion;
    }
	
}












