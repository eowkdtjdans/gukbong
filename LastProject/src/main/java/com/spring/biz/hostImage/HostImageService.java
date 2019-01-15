package com.spring.biz.hostImage;

import java.util.List;

public interface HostImageService {

	HostImageVO getHostImage(HostImageVO hostimageVO);

	List<HostImageVO> getHostImageList(String m_id);

	void deleteHostImage(HostImageVO vo);

	void updateMainHostImage(HostImageVO vo);

	void mainHostImageInit(HostImageVO vo);

}
