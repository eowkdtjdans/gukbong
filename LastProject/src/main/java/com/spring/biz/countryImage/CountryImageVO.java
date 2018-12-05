package com.spring.biz.countryImage;

public class CountryImageVO {
	private int c_idx;
	private String c_route;
	
	
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_route() {
		return c_route;
	}
	public void setC_route(String c_route) {
		this.c_route = c_route;
	}
	
	
	@Override
	public String toString() {
		return "CountryImageVO [c_idx=" + c_idx + ", c_route=" + c_route + "]";
	}
	

	
}
