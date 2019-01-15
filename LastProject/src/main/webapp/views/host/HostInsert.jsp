<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/views/bootstrapModal/css/bootstrap.min.css">

<link rel="stylesheet" href="/views/datepicker/public/theme/css/t-datepicker.min.css">
<link rel="stylesheet" href="/views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
<!-- blue, bluegrey, cyan, green, lime, main, orange, purple, teal, yellow -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/views/datepicker/public/theme/js/t-datepicker.min.js"></script>

<script>
   function insertHost(frm) {
      
       var str = $("#form").serialize();
       alert(str);
        $.ajax({
         async : true,
         type : "POST",
         dataType : "json",
         data : str,
         url : "../../checkHostJson.do",
         success : function(data) {
            if (data.cnt == 0) {
               alert("적은 글 없음");
                if (frm.h_maximumguest =="choose") {
            	   alert("최대수용인원");
               } 
           		frm.action = "../../insertHost.do";
               frm.submit(); 
             } else {
               alert("data.cnt : " + data.cnt);
               alert("적은 글 있음");
               /* frm.action = "../../modifyProfile.do";
               frm.submit();  */
               return false;
            }
         } 
      });  
   };
   
</script>

<script>
/* picker만 생성 */
$(document).ready(function(){
   $('.t-datepicker').tDatePicker({
     autoClose:true,
     durationArrowTop:200,
     limitDateRanges:61,
     numCalendar:2,
     titleCheckIn:'입실날짜',
     titleCheckOut:'퇴실날짜',
     titleDateRange:'일',
     titleDateRanges:'일',
     titleToday:'오늘',
     titleDays:['월','화','수','목','금','토','일'],
     titleMonths:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
     toDayShowTitle:true,
     dateRangesShowTitle:true,
     dateRangesHover:true,
     toDayHighlighted:true,
     dateDisabled:[false]
   }).on('eventClickDay',function(e, dataDate){
     var getDateInput = $('.t-datepicker').tDatePicker('getDateInputs');
      document.getElementById("h_startdate").value = getDateInput[0];
      document.getElementById("h_enddate").value = getDateInput[1];
   });
   
});
</script>

</head>
<body>
      <div class="col-md-9">
          <div class="card">
              <div class="card-body">
                  <div class="row">
                      <div class="col-md-12">
                          <h4>호스트 등록</h4>
                          <hr>
                      </div>
                  </div>
                  
                  
                  <div class="row">
                      <div class="col-md-12">
                       <form method="POST" id="form">
                             <input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">
                             
                               <div class="form-group row">
                                <label for="h_maximumguest" class="col-4 col-form-label">최대 투숙객</label> 
                                <div class="col-8">
                                   <select class="form-control" id="h_maximumguest" name="h_maximumguest">
                                  <option selected="selected">1</option>
                                  <option>2</option>
                                  <option>3</option>
                                  <option>4</option>
                             </select>
                                                          
                                </div>
                              </div>
                              
                              <div class="form-group row">
                                <label for="h_gender" class="col-4 col-form-label">선호 성별</label> 
                                <div class="col-8">
                                   <select class="form-control" id="h_gender" name="h_gender">
                                 	 <option selected="selected">남자</option>
                              		 <option>여자</option>
                          </select>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="h_smoke" class="col-4 col-form-label">흡연 가능 여부</label> 
                                <div class="col-8">
                                    <select class="form-control" id="h_smoke" name="h_smoke">
                               		 <option selected="selected">X</option>
                                 	 <option>O</option>
                             </select>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="h_roomtype" class="col-4 col-form-label">방 종류</label> 
                                <div class="col-8">
                                    <select class="form-control" id="h_roomtype" name="h_roomtype">
		                               <option selected="selected">싱글 베드</option>
		                               <option>더블 베드</option>
		                               <option>퀸 베드</option>
		                                  <option>소파</option>
                          </select>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_rule" class="col-4 col-form-label">숙소 이용시 주의사항</label> 
                                <div class="col-8">
                                   <textarea rows="5" cols="10" id="h_rule" name="h_rule" class="form-control"></textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_startdate" class="col-4 col-form-label">입실/퇴실 날짜</label> 
                              <div class="col-8">
                               <div class="t-datepicker">
	                          <div class="t-check-in"></div>
	                          <div class="t-check-out"></div>
	                        </div>
                        </div>
                              
                                <input id="h_startdate" type="hidden" class="form-control" name="h_startdate" required data-eye> 
                                <input id="h_enddate" type="hidden" class="form-control" name="h_enddate" required data-eye> 
                              </div>
                              
                              <div class="form-group row">
                                <label for="h_haspet" class="col-4 col-form-label">펫 유무</label> 
                                <div class="col-8">
                                    <select class="form-control" id="h_haspet" name="h_haspet">
                                       
	                               		<option selected="selected">X</option>
	                                  	<option>O</option>
                             </select>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_haschild" class="col-4 col-form-label">자녀 유무</label> 
                                <div class="col-8">
                                    <select class="form-control" id="h_haschild" name="h_haschild">
	                               	      <option selected="selected">X</option>
		                                  <option>O</option>
                             </select>
                                </div>
                              </div>
                              
                               <div class="form-group m-0">
                                   <button type="button" class="btn btn-primary btn-block" onclick="insertHost(this.form)" >
                              호스트등록
                           </button>
                              </div>
                            
                          
                            </form>
                      </div>
                  </div>
                  
              </div>
          </div>
      </div>
<script src="js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>