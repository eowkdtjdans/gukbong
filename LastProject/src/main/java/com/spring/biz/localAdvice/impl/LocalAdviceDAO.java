package com.spring.biz.localAdvice.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.profileImage.ProfileImageVO;

@Repository("localAdviceDAO")
public class LocalAdviceDAO {
	@Autowired   
	private SqlSessionTemplate mybatis;
	
	//현지정보 문의게시판 전체조회
	public List<LocalAdviceVO> getLocalAdviceList(Map<String, Object> map) {
		return mybatis.selectList("getLocalAdviceList", map);
	}
	
	//(서울)에 대한 게시글 수
	public int countLocalAdvice(String key) {
		return mybatis.selectOne("countLocalAdvice", key);
	}
	
	//게시글 입력
	public void insertLocalAdvice(LocalAdviceVO vo) {
		mybatis.insert("insertLocalAdvice", vo);
	}
	
	//게시글 상세보기
	public LocalAdviceVO getLocalAdvice(LocalAdviceVO vo) {
		return mybatis.selectOne("getLocalAdvice", vo);
	}
	
	//프로필이미지 조회
	public ProfileImageVO getProfileImage(ProfileImageVO vo) {
		return mybatis.selectOne("getProfileImage", vo);
	}
	
	//게시글 수정
	public void updateLocalAdvice(LocalAdviceVO vo) {
		mybatis.update("updateLocalAdvice", vo);
	}
	
	//게시글 삭제
	public void deleteLocalAdvice(LocalAdviceVO vo) {
		mybatis.delete("deleteLocalAdvice", vo);
	}
	
	//게시글 조회수(증가)
	public void localAdviceCount(String l_idx) {
		mybatis.update("localAdviceCount", l_idx);
	}
	
	//게시글 댓글수증가
	public void updateLocalAdviceCnt(int l_idx) {
		mybatis.update("updateLocalAdviceCnt", l_idx);
	}
	
	//게시글 댓글수감소
	public void updateLocalAdviceCntMinus(int l_idx) {
		mybatis.update("updateLocalAdviceCntMinus", l_idx);
	}
	
	//게시글 좋아요 기능(+)
	public int goodLocalAdvice(int l_idx) {
		return mybatis.update("goodLocalAdvice", l_idx);
	}
	
	//게시글 좋아요 기능(-)
	public int badLocalAdvice(int l_idx) {
		return mybatis.update("badLocalAdvice", l_idx);
	}
}

















