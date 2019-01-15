package com.spring.biz.profileImage.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.hostImage.HostImageVO;
import com.spring.biz.profileImage.ProfileImageService;
import com.spring.biz.profileImage.ProfileImageVO;

@Service("profileImageService")
public class ProfileImageServiceImpl implements ProfileImageService{
	@Autowired
	private ProfileImageDAO profileImageDAO;

	@Override
	public void ProfileImageInsert(Map<String, String> profileImageMap) {
		profileImageDAO.ProfileImageInsert(profileImageMap);
	}

	@Override
	public void ProfileImageSetMain() {
		
	}

	@Override
	public int ProfileImageMainCount(String m_id) {
		return profileImageDAO.ProfileImageMainCount(m_id);
	}

	@Override
	public int HostImageMainCount(String m_id) {
		return profileImageDAO.HostImageMainCount(m_id);
	}

	@Override
	public void HostImageInsert(Map<String, String> hostImageMap) {
		profileImageDAO.HostImageInsert(hostImageMap);
	}

	@Override						
	public List<ProfileImageVO> getProfileImageList(String m_id) {
	
		return 	profileImageDAO.getProfileImageList(m_id);
	}

	@Override
	public void deleteProfileImage(ProfileImageVO vo) {
		profileImageDAO.deleteProfileImage(vo);
	}

	@Override
	public void updateMainProfileImage(ProfileImageVO vo) {
		profileImageDAO.updateMainProfileImage(vo);
	}

	@Override
	public void mainProfileImageInit(ProfileImageVO vo) {
		profileImageDAO.mainProfileImageInit(vo);
	}


}
