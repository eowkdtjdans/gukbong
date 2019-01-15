package com.spring.biz.message;

import java.util.Date;

public class MessageRecieveVO {
	private int receive_idx, receive_read;
	private String receive_sender,
	receive_receiver,
	receive_title,
	p_route,
	receive_content;

	private Date receive_regdate;
	
	
	
	
	
	public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	public int getReceive_read() {
		return receive_read;
	}
	public void setReceive_read(int receive_read) {
		this.receive_read = receive_read;
	}
	public int getReceive_idx() {
		return receive_idx;
	}
	public void setReceive_idx(int receive_idx) {
		this.receive_idx = receive_idx;
	}
	public String getReceive_sender() {
		return receive_sender;
	}
	public void setReceive_sender(String receive_sender) {
		this.receive_sender = receive_sender;
	}
	public String getReceive_receiver() {
		return receive_receiver;
	}
	public void setReceive_receiver(String receive_receiver) {
		this.receive_receiver = receive_receiver;
	}
	public String getReceive_title() {
		return receive_title;
	}
	public void setReceive_title(String receive_title) {
		this.receive_title = receive_title;
	}
	public String getReceive_content() {
		return receive_content;
	}
	public void setReceive_content(String receive_content) {
		this.receive_content = receive_content;
	}
	public Date getReceive_regdate() {
		return receive_regdate;
	}
	public void setReceive_regdate(Date receive_regdate) {
		this.receive_regdate = receive_regdate;
	}
	@Override
	public String toString() {
		return "MessageRecieveVO [receive_idx=" + receive_idx + ", receive_read=" + receive_read + ", receive_sender="
				+ receive_sender + ", receive_receiver=" + receive_receiver + ", receive_title=" + receive_title
				+ ", p_route=" + p_route + ", receive_content=" + receive_content + ", receive_regdate="
				+ receive_regdate + "]";
	}


	
	
	
	
	
	
	
	
	
}
