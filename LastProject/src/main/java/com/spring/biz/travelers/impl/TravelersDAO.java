package com.spring.biz.travelers.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.travelers.TravelersVO;

@Repository("travelersDAO")
public class TravelersDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//Travelers 조회
	public List<TravelersVO> getTravelersList(String key) {
		System.out.println("TravelersDAO: getTravelersList()처리");
		return mybatis.selectList("getTravelersList", key);
	}
}
