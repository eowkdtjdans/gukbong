package com.spring.biz.host;

import java.util.List;
import java.util.Map;

import com.spring.biz.profile.ProfileVO;

public interface HostService {
	List<HostVO> getHostList(Map<String, Object> map);
	
	int countHost(String key);

	void insertHost(HostVO vo);

	int checkHostJson(ProfileVO vo);

	void updateHost(HostVO vo);

	void deleteHost(String m_id);

}
