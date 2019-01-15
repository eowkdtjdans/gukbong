package com.spring.biz.profile;

public class ProfileVO {
	  // 아이디 
    private String m_id;
    // 취미 
    private String p_hobby;
    // 사용언어
    private String p_language;
    // 직업 
    private String p_job;
    // 자기소개 
    private String p_aboutme;
    // 사이트방문목적 
    private String p_purpose;
    // 방문해본국가 
    private String p_visitcountry;
    //사진
    
    private String p_route;
    public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	// 본인사진 
    private String p_image;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	@Override
	public String toString() {
		return "ProfileVO [m_id=" + m_id + ", p_hobby=" + p_hobby + ", p_language=" + p_language + ", p_job=" + p_job
				+ ", p_aboutme=" + p_aboutme + ", p_purpose=" + p_purpose + ", p_visitcountry=" + p_visitcountry
				+ ", p_route=" + p_route + ", p_image=" + p_image + "]";
	}
}
    
    
    
    
    
	

	
    
    
	
