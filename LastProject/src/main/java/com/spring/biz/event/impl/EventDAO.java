package com.spring.biz.event.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.event.EventVO;
import com.spring.biz.localAdvice.LocalAdviceVO;

@Repository("eventDAO")
public class EventDAO {
	@Autowired   
	private SqlSessionTemplate mybatis;
	
	public List<EventVO> getEventList(Map<String, Object> map) {
		return mybatis.selectList("getEventList", map);
	}
	
	public int countEvent(String key) {
		return mybatis.selectOne("countEvent", key);
	}
	
	public EventVO getEvent(int e_idx) {
		return mybatis.selectOne("getEvent", e_idx);
	}
	
	public int goodEvent(int e_idx) {
		return mybatis.update("goodEvent", e_idx);
	}
	
	public int badEvent(int e_idx) {
		return mybatis.update("badEvent", e_idx);
	} 
	
	public void updet(int e_idx) {
		mybatis.update("updet", e_idx);
	}
	
	public void downdet(int e_idx) {
		mybatis.update("downdet", e_idx);
	}
	
	public void upreviewcount(int e_idx) {
		mybatis.update("upreviewcount", e_idx);
	}
	
	public List<EventVO> EventList(){
		return mybatis.selectList("EventList");
	}
	
	public List<EventVO> selectRegion(String e_region){
		return mybatis.selectList("selectRegion", e_region);
	}
	
	/*List<EventVO> selectRegionAsia();
	List<EventVO> selectRegionEurope();
	List<EventVO> selectRegionOceania();
	List<EventVO> selectRegionNorthAmerica();
	List<EventVO> selectRegionSouthAmerica();*/
	public List<EventVO> selectRegionAsia(){
		return mybatis.selectList("selectRegionAsia");
	}
	public List<EventVO> selectRegionEurope(){
		return mybatis.selectList("selectRegionEurope");
	}
	public List<EventVO> selectRegionOceania(){
		return mybatis.selectList("selectRegionOceania");
	}
	public List<EventVO> selectRegionNorthAmerica(){
		return mybatis.selectList("selectRegionNorthAmerica");
	}
	public List<EventVO> selectRegionSouthAmerica(){
		return mybatis.selectList("selectRegionSouthAmerica");
	}
	
	
	
	
	
}




