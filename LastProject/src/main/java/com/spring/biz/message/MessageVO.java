package com.spring.biz.message;

import java.util.Date;

public class MessageVO {
	
	private int message_idx;
	private String message_sender;
	private String message_receiver;
	private String message_title;
	private String message_content;
	private String message_read;
	private Date message_regdate;
	public int getMessage_idx() {
		return message_idx;
	}
	public void setMessage_idx(int message_idx) {
		this.message_idx = message_idx;
	}
	public String getMessage_sender() {
		return message_sender;
	}
	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}
	public String getMessage_receiver() {
		return message_receiver;
	}
	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_read() {
		return message_read;
	}
	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}
	public Date getMessage_regdate() {
		return message_regdate;
	}
	public void setMessage_regdate(Date message_regdate) {
		this.message_regdate = message_regdate;
	}
	@Override
	public String toString() {
		return "MessageVO [message_idx=" + message_idx + ", message_sender=" + message_sender + ", message_receiver="
				+ message_receiver + ", message_title=" + message_title + ", message_content=" + message_content
				+ ", message_read=" + message_read + ", message_regdate=" + message_regdate + "]";
	}
	
	
	
	
	
	
	
	
}
