package com.spring.biz.admin;

import java.util.Date;

public class UserAdminCommentVO {
	private int lc_idx, l_idx, detdet;
	private String m_id, lc_content, p_route;
	private Date lc_date;
	
	public int getLc_idx() {
		return lc_idx;
	}
	public void setLc_idx(int lc_idx) {
		this.lc_idx = lc_idx;
	}
	public int getL_idx() {
		return l_idx;
	}
	public void setL_idx(int l_idx) {
		this.l_idx = l_idx;
	}
	public int getDetdet() {
		return detdet;
	}
	public void setDetdet(int detdet) {
		this.detdet = detdet;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getLc_content() {
		return lc_content;
	}
	public void setLc_content(String lc_content) {
		this.lc_content = lc_content;
	}
	public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	public Date getLc_date() {
		return lc_date;
	}
	public void setLc_date(Date lc_date) {
		this.lc_date = lc_date;
	}
	
	@Override
	public String toString() {
		return "UserAdminCommentVO [lc_idx=" + lc_idx + ", l_idx=" + l_idx + ", detdet=" + detdet + ", m_id=" + m_id
				+ ", lc_content=" + lc_content + ", p_route=" + p_route + ", lc_date=" + lc_date + "]";
	}
}
