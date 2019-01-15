package com.spring.biz.travelers;

import java.sql.Date;

public class TravelersVO {

	 // 아이디 
    private String m_id;
    // 방문국가 
    private String t_country;
    // 입실날짜 
    private Date t_startdate;
    // 퇴실날짜
    private Date t_enddate;
    // 방문자수 
    private int t_visits;
    // 여행동기 
    private String t_motive;
    // 프로필사진
    private String p_route;
    
    private String p_hobby;
    private String p_language;
    private String p_job;
    private String p_aboutme;
    private String p_purpose;
    private String p_visitcountry; 
    
    
    
    
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getT_country() {
		return t_country;
	}
	public void setT_country(String t_country) {
		this.t_country = t_country;
	}	
	public Date getT_startdate() {
		return t_startdate;
	}
	public void setT_startdate(Date t_startdate) {
		this.t_startdate = t_startdate;
	}
	public Date getT_enddate() {
		return t_enddate;
	}
	public void setT_enddate(Date t_enddate) {
		this.t_enddate = t_enddate;
	}
	public int getT_visits() {
		return t_visits;
	}
	public void setT_visits(int t_visits) {
		this.t_visits = t_visits;
	}
	public String getT_motive() {
		return t_motive;
	}
	public void setT_motive(String t_motive) {
		this.t_motive = t_motive;
	}
	public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
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
		return "TravelersVO [m_id=" + m_id + ", t_country=" + t_country + ", t_startdate=" + t_startdate
				+ ", t_enddate=" + t_enddate + ", t_visits=" + t_visits + ", t_motive=" + t_motive + ", p_route="
				+ p_route + ", p_hobby=" + p_hobby + ", p_language=" + p_language + ", p_job=" + p_job + ", p_aboutme="
				+ p_aboutme + ", p_purpose=" + p_purpose + ", p_visitcountry=" + p_visitcountry + "]";
	}
	
	
    
    
    
    
    
}
