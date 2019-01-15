package com.spring.biz.localAdviceComment;

import java.util.List;
import java.util.Map;

import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profileImage.ProfileImageVO;


public interface LocalAdviceCommentService {
	//댓글 목록 전체 조회
	List<LocalAdviceCommentVO> getLocalAdviceCommentList(Map<String, Object> map);
	
	//댓글 입력
	void insertLocalAdviceComment(LocalAdviceCommentVO vo);
	
	//댓글 수정
	void updateLocalAdviceComment(LocalAdviceCommentVO vo);
	
	//ajax selectone카운트주기
	int updateLocalAdviceCommentJson(LocalAdviceCommentVO vo);
	
	//ajax deletecomment
	void deleteLocalAdviceComment(LocalAdviceCommentVO vo);
	
	//게시글삭제할때 댓글내용전체삭제
	void deleteLocalAdviceCommentAll(LocalAdviceVO vo);
	
	//댓글페이징 처리를 위한 댓글 수 조회
	int countLocalAdviceComment(int l_idx);
	
	//대댓글을 위한 insert
	void insertdetdetComment(LocalAdviceCommentVO vo);
	
	//대댓글을 위한 select
	List<LocalAdviceCommentVO> selectdetdetComment(LocalAdviceCommentVO vo);
	
	//프로필이미지 나오게하기
	String selectImage(ProfileImageVO vo);
	
	//댓댓의 번호뽑기
	int selectdetdet(String lc_content);
	
	//댓댓의 lc_idx뽑아오기
	int detdetlc_idx();
	
	//댓댓의 lc_idx를 이용해서 한줄조회
	List<LocalAdviceCommentVO> selectdetdetList(String detdetlc_idx);
	
	//댓댓 수정
	void updatedetdet(LocalAdviceCommentVO vo);
	
	//댓댓 LC_IDX를 이용해 삭제
	void deletedetdet(LocalAdviceCommentVO vo);
	
	//댓댓 DETDET을 이용해서 삭제
	void deletedetdetall(String detdet);
	
}
