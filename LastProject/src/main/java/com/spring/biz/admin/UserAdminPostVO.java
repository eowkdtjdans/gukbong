package com.spring.biz.admin;

import java.util.Date;

public class UserAdminPostVO {
	private String l_idx, m_id, l_subject, l_content, m_address, p_route;
	private Date l_date;
	private int l_upvote, l_reviewcount, lc_cnt;
	
	public String getL_idx() {
		return l_idx;
	}
	public void setL_idx(String l_idx) {
		this.l_idx = l_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getL_subject() {
		return l_subject;
	}
	public void setL_subject(String l_subject) {
		this.l_subject = l_subject;
	}
	public String getL_content() {
		return l_content;
	}
	public void setL_content(String l_content) {
		this.l_content = l_content;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public Date getL_date() {
		return l_date;
	}
	public void setL_date(Date l_date) {
		this.l_date = l_date;
	}
	public int getL_upvote() {
		return l_upvote;
	}
	public void setL_upvote(int l_upvote) {
		this.l_upvote = l_upvote;
	}
	public int getL_reviewcount() {
		return l_reviewcount;
	}
	public void setL_reviewcount(int l_reviewcount) {
		this.l_reviewcount = l_reviewcount;
	}
	public int getLc_cnt() {
		return lc_cnt;
	}
	public void setLc_cnt(int lc_cnt) {
		this.lc_cnt = lc_cnt;
	}
	public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	
	@Override
	public String toString() {
		return "UserAdminPostVO [l_idx=" + l_idx + ", m_id=" + m_id + ", l_subject=" + l_subject + ", l_content="
				+ l_content + ", m_address=" + m_address + ", p_route=" + p_route + ", l_date=" + l_date + ", l_upvote="
				+ l_upvote + ", l_reviewcount=" + l_reviewcount + ", lc_cnt=" + lc_cnt + "]";
	}
}
