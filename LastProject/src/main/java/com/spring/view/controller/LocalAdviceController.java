package com.spring.view.controller;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.biz.localAdvice.LocalAdviceService;
import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.localAdviceComment.LocalAdviceCommentService;
import com.spring.biz.localAdviceComment.LocalAdviceCommentVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profileImage.ProfileImageVO;
import com.spring.pagination.PagingVO;

@Controller 
@SessionAttributes({"key", "getLocalAdviceCommentList"})
public class LocalAdviceController {
   HttpSession session;
   @Autowired
   private LocalAdviceService localAdviceService;
   @Autowired
   private LocalAdviceCommentService localAdviceCommentService;
   
   //키값을 받아 localAdvice게시판 전체조회
   @RequestMapping(value="/getLocalAdviceList.do" , method=RequestMethod.POST)
   public String getLocalAdviceList(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage, HttpSession session, RedirectAttributes rttr) {
      System.out.println("getLocalAdviceList.do로 왔습니다.");
      PagingVO p = new PagingVO();
      p.setNumPerPage(10);
      p.setPagePerBlock(10);
      int countLocalAdvice = localAdviceService.countLocalAdvice(key);  //'서울'이라는 키워드에 해당하는 게시글 수
      p.setTotalRecord(countLocalAdvice);  //토탈레코드는 총 게시글 수
      p.setTotalPage();  // 22개의게시글수(totalRecord) / 10(numPerpage) 2.2 소수점 나오면 3으로 나옴
      
      if (cPage != null) {
         p.setNowPage(Integer.parseInt(cPage));  //현재페이지는 1페이지 sub컨트롤러에서 cPage=1 넘김
      }

      p.setEnd(p.getNowPage() * p.getNumPerPage());  //현재 페이지상의 끝 글번호(동적생성 row번호)  1*10=10
      p.setBegin(p.getEnd() - p.getNumPerPage() + 1);  //현재 페이지상의 시작 글번호(동적생성 row번호)  10-10+1=1
            
      int nowPage = p.getNowPage();
      p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);  //현재 블록의 시작 페이지 번호 
      p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);  //현재 블록의 끝 페이지 번호
      
      if (p.getEndPage() > p.getTotalPage()) {
         p.setEndPage(p.getTotalPage());
      }
      
      Map<String, Object> map = new HashMap<>();
      map.put("begin", p.getBegin());
      map.put("end", p.getEnd());
      map.put("key", key);
      
      List<LocalAdviceVO> localAdviceList = localAdviceService.getLocalAdviceList(map);
      rttr.addFlashAttribute("localAdviceList", localAdviceList);
      model.addAttribute("localAdviceList", localAdviceList);
      model.addAttribute("countLocalAdvice", countLocalAdvice);
      model.addAttribute("pvo", p);
      System.out.println("localAdviceList : " + localAdviceList);
      
      session.setAttribute("cPage", cPage);
      System.out.println(localAdviceList.toString());
      return "/views/localAdvice/localAdvice.jsp";
   
   }
   
   /*@RequestMapping(value="/localAdviceListgo.do")
   public String localAdviceListgo() {
	   System.out.println("localAdviceListgo로 옴");
	   
	   return "/views/localAdvice/localAdvice.jsp";
   }*/
   
   
   
   @RequestMapping(value="/getLocalAdviceList2.do" , method=RequestMethod.GET)
   public String getLocalAdviceList2(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage, HttpSession session) {
      System.out.println("getLocalAdviceList2.do로 왔습니다.");
      PagingVO p = new PagingVO();
      p.setNumPerPage(10);
      p.setPagePerBlock(10);
      int countLocalAdvice = localAdviceService.countLocalAdvice(key);
      p.setTotalRecord(countLocalAdvice);
      p.setTotalPage();
      
      if (cPage != null) {
         p.setNowPage(Integer.parseInt(cPage));
      }
      
      p.setEnd(p.getNowPage() * p.getNumPerPage());
      p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
            
      int nowPage = p.getNowPage();
      p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
      p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
      
      if (p.getEndPage() > p.getTotalPage()) {
         p.setEndPage(p.getTotalPage());
      }
      
      Map<String, Object> map = new HashMap<>();
      map.put("begin", p.getBegin());
      map.put("end", p.getEnd());
      map.put("key", key);
      
      List<LocalAdviceVO> localAdviceList = localAdviceService.getLocalAdviceList(map);
      
      model.addAttribute("localAdviceList", localAdviceList);
      model.addAttribute("countLocalAdvice", countLocalAdvice);
      model.addAttribute("pvo", p);
      
      session.setAttribute("cPage", cPage);
      
      return "/views/localAdvice/localAdvice.jsp";
   
   }
   
   
   //localAdvice에서 게시글작성 버튼누르면 작성페이지로 이동
   //, method=RequestMethod.GET
   @RequestMapping(value="/writeLocalAdvice.do")
   public String moveWriteLocalAdvice() {
      return "/views/localAdvice/insertLocalAdvice.jsp";	   
   }
   
   
   
   //여기에는 localAdvice게시글작성하고 저장버튼 눌렀을때
   //@RequestMapping(value="/insertLocalAdvice.do")
   @RequestMapping(value="insertLocalAdvice.do")
   public String moveInsertLocalAdvice(LocalAdviceVO vo, HttpSession session, @RequestParam("m_address") String m_address, @RequestParam("l_subject") String l_subject, @RequestParam("l_content") String l_content) {
      System.out.println("게시글 등록");
      MemberVO mvo = (MemberVO)session.getAttribute("member");
      mvo.getM_id();
      System.out.println(mvo.getM_id());
      vo.setM_id(mvo.getM_id());
      vo.setL_subject(l_subject);
      vo.setL_content(l_content);
      vo.setM_address(m_address);
      localAdviceService.insertLocalAdvice(vo);
      
      session.getAttribute("searchCondition");
      session.getAttribute("searchKeyword");
      return "/getLocalAdviceList.do?cPage=1";
   }
   
   
   
   
   //로컬어드바이스 게시판에서 상세화면페이지로 이동
   @RequestMapping(value="/getLocalAdvice.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String moveGetLocalAdvice(LocalAdviceVO vo,LocalAdviceCommentVO cvo, Model model, @RequestParam("l_idx") String l_idx, @RequestParam("m_id") String m_id, HttpSession session, RedirectAttributes rttr) {
	 System.out.println("로컬어드바이스게시판에서 -> 상세페이지");   
	 
      Map<String, Object> map = new HashMap<>();
      map.put("l_idx", l_idx);
      System.out.println(l_idx);
        
      vo.setL_idx(Integer.parseInt(l_idx));
      LocalAdviceVO getLocalAdvice = localAdviceService.getLocalAdvice(vo);      
      model.addAttribute("getLocalAdvice", getLocalAdvice);

      List<LocalAdviceCommentVO> getLocalAdviceCommentList = localAdviceCommentService.getLocalAdviceCommentList(map);
      model.addAttribute("getLocalAdviceCommentList", getLocalAdviceCommentList);
      
      session.setAttribute("getLocalAdvice", getLocalAdvice);
      session.setAttribute("getLocalAdviceCommentList", getLocalAdviceCommentList);
      
      
      //모델에 담김내용을 리다이렉트어트리뷰터에 넣어줌
      rttr.addFlashAttribute("getLocalAdvice", getLocalAdvice);
      rttr.addFlashAttribute("getLocalAdviceCommentList", getLocalAdviceCommentList);
      //rttr.addFlashAttribute("l_idx", l_idx);
      System.out.println(getLocalAdviceCommentList);
      
      //여기는 상세페이지 들어오면 해당 게시글 조회수 1씩 증가
      localAdviceService.localAdviceCount(l_idx);
      System.out.println("조회수증가되게찌;;");
      
      //return "redirect:/getLocalAdvicego.do";
      return "/views/localAdvice/getLocalAdvice.jsp";
   }
   
   
   /*@RequestMapping(value="/getLocalAdvicego.do", method = RequestMethod.GET)
   public String getLocalAdvicego() {
	   System.out.println("리다이렉트하는 getLocalAdvicego");
	   
	   //System.out.println("getLocalAdvice : " + getLocalAdvice);
	   //System.out.println("getLocalAdviceCommentList : " + getLocalAdviceCommentList);
	   
	   return "/views/localAdvice/getLocalAdvice.jsp";
   }*/
   
   
   
   
   //localAdvice게시글 수정페이지로 페이지이동
   @RequestMapping(value="/updateLocalAdvice.do", method=RequestMethod.GET)
   public String updateLocalAdviceList(LocalAdviceVO vo, ProfileImageVO pvo, HttpSession session, Model model, @RequestParam("l_idx") String l_idx) {   
      System.out.println("/updateLocalAdvice.do 겟방식");
      String m_id = (String)session.getAttribute("m_id");
      System.out.println("m_id가무어니?" + m_id);
      System.out.println("l_idx가무어니?" + l_idx);
      vo.setL_idx(Integer.parseInt(l_idx));
      pvo.setM_id(m_id);
      
      LocalAdviceVO getLocalAdvice = localAdviceService.getLocalAdvice(vo);
      ProfileImageVO getProfileImage = localAdviceService.getProfileImage(pvo);
      
      model.addAttribute("getLocalAdvice", getLocalAdvice);
      model.addAttribute("getProfileImage", getProfileImage);
      return "/views/localAdvice/updateLocalAdvice.jsp";
   }
   
   //localAdvice게시글 수정
   @RequestMapping(value="/updateLocalAdvice.do", method=RequestMethod.POST)
   public String updateLocalAdviceList(LocalAdviceVO vo, @RequestParam("l_subject") String l_subject,  @RequestParam("l_content") String l_content, @RequestParam("l_idx") int l_idx, HttpSession session ) {
      System.out.println("/updateLocalAdvice.do 포스트방식");
      System.out.println("옙");
      System.out.println("l_idx가몽미 : " + l_idx);
      
      localAdviceService.updateLocalAdvice(vo);
      
      String m_id = (String)session.getAttribute("m_id");
      System.out.println("m_id가몽미 : " + m_id);
      //return "/getLocalAdviceList.do?cPage="+cPage;
      return "redirect:/getLocalAdvice.do?&m_id="+m_id+"&l_idx="+l_idx;
   }
   
   
   //댓글 입력
   @RequestMapping(value="/insertLocalAdviceComment.do",method = {RequestMethod.GET, RequestMethod.POST})
   public String insertLocalAdviceComment(LocalAdviceCommentVO vo, @RequestParam("l_idx") String l_idx, String lc_content, HttpSession session) {
      MemberVO mvo = (MemberVO)session.getAttribute("member");
      
      System.out.println("댓글입력 컨트롤러");
      System.out.println(l_idx);
      System.out.println(lc_content);
      System.out.println("insertLocalAdviceComment.do에서 실행됨: " + mvo.getM_id());
      System.out.println(mvo.getM_id());
      
      
      String m_id2 = mvo.getM_id();
      
      System.out.println("1");
      vo.setL_idx(Integer.parseInt(l_idx));
      vo.setLc_content(lc_content);
      vo.setM_id(m_id2);
      System.out.println("2");
      
  /*    INSERT INTO L_COMMENT (LC_IDX, L_IDX, M_ID, LC_DATE, LC_CONTENT, LC_COMMENTCOUNT)
		VALUES (L_COMMENT_SEQ.NEXTVAL, #{l_idx}, #{m_id}, SYSDATE, #{lc_content}, 100)*/
      
      localAdviceCommentService.insertLocalAdviceComment(vo);
      System.out.println("3");
      int l_idx2 = Integer.parseInt(l_idx);
      System.out.println("4");
      localAdviceService.updateLocalAdviceCnt(l_idx2);
      
      System.out.println("잘되고 잉니?");
      return "redirect:/getLocalAdvice.do?m_id="+mvo.getM_id()+"&l_idx="+l_idx;
   }
   
   
   //댓글 수정
   @RequestMapping(value="/updateLocalAdviceComment.do")
   public String updateLocalAdviceComment(@RequestParam("lc_idx") String lc_idx, @RequestParam("m_id") String m_id, @RequestParam("lc_content") String lc_content, @RequestParam("l_idx") String l_idx, LocalAdviceCommentVO vo, HttpSession session, HttpServletRequest request) {
      System.out.println("/updateLocalAdviceComment.do 요기");
      System.out.println("lc_idx : " + lc_idx);
      System.out.println("m_id : " + m_id);
      System.out.println("lc_content : " + lc_content);
      vo.setM_id(m_id);
      vo.setLc_idx(Integer.parseInt(lc_idx));
      vo.setLc_content(lc_content);
      vo.setL_idx(Integer.parseInt(l_idx));
     
      String focus_idx = request.getParameter("focus_idx");
      session.setAttribute("focus_idx", focus_idx);
      
      session.setAttribute("updateJson", vo);
      localAdviceCommentService.updateLocalAdviceComment(vo);
      
     return "redirect:/getLocalAdvice.do?l_idx="+vo.getL_idx()+"&m_id="+vo.getM_id();
     
   }
   

   //ajax 댓글수정 카운트주기
   @RequestMapping(value="/updateLocalAdviceCommentJson.do" ,method=RequestMethod.POST)
   @ResponseBody
   public Map<Object, Object> checkMemberJson(@RequestBody String lc_idx, LocalAdviceCommentVO vo) {
       System.out.println("제이슨방식 댓글수정");
       
       int count = 0;
       Map<Object, Object> map = new HashMap<Object, Object>();
       vo.setLc_idx(Integer.parseInt(lc_idx));
       count = localAdviceCommentService.updateLocalAdviceCommentJson(vo);
       map.put("cnt", count);
       System.out.println(map);
       return map;
   }
   
   
   //ajax 댓글삭제 
   @RequestMapping(value="/deleteLocalAdviceCommentJson.do" ,method=RequestMethod.POST)
   @ResponseBody
   public Map<Object, Object> deleteLocalAdviceComment(@RequestBody String lc_idx, LocalAdviceCommentVO vo, @RequestParam String l_idx) {
	   System.out.println("ajax로 댓글delete하는 컨트롤러");
	   System.out.println("lc_idx : " + lc_idx);
	   System.out.println("l_idx : " + l_idx);
	   localAdviceCommentService.deletedetdetall(lc_idx);
	   
	   Map<Object, Object> map = new HashMap<Object, Object>();
	   map.put("lc_idx", lc_idx);
	   
	   vo.setLc_idx(Integer.parseInt(lc_idx));
	   localAdviceCommentService.deleteLocalAdviceComment(vo);
	   localAdviceService.updateLocalAdviceCntMinus(Integer.parseInt(l_idx));
	   System.out.println("마지막부분");
	   return map;
   }


	//게시글삭제
	@RequestMapping(value="/deleteLocalAdvice.do" ,method=RequestMethod.GET)
	public String deleteLocalAdvice(LocalAdviceVO vo, LocalAdviceCommentVO cvo, @RequestParam("l_idx") String l_idx) {
		System.out.println("게시글삭제");
		System.out.println("l_idx : " + l_idx);
		cvo.setL_idx(Integer.parseInt(l_idx));
		vo.setL_idx(Integer.parseInt(l_idx));
		
		localAdviceCommentService.deleteLocalAdviceCommentAll(vo);
		localAdviceService.deleteLocalAdvice(vo);
		
		return "redirect:/getLocalAdviceList2.do?cPage=1";
	}

	
	//좋아요기능(+)
	@RequestMapping(value="/goodJson.do" ,method=RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> goodLocalAdvice(@RequestBody String l_idx) {
	    System.out.println("ajax로 추천수good컨트롤");
	    System.out.println("l_idx : " + l_idx);
	    //Map<Object, Object> map = new HashMap<Object, Object>();
	    //map.put("l_idx", l_idx);
	    
	    int count = localAdviceService.goodLocalAdvice(Integer.parseInt(l_idx));  //실질적으로 좋아요 증가시키는 메소드
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("count", count);
	    System.out.println("마지막부분");
	    return map;
    }
	
	
	//좋아요기능(-)
	@RequestMapping(value="/badJson.do" ,method=RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> badLocalAdvice(@RequestBody String l_idx) {
	    System.out.println("ajax로 추천수bad컨트롤");
	    System.out.println("l_idx : " + l_idx);
	    
	    int count = localAdviceService.badLocalAdvice(Integer.parseInt(l_idx));  //실질적으로 좋아요 증가시키는 메소드
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("count", count);
	    System.out.println("마지막부분");
	    return map;
    }
	
	
	//ajax 댓글에댓글
	@RequestMapping(value="/json_insertComment.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> JsonInsertComment(@RequestBody String lc_idx, @RequestParam("lc_content") String lc_content, @RequestParam("l_idx") String l_idx, LocalAdviceCommentVO vo, ProfileImageVO pvo, HttpSession session){
		System.out.println("ajax로 댓글에 댓글 insert");
		System.out.println("lc_idx : " + lc_idx);
		System.out.println("lc_content : " + lc_content);
		System.out.println("l_idx : " + l_idx);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		//map.put("lc_idx", lc_idx);
		//map.put("lc_content", lc_content);
		System.out.println(map);
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		String m_id = mvo.getM_id();
		System.out.println("m_id : " + m_id);

		vo.setL_idx(Integer.parseInt(l_idx));
		vo.setM_id(m_id);
		vo.setLc_content(lc_content);
		vo.setLc_idx(Integer.parseInt(lc_idx));
		localAdviceCommentService.insertdetdetComment(vo);
		int detdetlc_idx = localAdviceCommentService.detdetlc_idx();
		System.out.println("detdetlc_idx : "+ detdetlc_idx );
		map.put("detdetlc_idx", detdetlc_idx);
		
		pvo.setM_id(m_id);
		String p_route = localAdviceCommentService.selectImage(pvo);
		map.put("p_route", p_route);
		
		vo.setLc_idx(Integer.parseInt(lc_idx));
		List<LocalAdviceCommentVO> selectdetdetComment = localAdviceCommentService.selectdetdetComment(vo);
		System.out.println("selectdetdetComment : " + selectdetdetComment);
		map.put("selectdetdetComment", selectdetdetComment);

		//Iterator<LocalAdviceCommentVO> itr = selectdetdetComment.iterator();
	
		map.put("m_id", m_id);
		
		localAdviceService.updateLocalAdviceCnt(Integer.parseInt(l_idx));
		//int detdetnum = localAdviceCommentService.selectdetdet(lc_content);
		//map.put("detdetnum", detdetnum);
		
		System.out.println(map);
		return map;
	}
	
	
	@RequestMapping(value="/updatedetdet.do" ,method=RequestMethod.POST)
    @ResponseBody
    public LocalAdviceCommentVO updatedetdet(@RequestBody String detdetlc_idx) {
	    System.out.println("ajax로 updatedetdet");
	    System.out.println("lc_idx : " + detdetlc_idx);
	    
	    List<LocalAdviceCommentVO> detdetList = localAdviceCommentService.selectdetdetList(detdetlc_idx);
	    System.out.println("detdetList : " + detdetList);
	   
	    //Map<Object, Object> map = new HashMap<Object, Object>();
	    //map.put("detdetList", detdetList);
	    return detdetList.get(0);
    }
	
	
	@RequestMapping(value="/updatedetdetgo.do" ,method=RequestMethod.POST)
    @ResponseBody
    public LocalAdviceCommentVO updatedetdetgo(@RequestBody String detdetlc_idx, @RequestParam("lc_content") String lc_content, LocalAdviceCommentVO vo) {
	    System.out.println("ajax로 updatedetdetgo");
	    System.out.println("detdetlc_idx : " + detdetlc_idx);
	    System.out.println("수정된 lc_content : " + lc_content);
	    
	    vo.setLc_idx(Integer.parseInt(detdetlc_idx));
	    vo.setLc_content(lc_content);
	    
	    localAdviceCommentService.updatedetdet(vo);
	    
	    List<LocalAdviceCommentVO> detdetList = localAdviceCommentService.selectdetdetList(detdetlc_idx);
	    System.out.println("detdetList : " + detdetList);
	   
	    //Map<Object, Object> map = new HashMap<Object, Object>();
	    //map.put("detdetList", detdetList);
	    return detdetList.get(0);
    }
	
	
	@RequestMapping(value="/deletedetdetgo.do" ,method=RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> deletedetdetgo(@RequestBody String detdetlc_idx, LocalAdviceCommentVO vo) {
		System.out.println("여기는 deletedetdet 부분");
		System.out.println("detdetlc_idx : " + detdetlc_idx);
		
		vo.setLc_idx(Integer.parseInt(detdetlc_idx));
		localAdviceCommentService.deletedetdet(vo);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("detdetlc_idx", detdetlc_idx);
		
		return map;
    }
	
	
	
}










