package com.spring.biz.eventComment;

import java.util.List;

public interface EventCommentService {
	List<EventCommentVO> getEventCommentList(int e_idx);
	
	void updateEventComment(EventCommentVO vo);
	
	void deleteEventComment(int ec_idx);
	
	void insertEventComment(EventCommentVO vo);
	
	EventCommentVO getEventComment(EventCommentVO vo);
}
