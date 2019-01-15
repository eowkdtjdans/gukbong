package com.spring.biz.eventComment;

import java.util.Date;

public class EventCommentVO {
	private int ec_idx, e_idx, ec_upvote;
	private String m_id, ec_content, p_route;
	private String ec_date;
	
	public int getEc_idx() {
		return ec_idx;
	}
	public void setEc_idx(int ec_idx) {
		this.ec_idx = ec_idx;
	}
	public int getE_idx() {
		return e_idx;
	}
	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}
	public int getEc_upvote() {
		return ec_upvote;
	}
	public void setEc_upvote(int ec_upvote) {
		this.ec_upvote = ec_upvote;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getEc_content() {
		return ec_content;
	}
	public void setEc_content(String ec_content) {
		this.ec_content = ec_content;
	}
	
	public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	public String getEc_date() {
		return ec_date;
	}
	public void setEc_date(String ec_date) {
		this.ec_date = ec_date;
	}
	@Override
	public String toString() {
		return "EventCommentVO [ec_idx=" + ec_idx + ", e_idx=" + e_idx + ", ec_upvote=" + ec_upvote + ", m_id=" + m_id
				+ ", ec_content=" + ec_content + ", p_route=" + p_route + ", ec_date=" + ec_date + "]";
	}
	
	
	

	
	
}
