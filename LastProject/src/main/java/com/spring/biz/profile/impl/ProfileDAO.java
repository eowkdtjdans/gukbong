package com.spring.biz.profile.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.member.MemberVO;
import com.spring.biz.profile.ProfileVO;
@Repository("profileDAO")
public class ProfileDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public Object profileDAO;
	
	
	public void modifyProfile(ProfileVO vo) {
		
		System.out.println("====== 프로필 수정 ======");
		mybatis.update("modifyProfile", vo);
		
		
	}


	public void insertProfile(ProfileVO vo) {
		mybatis.insert("insertProfile", vo);
	}


	public int insertProfileJson(ProfileVO vo) {
		return mybatis.selectOne("insertProfileJson", vo);
	}


	public ProfileVO getProfile(ProfileVO vo) {
		return  mybatis.selectOne("getProfile", vo);
	}


	public ProfileVO getProfile2(ProfileVO profileVO) {
		return  mybatis.selectOne("getProfile", profileVO);
	}





}
