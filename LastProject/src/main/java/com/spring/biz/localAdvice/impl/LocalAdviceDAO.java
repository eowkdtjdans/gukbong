package com.spring.biz.localAdvice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.localAdvice.LocalAdviceVO;

@Repository("localAdviceDAO")
public class LocalAdviceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//현지정보 문의게시판 전체조회
	public List<LocalAdviceVO> getLocalAdviceList(String key) {
		return mybatis.selectList("getLocalAdviceList", key);
	}
	
	//(서울)에 대한 게시글 수
	public int countLocalAdvice(String key) {
		return mybatis.selectOne("countLocalAdvice", key);
	}
	
	//게시글 입력
	public void insertLocalAdvice(LocalAdviceVO vo) {
		mybatis.insert("insertLocalAdvice", vo);
	}
	
}
