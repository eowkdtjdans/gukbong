package com.spring.biz.hostImage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.hostImage.HostImageVO;

@Repository("hostImageDAO")
public class HostImageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public HostImageVO getHostImage(HostImageVO hostimageVO) {
		return mybatis.selectOne("getHostImage", hostimageVO);
	}

	public List<HostImageVO> getHostImageList(String m_id) {
		return mybatis.selectList("getHostImageList", m_id);
	}

	public void deleteHostImage(HostImageVO vo) {
		mybatis.delete("deleteHostImage", vo);
	}

	public void updateMainHostImage(HostImageVO vo) {
		mybatis.update("updateMainHostImage", vo);
	}

	public void mainHostImageInit(HostImageVO vo) {
		mybatis.update("mainHostImageInit", vo);
	}
}
