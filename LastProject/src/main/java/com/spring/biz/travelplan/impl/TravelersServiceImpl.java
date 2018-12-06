package com.spring.biz.travelplan.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.Travelers.TravelersService;
import com.spring.biz.Travelers.TravelersVO;

@Service("travelersService")
public class TravelersServiceImpl implements TravelersService{
	@Autowired
	private TravelersDAO travelersDAO;
	
	public TravelersServiceImpl() {
		System.out.println("TravelersServiceImpl 객체 생성");
	}

	@Override
	public List<TravelersVO> getTravelersList(String key) {
		return travelersDAO.getTravelersList(key);
	}

}
