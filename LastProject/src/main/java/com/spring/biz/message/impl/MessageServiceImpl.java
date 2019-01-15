package com.spring.biz.message.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.message.MessageRecieveVO;
import com.spring.biz.message.MessageSendVO;
import com.spring.biz.message.MessageService;
import com.spring.biz.message.MessageVO;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;

	@Override
	public void insertMessage(MessageVO vo) {
		messageDAO.insertMessage(vo);
	}
	
	@Override
	public List<MessageVO> getAllMessageList(MessageVO vo) {
		return messageDAO.getAllMessageList(vo);
	}
	
	@Override
	public List<MessageSendVO> getSendMessageList(MessageSendVO vo) {
		return messageDAO.getSendMessageList(vo);
	}


	@Override
	public List<MessageRecieveVO> getReceiveMessageList(MessageRecieveVO vo) {
		return messageDAO.getReceiveMessageList(vo);
	}

	@Override
	public MessageVO getMessage(MessageVO vo) {
		return messageDAO.getMessage(vo);
	}

	@Override
	public void deleteMessege(MessageVO vo) {
		messageDAO.deleteMessage(vo);
	}

	@Override
	public MessageSendVO getSendMessage(MessageSendVO vo) {
		return messageDAO.getSendMessage(vo);
	}

	@Override
	public MessageRecieveVO getReceiveMessage(MessageRecieveVO vo) {
		return messageDAO.getReceiveMessage(vo);
	}

	@Override
	public void deleteSendMessage(MessageSendVO sendvo) {
		messageDAO.deleteSendMessage(sendvo);
	}

	@Override
	public void deleteReceiveMessage(MessageRecieveVO receivevo) {
		messageDAO.deleteReceiveMessage(receivevo);
	}

	@Override
	public void readMessage(MessageVO vo) {
		messageDAO.readMessage(vo);
	}

	@Override
	public void readSendMessage(MessageSendVO sendvo) {
		messageDAO.readSendMessage(sendvo);
	}

	@Override
	public void readRecieveMessage(MessageRecieveVO receivevo) {
		messageDAO.readReceiveMessage(receivevo);
	}

	@Override
	public MessageRecieveVO getReceiveMessage2(MessageRecieveVO receivevo, HttpSession session) {
		return messageDAO.getReceiveMessage2(receivevo);
	}

	@Override
	public int noticeMessageJson(MessageRecieveVO receivevo) {
		return messageDAO.noticeMessageJson(receivevo);
	}

	@Override
	public List<MessageRecieveVO> getAdminReceiveMessageList(MessageRecieveVO vo) {
		return messageDAO.getAdminReceiveMessageList(vo);
	}



	
	
	
}
