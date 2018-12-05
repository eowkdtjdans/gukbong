package com.spring.biz.country;

public class CountryVO {
	private int c_idx;
	private String c_name, privatec_city, c_region, c_content, c_tag;
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getPrivatec_city() {
		return privatec_city;
	}
	public void setPrivatec_city(String privatec_city) {
		this.privatec_city = privatec_city;
	}
	public String getC_region() {
		return c_region;
	}
	public void setC_region(String c_region) {
		this.c_region = c_region;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_tag() {
		return c_tag;
	}
	public void setC_tag(String c_tag) {
		this.c_tag = c_tag;
	}
	@Override
	public String toString() {
		return "CountryVO [c_idx=" + c_idx + ", c_name=" + c_name + ", privatec_city=" + privatec_city + ", c_region="
				+ c_region + ", c_content=" + c_content + ", c_tag=" + c_tag + "]";
	}
	
		
	
	
}
