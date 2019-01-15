 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹소켓 채팅</title>
</head>
<body onload="openSocket();">
   <form  onsubmit="return false" method="POST" id="form"  >
    <div>
        <input type="hidden" id="sender" value="${member.m_id }" style="display: none;"> 
        <input type="text" id="message">
        <input type="hidden" id="receiver" value="admin" />
    </div>
    
    
<button type="submit" id="loginBtn" class="btn btn-primary btn-block" onclick="send();" >
	메세지 보내기
</button> 
     <button type="button" onclick="closeSocket();">그만 하기</button>    
    <div>
    </div>
 </form>   
    
    
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
        	if(ws.readyState == 1) {
             var text = document.getElementById("sender").value+" : "+document.getElementById("message").value;  
				insertDB();
             if(text) {
			             ws.send(text);
             document.getElementById("message").value="";
            	}
            }
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }

        function insertDB() {
        	var id = $("#sender").val();
			var message = $("#message").val();
        	var receiver = $("#receiver").val();
			console.log(id);
			console.log(receiver);
			console.log(message);
			var str = $("#form").serialize();
			alert(str);
			  location.href = "insertChatDB.do?c_sender="+id+"&c_context="+message+"&c_receiver="+receiver; 
			 	
			  /*$.ajax({
			 		async : true,
			 		type : 'GET',
			 		dataType : 'json',
			 		data : 
			 	}) */
        }
        
        </script>
  
  
</body>
</html> 
