package com.spring.biz.admin;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.event.EventVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profileImage.ProfileImageVO;

public interface AdminService {
	void logVisit(Map<String, String> lvMap);
	void logLogin(Map<String, String> llMap);
	void insertEvent(EventVO eventVO);
	void insertEventImg(Map<String, String> eventImgMap);
	
	UserAdminViewVO userAdminView(String m_id);
	
	List<MemberVO> userAdminList();
	List<UserAdminPostVO> userAdminPostList(String m_id);
	List<UserAdminCommentVO> userAdminCommentList(String m_id);
	List<EventVO> eventAdminList();
	
	AdminCntVO adminCnt();
}
