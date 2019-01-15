package com.spring.biz.localAdvice.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.localAdvice.LocalAdviceService;
import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.profileImage.ProfileImageVO;

@Service("localAdviceService")
public class LocalAdviceServiceImpl implements LocalAdviceService {
	@Autowired
	private LocalAdviceDAO localAdviceDAO;
	
	public LocalAdviceServiceImpl() {
		System.out.println("LocalAdviceService 객체생성");
	}
	
	@Override
	public List<LocalAdviceVO> getLocalAdviceList(Map<String, Object> map) {		
		return localAdviceDAO.getLocalAdviceList(map);
	}

	@Override
	public int countLocalAdvice(String key) {
		return localAdviceDAO.countLocalAdvice(key);
	}
	
	@Override
	public void insertLocalAdvice(LocalAdviceVO vo) {
		localAdviceDAO.insertLocalAdvice(vo);
		
	}
	
	@Override
	public void updateLocalAdvice(LocalAdviceVO vo) {
		localAdviceDAO.updateLocalAdvice(vo);
		
	}

	@Override
	public LocalAdviceVO getLocalAdvice(LocalAdviceVO vo) {
		return localAdviceDAO.getLocalAdvice(vo);
	}

	@Override
	public ProfileImageVO getProfileImage(ProfileImageVO vo) {
		return localAdviceDAO.getProfileImage(vo);
	}

	@Override
	public void deleteLocalAdvice(LocalAdviceVO vo) {
		localAdviceDAO.deleteLocalAdvice(vo);
		
	}

	@Override
	public void localAdviceCount(String l_idx) {
		localAdviceDAO.localAdviceCount(l_idx);
		
	}

	@Override
	public void updateLocalAdviceCnt(int l_idx) {
		localAdviceDAO.updateLocalAdviceCnt(l_idx);
		
	}

	@Override
	public void updateLocalAdviceCntMinus(int l_idx) {
		localAdviceDAO.updateLocalAdviceCntMinus(l_idx);
		
	}

	@Override
	public int goodLocalAdvice(int l_idx) {
		return localAdviceDAO.goodLocalAdvice(l_idx);
		
	}

	@Override
	public int badLocalAdvice(int l_idx) {	
		return localAdviceDAO.badLocalAdvice(l_idx);
	}



	
	
}
