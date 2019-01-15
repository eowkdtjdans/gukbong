package com.spring.biz.admin;

import java.util.Date;

public class UserAdminViewVO {
	private String m_id, m_name, m_phone, m_gender, m_birthday, m_address, p_route, p_hobby, p_language, p_job, p_aboutme;
	private String p_purpose, p_visitcountry;
	private Date m_regdate;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_birthday() {
		return m_birthday;
	}
	public void setM_birthday(String m_birthday) {
		this.m_birthday = m_birthday;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getP_hobby() {
		return p_hobby;
	}
	public void setP_hobby(String p_hobby) {
		this.p_hobby = p_hobby;
	}
	public String getP_language() {
		return p_language;
	}
	public void setP_language(String p_language) {
		this.p_language = p_language;
	}
	public String getP_job() {
		return p_job;
	}
	public void setP_job(String p_job) {
		this.p_job = p_job;
	}
	public String getP_aboutme() {
		return p_aboutme;
	}
	public void setP_aboutme(String p_aboutme) {
		this.p_aboutme = p_aboutme;
	}
	public String getP_purpose() {
		return p_purpose;
	}
	public void setP_purpose(String p_purpose) {
		this.p_purpose = p_purpose;
	}
	public String getP_visitcountry() {
		return p_visitcountry;
	}
	public void setP_visitcountry(String p_visitcountry) {
		this.p_visitcountry = p_visitcountry;
	}
	
	@Override
	public String toString() {
		return "userAdminViewVO [m_id=" + m_id + ", m_name=" + m_name + ", m_phone=" + m_phone + ", m_gender="
				+ m_gender + ", m_birthday=" + m_birthday + ", m_address=" + m_address + ", p_route=" + p_route
				+ ", p_hobby=" + p_hobby + ", p_language=" + p_language + ", p_job=" + p_job + ", p_aboutme="
				+ p_aboutme + ", p_purpose=" + p_purpose + ", p_visitcountry=" + p_visitcountry + ", m_regdate="
				+ m_regdate + "]";
	}
	
}
