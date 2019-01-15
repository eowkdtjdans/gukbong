package com.spring.biz.travelers.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.profile.ProfileVO;
import com.spring.biz.travelers.TravelersService;
import com.spring.biz.travelers.TravelersVO;

@Service("travelersService")
public class TravelersServiceImpl implements TravelersService{
	@Autowired
	private TravelersDAO travelersDAO;
	
	public TravelersServiceImpl() {
		System.out.println("TravelersServiceImpl 객체 생성");
	}

   @Override
   public List<TravelersVO> getTravelersList(Map<String, Object> map) {
      return travelersDAO.getTravelersList(map);
   }

@Override
public int countTravelers(String key) {
	return travelersDAO.countTravelers(key);
}

@Override
public TravelersVO getTravelers(String m_id) {
	return travelersDAO.getTravelers(m_id);
}

@Override
public int checkTravelersJson(ProfileVO vo) {
	return travelersDAO.checkTravelersJson(vo);
}

@Override
public void insertTravelers(TravelersVO vo) {
	travelersDAO.insertTravelers(vo);
}

@Override
public void updateTravelers(TravelersVO vo) {
	travelersDAO.updateTravelers(vo);
}

@Override
public void deleteTravelers(String m_id) {
	travelersDAO.deleteTravelers(m_id);
	
}

}