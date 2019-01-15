package com.spring.biz.eventImage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.eventImage.EventImageVO;

@Repository("eventImageDAO")
public class EventImageDAO {
	@Autowired   
	private SqlSessionTemplate mybatis;
	
	public List<EventImageVO> getEventImageList(int e_idx){
		return mybatis.selectList("getEventImageList", e_idx);
	}
}
