package com.spring.view.controller;
import java.util.ArrayList;
import java.util.List;
 
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.WebSocket.WebSocketVO;
import com.spring.biz.WebSocket.WebSocketchatService;
import com.spring.biz.member.MemberVO;

import javax.websocket.RemoteEndpoint.Basic;
 
@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocketController {
    
	@Autowired
	WebSocketchatService webSocketchatService;
	
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
    public WebSocketController() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    @RequestMapping(value="/chat.do")
    public String getChatViewPage(ModelAndView mav) {
        return "views/chat.jsp";
    }
    @RequestMapping(value="insertChatDB.do")
    public String insertChatDB(WebSocketVO vo) {
    		
    		System.out.println(vo.getC_sender());
    		System.out.println(vo.getC_receiver());
    		System.out.println(vo.getC_context());
    		webSocketchatService.insertWebSocketChatting(vo);
    	return "redirect:/chat.do";
    }
    
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("==============[웹소켓 커넥션 성공!]==============");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
/*
 * 모든 사용자에게 메시지를 전달한다.
 * @param self
 * @param message
*/     
    private void sendAllSessionToMessage( Session ss,String message) {
        try {
        	System.out.println("WebSocketController.sessionList : " + WebSocketController.sessionList);
        	System.out.println("ss.getId() : " + ss.getId());
        	
            for(Session session : WebSocketController.sessionList) {
                if(!ss.getId().equals(session.getId())) {
                	session.getBasicRemote().sendText(message);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    @OnMessage
    public void onMessage(String message,Session session) {
        try {
        	final Basic basic=session.getBasicRemote();
            basic.sendText(message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, message);
       
    }
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}