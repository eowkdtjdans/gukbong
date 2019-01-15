package com.spring.biz.WebSocket.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.WebSocket.WebSocketVO;

@Repository("webSocketDAO")
public class WebSocketDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public Object webSocketDAO;
	public void insertWebSocketChatting(WebSocketVO vo) {
		mybatis.insert("insertWebSocketChatting", vo);
	}
	
	
	
	
	
}
