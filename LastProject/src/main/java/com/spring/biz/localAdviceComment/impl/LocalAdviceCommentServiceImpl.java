package com.spring.biz.localAdviceComment.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.localAdviceComment.LocalAdviceCommentService;
import com.spring.biz.localAdviceComment.LocalAdviceCommentVO;
import com.spring.biz.profileImage.ProfileImageVO;

@Service("localAdviceCommentService")
public class LocalAdviceCommentServiceImpl implements LocalAdviceCommentService {
	@Autowired
	private LocalAdviceCommentDAO localAdviceCommentDAO;
	
	public LocalAdviceCommentServiceImpl() {
		System.out.println("LocalAdviceCommentServiceImpl 객체 생성");
	}
	
	@Override
	public List<LocalAdviceCommentVO> getLocalAdviceCommentList(Map<String, Object> map) {
		return localAdviceCommentDAO.getLocalAdviceCommentList(map);
	}

	@Override
	public void insertLocalAdviceComment(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.insertLocalAdviceComment(vo); 		
	}

	@Override
	public void updateLocalAdviceComment(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.updateLocalAdviceComment(vo);		
	}

	@Override
	public int updateLocalAdviceCommentJson(LocalAdviceCommentVO vo) {
		return localAdviceCommentDAO.updateLocalAdivceCommentJson(vo);
		
	}

	@Override
	public void deleteLocalAdviceComment(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.deleteLocalAdviceComment(vo);
		
	}

	@Override
	public void deleteLocalAdviceCommentAll(LocalAdviceVO vo) {
		localAdviceCommentDAO.deleteLocalAdviceCommentAll(vo);
		
	}

	@Override
	public int countLocalAdviceComment(int l_idx) {
		return localAdviceCommentDAO.countLocalAdviceComment(l_idx);
		
	}

	@Override
	public void insertdetdetComment(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.insertdetdetComment(vo);
		
	}

	@Override
	public List<LocalAdviceCommentVO> selectdetdetComment(LocalAdviceCommentVO vo) {
		return localAdviceCommentDAO.selectdetdetComment(vo);
	}

	@Override
	public String selectImage(ProfileImageVO vo) {
		return localAdviceCommentDAO.selectImage(vo);
	}

	@Override
	public int selectdetdet(String lc_content) {
		return localAdviceCommentDAO.selectdetdet(lc_content);
	}

	@Override
	public int detdetlc_idx() {
		return localAdviceCommentDAO.detdetlc_idx();
	}

	@Override
	public List<LocalAdviceCommentVO> selectdetdetList(String detdetlc_idx) {
		return localAdviceCommentDAO.selectdetdetList(detdetlc_idx);
	}

	@Override
	public void updatedetdet(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.updatedetdet(vo);		
	}

	@Override
	public void deletedetdet(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.deletedetdet(vo);		
	}

	@Override
	public void deletedetdetall(String detdet) {
		localAdviceCommentDAO.deletedetdetall(detdet);		
	}



}
