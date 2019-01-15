package com.spring.biz.WebSocket;

import java.sql.Date;

public class WebSocketVO {
private String c_sender, c_context, c_receiver;
private Date c_insertdate;
public String getC_sender() {
	return c_sender;
}
public void setC_sender(String c_sender) {
	this.c_sender = c_sender;
}
public String getC_context() {
	return c_context;
}
public void setC_context(String c_context) {
	this.c_context = c_context;
}
public String getC_receiver() {
	return c_receiver;
}
public void setC_receiver(String c_receiver) {
	this.c_receiver = c_receiver;
}
public Date getC_insertdate() {
	return c_insertdate;
}
public void setC_insertdate(Date c_insertdate) {
	this.c_insertdate = c_insertdate;
}


}
