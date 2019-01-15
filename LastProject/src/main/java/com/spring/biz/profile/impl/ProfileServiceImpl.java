package com.spring.biz.profile.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.profile.ProfileService;
import com.spring.biz.profile.ProfileVO;
@Service("profileService")
public class ProfileServiceImpl implements ProfileService {
	@Autowired
	private ProfileDAO profileDAO;
	
	
	@Override
	public void ModifyProfile(ProfileVO vo) {
		profileDAO.modifyProfile(vo);	
	}


	@Override
	public void InsertProfile(ProfileVO vo) throws Exception {
		profileDAO.insertProfile(vo);
	}


	@Override
	public int insertProfileJson(ProfileVO vo) {
		return profileDAO.insertProfileJson(vo);
	}


	@Override
	public List<ProfileVO> getProfile(ProfileVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public ProfileVO getProfile(ProfileVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public ProfileVO getProfile2(ProfileVO profileVO, HttpSession session) {
		return profileDAO.getProfile2(profileVO);
	}






	


}
