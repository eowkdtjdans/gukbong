package com.spring.biz.travelers;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.view.controller.TravelersController;

public class TravelersSerivceClient {

	public static void main(String[] args) {
		AbstractApplicationContext container
			= new GenericXmlApplicationContext("applicationContext.xml");
		
		
		TravelersService travelersService = (TravelersService) container.getBean("travelersService");
		
		List<TravelersVO> list = travelersService.getTravelersList("SeOul");
		
		for(TravelersVO vo : list) {
			System.out.println("============================================================");
			System.out.println("--" + vo.getM_id() + "--");
			System.out.println("Visiting: " + vo.getT_country());
			System.out.println(vo.getT_sleepingnumber() + "days " + vo.getT_dateofvisit() + " " + vo.getT_visits() + "people");
			System.out.println(vo.getT_motive());
			System.out.println("============================================================");
		}
		
		TravelersController con = new TravelersController();
	}

}
