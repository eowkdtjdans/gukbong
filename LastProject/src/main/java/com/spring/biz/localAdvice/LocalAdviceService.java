package com.spring.biz.localAdvice;

import java.util.List;
import java.util.Map;

import com.spring.biz.profileImage.ProfileImageVO;

public interface LocalAdviceService {
	//CRUD 기능 구현 메소드 정의
	//글입력
	void insertLocalAdvice(LocalAdviceVO vo);
	
	//글수정
	void updateLocalAdvice(LocalAdviceVO vo);
		
	//글삭제
	void deleteLocalAdvice(LocalAdviceVO vo);
	
	//글 상세 조회
	LocalAdviceVO getLocalAdvice(LocalAdviceVO vo);
	
	//글 목록 전체 조회
	List<LocalAdviceVO> getLocalAdviceList(Map<String, Object> map);
	
	//(서울에 관련된)게시글 수
	int countLocalAdvice (String key);
	
	//프로필이미지 조회
	ProfileImageVO getProfileImage(ProfileImageVO vo);
	
	//게시글 조회수 
	void localAdviceCount(String l_idx);
	
	//게시글 댓글수 증가(+1)
	void updateLocalAdviceCnt(int l_idx);
	
	//게시글 댓글수 감소(-1)
	void updateLocalAdviceCntMinus(int l_idx);
	
	//게시글 좋아요 기능(+)
	int goodLocalAdvice(int l_idx);
	
	//게시글 좋아요 기능(-)
	int badLocalAdvice(int l_idx);
	
	
	
}















