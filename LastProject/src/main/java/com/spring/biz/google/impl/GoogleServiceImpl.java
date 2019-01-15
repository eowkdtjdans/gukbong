package com.spring.biz.google.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.google.GoogleService;
import com.spring.biz.google.GoogleVO;

@Service("googleService")
public class GoogleServiceImpl implements GoogleService{
	@Autowired
	private GoogleDAO googleDAO;
	
	public GoogleServiceImpl() {
		System.out.println("GoogleServiceImpl 객체 생성");
	}

	@Override
	public List<GoogleVO> getHostGoogle() {
		return googleDAO.getHostGoogle();
	}

}