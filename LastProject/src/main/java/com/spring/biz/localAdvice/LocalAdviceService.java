package com.spring.biz.localAdvice;

import java.util.List;

public interface LocalAdviceService {
	//CRUD 기능 구현 메소드 정의
	/*//글입력
	void insertLocalAdvice(LocalAdviceVO vo);
	//글수정
	void updateLocalAdvice(LocalAdviceVO vo);
	//글삭제
	void deleteLocalAdvice(LocalAdviceVO vo);
	//글 상세 조회
	LocalAdviceVO getLocalAdvice(LocalAdviceVO vo);*/
	//글 목록 전체 조회
	List<LocalAdviceVO> getLocalAdviceList(String key);
}
