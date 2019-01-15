package com.spring.biz.localAdviceComment;

import java.sql.Date;

public class LocalAdviceCommentVO {

	 // 댓글번호 
    private int lc_idx;
    // 게시글번호 
    private int l_idx;
    // 댓글작성자아이디 
    private String m_id;
    // 댓글작성일 
    private Date lc_date;
    // 댓글내용 
    private String lc_content;
    // 게시글댓글수 
    private int lc_commentcount;
    // 사진경로
    private String p_route;
    
    private int detdet;
    
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

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getLc_date() {
		return lc_date;
	}

	public void setLc_date(Date lc_date) {
		this.lc_date = lc_date;
	}

	public String getLc_content() {
		return lc_content;
	}

	public void setLc_content(String lc_content) {
		this.lc_content = lc_content;
	}

	public int getLc_commentcount() {
		return lc_commentcount;
	}

	public void setLc_commentcount(int lc_commentcount) {
		this.lc_commentcount = lc_commentcount;
	}

	public String getP_route() {
		return p_route;
	}

	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	
	public int getDetdet() {
		return detdet;
	}

	public void setDetdet(int detdet) {
		this.detdet = detdet;
	}

	@Override
	public String toString() {
		return "LocalAdviceCommentVO [lc_idx=" + lc_idx + ", l_idx=" + l_idx + ", m_id=" + m_id + ", lc_date=" + lc_date
				+ ", lc_content=" + lc_content + ", lc_commentcount=" + lc_commentcount + ", p_route=" + p_route
				+ ", detdet=" + detdet + "]";
	}

	
	

	
	

	
	
    
    
}
