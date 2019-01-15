package com.spring.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.admin.AdminCntVO;
import com.spring.biz.admin.AdminService;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.UserAdminViewVO;
import com.spring.biz.event.EventVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profileImage.ProfileImageVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void logVisit(Map<String, String> lvMap) {
		adminDAO.logVisit(lvMap);
	}

	@Override
	public List<MemberVO> userAdminList() {
		return adminDAO.userAdminList();
	}
	
	@Override
	public UserAdminViewVO userAdminView(String m_id) {
		return adminDAO.userAdminView(m_id);
	}

	@Override
	public void logLogin(Map<String, String> llMap) {
		adminDAO.logLogin(llMap);
	}

	@Override
	public List<UserAdminPostVO> userAdminPostList(String m_id) {
		return adminDAO.userAdminPostList(m_id);
	}

	@Override
	public List<UserAdminCommentVO> userAdminCommentList(String m_id) {
		return adminDAO.userAdminCommentList(m_id);
	}

	@Override
	public AdminCntVO adminCnt() {
		return adminDAO.adminCnt();
	}

	@Override
	public List<EventVO> eventAdminList() {
		return adminDAO.eventAdminList();
	}

	@Override
	public void insertEvent(EventVO eventVO) {
		adminDAO.insertEvent(eventVO);
	}

	@Override
	public void insertEventImg(Map<String, String> eventImgMap) {
		adminDAO.insertEventImg(eventImgMap);
	}

}
