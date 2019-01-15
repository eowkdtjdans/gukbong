 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹소켓 채팅</title>
</head>
<body onload="openSocket();">
    <div>
        <input type="hidden" id="sender" value="${member.m_id }" style="display: none;"> 
        <input type="text" id="messageinput">
    </div>
    
    
    
    <div>
        
        <button type="button" onclick="send();">메세지 보내기</button>
        <button type="button" onclick="closeSocket();">그만 하기</button>
        
        
        
    </div>
    
    
    
    <div id="messages"></div>
    
    
    
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("웹소켓은 이미 '오픈'상태 입니다");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://203.236.209.187:8080/echo.do");
            
            ws.onopen=function(event){
               
            	if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("커넥션 연결 종료");
            }
        }
        function send(){
             var text = document.getElementById("sender").value+" : "+document.getElementById("messageinput").value;  
            ws.send(text);
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }
  </script>
</body>
</html> 
