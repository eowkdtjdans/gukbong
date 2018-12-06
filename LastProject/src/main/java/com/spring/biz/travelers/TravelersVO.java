package com.spring.biz.travelers;

import java.sql.Date;

public class TravelersVO {

	 // 아이디 
    private String m_id;
    // 방문국가 
    private String t_country;
    // 몇박 
    private int t_sleepingnumber;
    // 방문일자(1.1~1.3) 
    private Date t_dateofvisit;
    // 방문자수 
    private int t_visits;
    // 여행동기 
    private String t_motive;
    
    
    
    
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
	public int getT_sleepingnumber() {
		return t_sleepingnumber;
	}
	public void setT_sleepingnumber(int t_sleepingnumber) {
		this.t_sleepingnumber = t_sleepingnumber;
	}
	public Date getT_dateofvisit() {
		return t_dateofvisit;
	}
	public void setT_dateofvisit(Date t_dateofvisit) {
		this.t_dateofvisit = t_dateofvisit;
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
	@Override
	public String toString() {
		return "TravelPlanVO [m_id=" + m_id + ", t_country=" + t_country + ", t_sleepingnumber=" + t_sleepingnumber
				+ ", t_dateofvisit=" + t_dateofvisit + ", t_visits=" + t_visits + ", t_motive=" + t_motive + "]";
	}
	
    
    
    
    
    
}
