package com.spring.biz.message.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.message.MessageRecieveVO;
import com.spring.biz.message.MessageSendVO;
import com.spring.biz.message.MessageVO;

@Repository("messageDAO")
public class MessageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	public Object messageDAO;
	
	public void insertMessage(MessageVO vo) {
		mybatis.insert("insertMessage", vo);
	}
	public List<MessageVO> getAllMessageList(MessageVO vo) {
		return mybatis.selectList("getAllMessageList", vo);
	}
	public List<MessageSendVO> getSendMessageList(MessageSendVO vo) {
		return mybatis.selectList("getSendMessageList", vo);
	}
	public List<MessageRecieveVO> getReceiveMessageList(MessageRecieveVO vo) {
		return mybatis.selectList("getReceiveMessageList", vo);
	}
	public MessageVO getMessage(MessageVO vo) {
		return mybatis.selectOne("getMessage", vo);
	}
	public Object deleteMessage(MessageVO vo) {
		return mybatis.delete("deleteMessage", vo);
	}
	public MessageSendVO getSendMessage(MessageSendVO vo) {
		return mybatis.selectOne("getSendMessage", vo);
	}
	public MessageRecieveVO getReceiveMessage(MessageRecieveVO vo) {
		return mybatis.selectOne("getReceiveMessage", vo);
	}
	public Object deleteReceiveMessage(MessageRecieveVO receivevo) {
		return mybatis.delete("deleteReceiveMessage", receivevo);
	}
	public Object deleteSendMessage(MessageSendVO sendvo) {
		return mybatis.delete("deleteSendMessage", sendvo);
	}
	public void readMessage(MessageVO vo) {
		mybatis.update("readMessage", vo);
	}
	public void readSendMessage(MessageSendVO sendvo) {
		mybatis.update("readSendMessage", sendvo);
	}
	public void readReceiveMessage(MessageRecieveVO receivevo) {
		mybatis.update("readReceiveMessage", receivevo);
	}
	public MessageRecieveVO getReceiveMessage2(MessageRecieveVO receivevo) {
		return mybatis.selectOne("MessageReceiveVO", receivevo);
	}
	public int noticeMessageJson(MessageRecieveVO receivevo) {
		return mybatis.selectOne("noticeMessageJson", receivevo);
	}
	public List<MessageRecieveVO> getAdminReceiveMessageList(MessageRecieveVO vo) {
		return mybatis.selectList("getAdminReceiveMessageList", vo);
	}

	
}
