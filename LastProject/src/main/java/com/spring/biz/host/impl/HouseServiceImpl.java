package com.spring.biz.host.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.host.HostService;
import com.spring.biz.host.HostVO;
import com.spring.biz.profile.ProfileVO;

@Service("hostService")
public class HouseServiceImpl implements HostService {
	@Autowired
	private HostDAO hostDAO;

	@Override
	public List<HostVO> getHostList(Map<String, Object> map) {
		return hostDAO.getHostList(map);
	}

	@Override
	public int countHost(String key) {
		return hostDAO.countHost(key);
	}

	@Override
	public void insertHost(HostVO vo) {
		hostDAO.insertHost(vo);
	}

	@Override
	public int checkHostJson(ProfileVO vo) {
		return hostDAO.checkHostJson(vo);
	}

	@Override
	public void updateHost(HostVO vo) {
		hostDAO.updateHost(vo);
	}

	@Override
	public void deleteHost(String m_id) {
		hostDAO.deleteHost(m_id);
	}



}
