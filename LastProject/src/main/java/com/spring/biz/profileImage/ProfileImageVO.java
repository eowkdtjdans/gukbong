package com.spring.biz.profileImage;

public class ProfileImageVO {
	private String m_id;
	private String p_route;
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	
	@Override
	public String toString() {
		return "ProfileImageVO [m_id=" + m_id + ", p_route=" + p_route + "]";
	}
		
	
}
