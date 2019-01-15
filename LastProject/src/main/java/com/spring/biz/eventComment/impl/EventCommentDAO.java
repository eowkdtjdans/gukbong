package com.spring.biz.eventComment.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.eventComment.EventCommentVO;
import com.spring.biz.localAdviceComment.LocalAdviceCommentVO;

@Repository("eventCommentDAO")
public class EventCommentDAO {
	@Autowired   
	private SqlSessionTemplate mybatis;
	
	public List<EventCommentVO> getEventCommentList(int e_idx){		
		return mybatis.selectList("getEventCommentList", e_idx);
	} 
	
	public void updateEventComment(EventCommentVO vo) {
		mybatis.update("updateEventComment", vo);
	}
	
	public void deleteEventComment(int ec_idx) {
		mybatis.delete("deleteEventComment", ec_idx);
	}
	
	public void insertEventComment(EventCommentVO vo) {
		mybatis.insert("insertEventComment", vo);
	}
	
	public EventCommentVO getEventComment(EventCommentVO vo) {
		return mybatis.selectOne("getEventComment", vo);
	}
}





