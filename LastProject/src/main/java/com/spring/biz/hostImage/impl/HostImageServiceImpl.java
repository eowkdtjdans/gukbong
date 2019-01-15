package com.spring.biz.hostImage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.hostImage.HostImageService;
import com.spring.biz.hostImage.HostImageVO;

@Service("hostImageService")
public class HostImageServiceImpl implements HostImageService{
@Autowired
private HostImageDAO hostImageDAO;

@Override
public HostImageVO getHostImage(HostImageVO hostimageVO) {
	return hostImageDAO.getHostImage(hostimageVO);
}

@Override
public List<HostImageVO> getHostImageList(String m_id) {
	return hostImageDAO.getHostImageList(m_id);
}

@Override
public void deleteHostImage(HostImageVO vo) {
	 hostImageDAO.deleteHostImage(vo);
}

@Override
public void updateMainHostImage(HostImageVO vo) {
	hostImageDAO.updateMainHostImage(vo);
}

@Override
public void mainHostImageInit(HostImageVO vo) {
	hostImageDAO.mainHostImageInit(vo);
}


}
