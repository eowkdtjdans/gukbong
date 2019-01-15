package com.spring.biz.profileImage.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.profileImage.ProfileImageVO;

@Repository("profileImageDAO")
public class ProfileImageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void ProfileImageInsert(Map<String, String> profileImageMap) {
		mybatis.insert("ProfileImageInsert", profileImageMap);
	}
	
	public int ProfileImageMainCount(String m_id) {
		return mybatis.selectOne("ProfileImageMainCount", m_id);
	}
	
	public void ProfileImageSetMain() {
		
	}

	public int HostImageMainCount(String m_id) {
		return mybatis.selectOne("HostImageMainCount", m_id);
	}

	public void HostImageInsert(Map<String, String> hostImageMap) {
		mybatis.insert("HostImageInsert", hostImageMap);
	}

	public List<ProfileImageVO> getProfileImageList(String m_id) {
		return mybatis.selectList("getProfileImageList",m_id);
	}

	public void deleteProfileImage(ProfileImageVO vo) {
		 mybatis.delete("deleteProfileImage", vo);
	}

	public void updateMainProfileImage(ProfileImageVO vo) {
		mybatis.update("updateMainProfileImage", vo);
	}

	public void mainProfileImageInit(ProfileImageVO vo) {
		mybatis.update("mainProfileImageInit", vo);
	}

}
