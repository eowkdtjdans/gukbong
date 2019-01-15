package com.spring.biz.eventImage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.event.impl.EventDAO;
import com.spring.biz.eventImage.EventImageService;
import com.spring.biz.eventImage.EventImageVO;

@Service("eventImageService")
public class EventImageServiceImpl implements EventImageService {
	@Autowired
	private EventImageDAO eventImageDAO;

	@Override
	public List<EventImageVO> getEventImageList(int e_idx) {
		return eventImageDAO.getEventImageList(e_idx);
	}
	
}
