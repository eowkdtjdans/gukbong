package com.spring.biz.host.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.host.HostVO;
import com.spring.biz.profile.ProfileVO;

@Repository("hostDAO")
public class HostDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<HostVO> getHostList(Map<String, Object> map) {
		return mybatis.selectList("getHostList", map);
	}
	
	public int countHost(String key) {
		return mybatis.selectOne("countHost", key);
	}

	public void insertHost(HostVO vo) {
		mybatis.insert("insertHost", vo);
	}

	public int checkHostJson(ProfileVO vo) {
		return mybatis.selectOne("checkHostJson", vo);
	}

	public void updateHost(HostVO vo) {
		mybatis.insert("updateHost", vo);
	}

	public void deleteHost(String m_id) {
		mybatis.delete("deleteHost", m_id);
	}
	
}
