package com.spring.biz.localAdviceComment.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.localAdviceComment.LocalAdviceCommentVO;
import com.spring.biz.profileImage.ProfileImageVO;

@Repository("localAdviceCommentDAO")
public class LocalAdviceCommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//댓글게시판 전체조회
	public List<LocalAdviceCommentVO> getLocalAdviceCommentList(Map<String, Object> map){		
		return mybatis.selectList("getLocalAdviceCommentList", map);
	}
	
	//댓글입력
	public void insertLocalAdviceComment(LocalAdviceCommentVO vo) {
		mybatis.insert("insertLocalAdviceComment", vo);
	}
	
	//댓글수정
	public void updateLocalAdviceComment(LocalAdviceCommentVO vo) {
		mybatis.update("updateLocalAdviceComment", vo);
	}

	public int updateLocalAdivceCommentJson(LocalAdviceCommentVO vo) {
		return mybatis.selectOne("updateLocalAdviceCommentJson", vo);
	}
	
	//댓글삭제 json
	public void deleteLocalAdviceComment(LocalAdviceCommentVO vo) {
		mybatis.delete("deleteLocalAdviceComment", vo);
	}
	
	//게시글삭제할시 먼저 댓글전체삭제
	public void deleteLocalAdviceCommentAll(LocalAdviceVO vo) {
		mybatis.delete("deleteLocalAdviceCommentAll", vo);
	}
	
	//댓글페이징 처리를 위한 댓글 수 조회
	public int countLocalAdviceComment(int l_idx) {
		return mybatis.selectOne("countLocalAdviceComment", l_idx);
	}
	
	//대댓글을 위한 insert
	public void insertdetdetComment(LocalAdviceCommentVO vo) {
		mybatis.insert("insertdetdetComment", vo);
	}
	
	//대댓글을 위한 select
	public List<LocalAdviceCommentVO> selectdetdetComment(LocalAdviceCommentVO vo) {
		return mybatis.selectList("selectdetdetComment", vo);
	}
	
	//프로필이미지 나오게하기
	public String selectImage(ProfileImageVO vo) {
		return mybatis.selectOne("selectImage", vo);
	}
	
	//댓댓의 번호뽑기
	public int selectdetdet(String lc_content) {
		return mybatis.selectOne("selectdetdet", lc_content);
	}
	
	//댓댓의 lc_idx뽑기
	public int detdetlc_idx() {
		return mybatis.selectOne("detdetlc_idx");
	}
	
	//댓댓의 lc_idx를 이용해서 한줄조회
	public List<LocalAdviceCommentVO> selectdetdetList(String detdetlc_idx){
		return mybatis.selectList("selectdetdetList", detdetlc_idx);
	}
	
	//댓댓 수정
	public void updatedetdet(LocalAdviceCommentVO vo) {
		mybatis.update("updatedetdet", vo);
	}
	
	//댓댓 LC_IDX를 이용해 한개 삭제
	public void deletedetdet(LocalAdviceCommentVO vo) {
		mybatis.delete("deletedetdet", vo);
	}
	
	//댓댓 DETDET을 이용해 전체 삭제
	public void deletedetdetall(String detdet) {
		mybatis.delete("deletedetdetall", detdet);
	}
	
}








