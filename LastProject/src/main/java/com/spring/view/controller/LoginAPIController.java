package com.spring.view.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.biz.loginAPI.NaverLoginBO;
@SessionAttributes("result")
@Controller
public class LoginAPIController {
   
   @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
 
    private OAuth2Operations oauthOperations;
    
    @RequestMapping(value = "/kakaoLogin.do")
    public String kakaoLogin() {
    	return "/views/loginAPI/kakaoLogin.jsp";
    }
    @RequestMapping(value="/kakaoCallback.do")
    public String kakaoCallback() {
    	return "/views/loginAPI/kakaoCallback.jsp";
    }
    
    @RequestMapping(value="/kakaoLogout.do")
    public String kakaoLogOut() {
    	return "/views/loginAPI/kakaoLogout.jsp";
    }
    // 회원 가입 페이지
    @RequestMapping(value = "/googleLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String googleLogin(HttpServletResponse response, Model model) {
 
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        String url = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        System.out.println("/GoogleLogin.do, url : " + url);
        model.addAttribute("google_url", url);
 
        return "/views/loginAPI/GoogleLogin.jsp";
    }
 
 
    // ------------------------------------ 구글 콜백 ----------------------------------------
    
    @RequestMapping(value = "/googleCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String doSessionAssignActionPage(HttpServletRequest request, HttpSession session) throws Exception {
 
        String code = request.getParameter("code");
 
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
                null);
 
        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();
 
        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken();
            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
 
        }
 
        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
        System.out.println(connection);
 
        PlusOperations plusOperations = google.plusOperations();
        Person profile = plusOperations.getGoogleProfile();
        System.out.println("User Uid : " + profile.getId());
        System.out.println("User Name : " + profile.getDisplayName());
        System.out.println("User Email : " + profile.getAccountEmail());
        System.out.println("User Profile : " + profile.getImageUrl());
        System.out.println("User Birth : " + profile.getBirthday());
        System.out.println("user Gender : " + profile.getGender());
        session.setAttribute("googleProfileId", profile.getId());
        session.setAttribute("googleProfileName", profile.getDisplayName());
        session.setAttribute("googleProfileEmail", profile.getAccountEmail());
        session.setAttribute("googleProfileBirth", profile.getBirthday());
        session.setAttribute("googleProfileGender", profile.getGender());
        String realName = profile.getFamilyName()+ profile.getGivenName();
        session.setAttribute("googleRealName", realName);
        // Access Token 취소
        try {
            System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
 
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
        } catch (Exception e) {
 
            e.printStackTrace();
        }
        return "/views/loginAPI/GoogleCallback.jsp";
 
    }
    
    @RequestMapping(value="/googleRegister.do")
    public String googleRegister() {
    	return "views/member/GoogleRegister.jsp";
    }
    
    
    
    
    
    
    
    
    
    
    
    /* ========================================================================================================= */
    
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String naverLogin(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "/views/loginAPI/NaverLogin.jsp";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/naverCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(HttpSession session, @RequestParam String code, @RequestParam String state)
            throws IOException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        session.setAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        
        return "/views/loginAPI/NaverCallback.jsp";
    }
    
    @RequestMapping(value="/NaverRegister.do.")
    public String NaverRegister() {
    	return "views/loginAPI/NaverRegister.jsp";
    }
    
    // 페이스북 oAuth 관련
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
 
    // join  뷰로 매핑
    @RequestMapping(value = "/facebookLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookLogin(HttpServletResponse response, Model model) {
        
        OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        System.out.println("/facebook" + facebook_url);
 
        return "/views/loginAPI/FacebookLogin.jsp";
    }
    
    @RequestMapping(value = "/facebookSignInCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookSignInCallback(@RequestParam String code) throws Exception {
 
        try {
             String redirectUri = oAuth2Parameters.getRedirectUri();
            System.out.println("Redirect URI : " + redirectUri);
            System.out.println("Code : " + code);
 
            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
            String accessToken = accessGrant.getAccessToken();
            System.out.println("AccessToken: " + accessToken);
            Long expireTime = accessGrant.getExpireTime();
        
            
            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            UserOperations userOperations = facebook.userOperations();
            
            try
 
            {            
                String [] fields = { "id", "email",  "name"};
                User userProfile = facebook.fetchObject("me", User.class, fields);
                System.out.println("유저이메일 : " + userProfile.getEmail());
                System.out.println("유저 id : " + userProfile.getId());
                System.out.println("유저 name : " + userProfile.getName());
                
            } catch (MissingAuthorizationException e) {
                e.printStackTrace();
            }
 
        
        } catch (Exception e) {
 
            e.printStackTrace();
 
        }
        return "/views/loginAPI/FacebookCallback.jsp";
 
    }


}