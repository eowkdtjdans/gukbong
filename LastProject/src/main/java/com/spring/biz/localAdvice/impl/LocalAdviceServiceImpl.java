package com.spring.biz.localAdvice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.localAdvice.LocalAdviceService;
import com.spring.biz.localAdvice.LocalAdviceVO;

@Service("localAdviceService")
public class LocalAdviceServiceImpl implements LocalAdviceService {
	@Autowired
	private LocalAdviceDAO localAdviceDAO;
	
	@Override
	public List<LocalAdviceVO> getLocalAdviceList(String key) {		
		return localAdviceDAO.getLocalAdviceList(key);
	}
	
	/*@Override
	public void insertLocalAdvice(LocalAdviceVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateLocalAdvice(LocalAdviceVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLocalAdvice(LocalAdviceVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LocalAdviceVO getLocalAdvice(LocalAdviceVO vo) {
		// TODO Auto-generated method stub
		return null;
	}*/


	
	
}
