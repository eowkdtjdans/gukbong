package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.member.MemberVO;
import com.spring.biz.message.MessageRecieveVO;
import com.spring.biz.message.MessageSendVO;
import com.spring.biz.message.MessageService;
import com.spring.biz.message.MessageVO;
@Controller
//@SessionAttributes("message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	public MessageController() {
		System.out.println("===== 메세지 컨트롤러 시작");
	}
	@RequestMapping(value="/noticeMessageJson.do", method=RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> noticeMessageJson(MessageRecieveVO receivevo) {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        
        count = messageService.noticeMessageJson(receivevo);
        map.put("cnt", count);
 
        return map;
    }
	
	@RequestMapping(value="/insertMessage.do", method=RequestMethod.GET) 
	public String insertMessageGet(MessageSendVO vo, @RequestParam("message_receiver") String message_receiver, HttpSession session) {
		System.out.println("인서트 메세지 =========== GET");
		System.out.println("message_receiver : " + message_receiver);
		session.setAttribute("message_receiver", message_receiver);
		return "views/message/MessageInsert.jsp";
	}
	
	
	@RequestMapping(value="/insertMessage.do", method=RequestMethod.POST)
	public String insertMessagePost(MessageVO vo, 
			@RequestParam("message_sender") String message_sender,
			@RequestParam("message_receiver") String message_receiver,
			@RequestParam("message_title") String message_title, 
			@RequestParam("message_content") String message_content, HttpSession session) throws Exception {
		
		System.out.println("message_sender : " + message_sender);
		System.out.println("message_receiver : " + message_receiver);
		System.out.println("message_title : " + message_title);
		System.out.println("message_content : " + message_content);
		
		
	
		
		System.out.println("인서트 메세지 =========== POST");
		vo.setMessage_sender(message_sender);
		vo.setMessage_receiver(message_receiver);
		vo.setMessage_title(message_title);
		vo.setMessage_content(message_content);
		
		messageService.insertMessage(vo);
		session.setAttribute("message", vo);
		return "redirect:/sub2.do";
	}
	
	@RequestMapping(value="/insertHostMessage.do", method=RequestMethod.GET) 
	public String insertHostMessageGet(MessageSendVO vo, @RequestParam("message_receiver") String message_receiver, HttpSession session) {
		System.out.println("인서트 메세지 =========== GET");
		System.out.println("message_receiver : " + message_receiver);
		session.setAttribute("message_receiver", message_receiver);
		return "views/message/MessageHostInsert.jsp";
	}
	
	
	@RequestMapping(value="/insertHostMessage.do", method=RequestMethod.POST)
	public String insertHostMessagePost(MessageVO vo, 
			@RequestParam("message_sender") String message_sender,
			@RequestParam("message_receiver") String message_receiver,
			@RequestParam("message_title") String message_title, 
			@RequestParam("message_content") String message_content, HttpSession session) throws Exception {
		
		System.out.println("message_sender : " + message_sender);
		System.out.println("message_receiver : " + message_receiver);
		System.out.println("message_title : " + message_title);
		System.out.println("message_content : " + message_content);
		
		
	
		
		System.out.println("인서트 메세지 =========== POST");
		vo.setMessage_sender(message_sender);
		vo.setMessage_receiver(message_receiver);
		vo.setMessage_title(message_title);
		vo.setMessage_content(message_content);
		
		messageService.insertMessage(vo);
		session.setAttribute("message", vo);
		return "redirect:/getHostList.do?cPage=1";
	}
	
	
	@RequestMapping(value="/insertTrevelersMessage.do", method=RequestMethod.GET) 
	public String insertTrevelersMessageGet(MessageSendVO vo, @RequestParam("message_receiver") String message_receiver, HttpSession session) {
		System.out.println("인서트 메세지 =========== GET");
		System.out.println("message_receiver : " + message_receiver);
		session.setAttribute("message_receiver", message_receiver);
		return "views/message/MessageTrevlersInsert.jsp";
	}
	
	
	@RequestMapping(value="/insertTrevelersMessage.do", method=RequestMethod.POST)
	public String insertTrevelersMessagePost(MessageVO vo, 
			@RequestParam("message_sender") String message_sender,
			@RequestParam("message_receiver") String message_receiver,
			@RequestParam("message_title") String message_title, 
			@RequestParam("message_content") String message_content, HttpSession session) throws Exception {
		
		System.out.println("message_sender : " + message_sender);
		System.out.println("message_receiver : " + message_receiver);
		System.out.println("message_title : " + message_title);
		System.out.println("message_content : " + message_content);
		
		
	
		
		System.out.println("트레블러인서트 메세지 =========== POST");
		vo.setMessage_sender(message_sender);
		vo.setMessage_receiver(message_receiver);
		vo.setMessage_title(message_title);
		vo.setMessage_content(message_content);
		
		messageService.insertMessage(vo);
		session.setAttribute("message", vo);
		return "redirect:/getTravelersList.do?cPage=1";
	}
	
	@RequestMapping(value="/MessageToAdmin.do", method=RequestMethod.POST)
	public String MessageToAdmin(MessageVO vo, @RequestParam("message_sender") String message_sender,
			@RequestParam("message_receiver") String message_receiver,
			@RequestParam("message_title") String message_title, 
			@RequestParam("message_content") String message_content, HttpSession session) throws Exception {
		
			vo.setMessage_sender(message_sender);
			vo.setMessage_receiver(message_receiver);
			vo.setMessage_title(message_title);
			vo.setMessage_content(message_content);
			
			messageService.insertMessage(vo);
			
			System.out.println(message_sender);
			System.out.println(message_receiver);
			System.out.println(message_title);
			System.out.println(message_content);
			
			session.setAttribute("messageToAdmin", vo);
		return "redirect:/sub2.do";
	}

	
	@RequestMapping(value="/getSendMessageList.do", method=RequestMethod.GET)
	public String getSendMessageList(MessageSendVO vo, Model model, HttpSession session) throws Exception {
		System.out.println("getSendMessageList.do ===== GET ");
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setSend_sender(member.getM_id());
		List<MessageSendVO> messageList = messageService.getSendMessageList(vo);
		session.setAttribute("messageList", messageList);
		//model.addAttribute("messageList", messageList);
		return "views/message/MessageGetSendList.jsp";
	}
	
	
	@RequestMapping(value="/getReceiveMessageList.do", method=RequestMethod.GET)
	public String getReceiveMessageList(MessageRecieveVO vo, Model model, HttpSession session) throws Exception {
		System.out.println("getReceiveMessageList.do ===== GET ");
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setReceive_receiver(member.getM_id());
		List<MessageRecieveVO> messageList = messageService.getReceiveMessageList(vo);
		session.setAttribute("messageList", messageList);
		//model.addAttribute("messageList", messageList);
		return "views/message/MessageGetReceiveList.jsp";
	}
	@RequestMapping(value="/getSendMessage.do", method=RequestMethod.GET)
	public String getSendMessage(MessageVO vo,MessageSendVO sendvo, Model model, @RequestParam("send_idx") int send_idx, HttpSession session) throws Exception {
		//model.addAttribute("message",messageService.getSendMessage(sendvo));
		session.setAttribute("message", messageService.getSendMessage(sendvo));
		sendvo.setSend_idx(send_idx);
		messageService.readSendMessage(sendvo);
		return "views/message/MessageGetSend.jsp";
	}

	@RequestMapping(value="/getReceiveMessage.do", method=RequestMethod.GET)
	public String getReceiveMessage(MessageVO vo,MessageRecieveVO receivevo, Model model, @RequestParam("receive_idx") int receive_idx, HttpSession session) throws Exception {
		//model.addAttribute("message",messageService.getReceiveMessage(receivevo));
		session.setAttribute("message", messageService.getReceiveMessage(receivevo));
		receivevo.setReceive_idx(receive_idx);
		messageService.readRecieveMessage(receivevo);
		return "views/message/MessaGetReceive.jsp";
	}
	
	
	@RequestMapping(value="/deleteReceiveMessage.do", method=RequestMethod.GET)
	public String deleteMessage(MessageVO vo, MessageRecieveVO receivevo, Model model) throws Exception {
		messageService.deleteReceiveMessage(receivevo);
		return "redirect:/getReceiveMessageList.do";
	}
	
	@RequestMapping(value="/deleteSendMessage.do", method=RequestMethod.GET)
	public String deleteMessage(MessageVO vo, MessageSendVO sendvo, Model model) throws Exception {
		messageService.deleteSendMessage(sendvo);
		return "redirect:/getSendMessageList.do";
	}
	
	
	
}