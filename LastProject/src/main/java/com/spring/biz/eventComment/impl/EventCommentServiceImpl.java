package com.spring.biz.eventComment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.event.impl.EventDAO;
import com.spring.biz.eventComment.EventCommentService;
import com.spring.biz.eventComment.EventCommentVO;

@Service("eventCommentService")
public class EventCommentServiceImpl implements EventCommentService {
	@Autowired
	private EventCommentDAO eventCommentDAO;

	@Override
	public List<EventCommentVO> getEventCommentList(int e_idx) {
		return eventCommentDAO.getEventCommentList(e_idx);
	}

	@Override
	public void updateEventComment(EventCommentVO vo) {
		eventCommentDAO.updateEventComment(vo);
	}

	@Override
	public void deleteEventComment(int ec_idx) {
		eventCommentDAO.deleteEventComment(ec_idx);		
	}

	@Override
	public void insertEventComment(EventCommentVO vo) {
		eventCommentDAO.insertEventComment(vo);
	}

	@Override
	public EventCommentVO getEventComment(EventCommentVO vo) {
		return eventCommentDAO.getEventComment(vo);
	}
	
}
