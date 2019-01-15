package com.spring.biz.hostImage;

public class HostImageVO {
	private String m_id,
	h_route,
	h_main;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getH_route() {
		return h_route;
	}

	public void setH_route(String h_route) {
		this.h_route = h_route;
	}

	public String getH_main() {
		return h_main;
	}

	public void setH_main(String h_main) {
		this.h_main = h_main;
	}

	@Override
	public String toString() {
		return "HostImageVO [m_id=" + m_id + ", h_route=" + h_route + ", h_main=" + h_main + "]";
	}
	
	
	
	
}
