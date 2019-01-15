package com.spring.biz.admin;

import oracle.sql.DATE;

public class LogVisitVO {
	private String lv_ip, lv_country;
	private DATE lv_date;
	
	public String getLv_ip() {
		return lv_ip;
	}
	public void setLv_ip(String lv_ip) {
		this.lv_ip = lv_ip;
	}
	public String getLv_country() {
		return lv_country;
	}
	public void setLv_country(String lv_country) {
		this.lv_country = lv_country;
	}
	public DATE getLv_date() {
		return lv_date;
	}
	public void setLv_date(DATE lv_date) {
		this.lv_date = lv_date;
	}
	
	@Override
	public String toString() {
		return "LogVisitVO [lv_ip=" + lv_ip + ", lv_country=" + lv_country + ", lv_date=" + lv_date + "]";
	}
}
