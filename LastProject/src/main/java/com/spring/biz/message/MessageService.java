package com.spring.biz.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MessageService {

	void insertMessage(MessageVO vo);


	List<MessageSendVO> getSendMessageList(MessageSendVO vo);

	List<MessageRecieveVO> getReceiveMessageList(MessageRecieveVO vo);
	
	List<MessageVO> getAllMessageList(MessageVO vo);
	
	MessageVO getMessage(MessageVO vo);


	


	MessageSendVO getSendMessage(MessageSendVO vo);

	MessageRecieveVO getReceiveMessage(MessageRecieveVO vo);

	void deleteMessege(MessageVO vo);
	
	void deleteSendMessage(MessageSendVO sendvo);

	void deleteReceiveMessage(MessageRecieveVO receivevo);


	void readMessage(MessageVO vo);


	void readSendMessage(MessageSendVO sendvo);


	void readRecieveMessage(MessageRecieveVO receivevo);


	MessageRecieveVO getReceiveMessage2(MessageRecieveVO receivevo, HttpSession session);


	 int noticeMessageJson(MessageRecieveVO receivevo);


	List<MessageRecieveVO> getAdminReceiveMessageList(MessageRecieveVO vo);











	
}
