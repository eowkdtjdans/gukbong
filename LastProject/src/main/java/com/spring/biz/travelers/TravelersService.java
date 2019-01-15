package com.spring.biz.travelers;

import java.util.List;
import java.util.Map;

import com.spring.biz.profile.ProfileVO;

public interface TravelersService {

	List<TravelersVO> getTravelersList(Map<String, Object> map);
	
	int countTravelers (String key);
	
	TravelersVO getTravelers(String m_id);

	int checkTravelersJson(ProfileVO vo);

	void insertTravelers(TravelersVO vo);

	void updateTravelers(TravelersVO vo);

	void deleteTravelers(String m_id);
}
