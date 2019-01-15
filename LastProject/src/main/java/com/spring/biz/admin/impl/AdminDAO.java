package com.spring.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.admin.AdminCntVO;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.UserAdminViewVO;
import com.spring.biz.event.EventVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profileImage.ProfileImageVO;

@Repository("adminDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void logVisit(Map<String, String> lvMap) {
		mybatis.insert("logVisit", lvMap);
	}
	
	public List<MemberVO> userAdminList() {
		return mybatis.selectList("userAdminList");
	}
	
	public UserAdminViewVO userAdminView(String m_id) {
		return mybatis.selectOne("userAdminView", m_id);
	}

	public void logLogin(Map<String, String> llMap) {
		mybatis.insert("logLogin", llMap);
	}

	public List<UserAdminPostVO> userAdminPostList(String m_id) {
		return mybatis.selectList("userAdminPostList", m_id);
	}

	public List<UserAdminCommentVO> userAdminCommentList(String m_id) {
		return mybatis.selectList("userAdminCommentList", m_id);
	}

	public AdminCntVO adminCnt() {
		return mybatis.selectOne("adminCnt");
	}

	public List<EventVO> eventAdminList() {
		return mybatis.selectList("eventAdminList");
	}

	public void insertEvent(EventVO eventVO) {
		mybatis.insert("insertEvent", eventVO);
	}

	public void insertEventImg(Map<String, String> eventImgMap) {
		mybatis.insert("insertEventImg", eventImgMap);
	}

}
