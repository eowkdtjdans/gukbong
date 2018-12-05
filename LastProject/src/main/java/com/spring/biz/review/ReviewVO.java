package com.spring.biz.review;

import java.sql.Date;

public class ReviewVO {
	// 리뷰게시글번호 
    private int r_idx;
    // 호스트아이디 
    private String r_id;
    // 댓글아이디 
    private String rc_id;
    // 댓글내용 
    private String r_content;
    // 댓글작성일 
    private Date r_date;
    
    
    
    
    
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getRc_id() {
		return rc_id;
	}
	public void setRc_id(String rc_id) {
		this.rc_id = rc_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	@Override
	public String toString() {
		return "ReviewVO [r_idx=" + r_idx + ", r_id=" + r_id + ", rc_id=" + rc_id + ", r_content=" + r_content
				+ ", r_date=" + r_date + "]";
	}

	
    
    
    
    
    
    
	
}
