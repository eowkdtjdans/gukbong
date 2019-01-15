package com.spring.biz.eventImage;

public class EventImageVO {
	private int e_idx, e_main;
	private String e_img;
	
	public int getE_idx() {
		return e_idx;
	}
	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}
	public int getE_main() {
		return e_main;
	}
	public void setE_main(int e_main) {
		this.e_main = e_main;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	@Override
	public String toString() {
		return "EventImageVO [e_idx=" + e_idx + ", e_main=" + e_main + ", e_img=" + e_img + "]";
	}

	

	
	
}
