package com.spring.view.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.google.GoogleService;
import com.spring.biz.google.GoogleVO;

@Controller
public class GoogleController {
	@Autowired
	private GoogleService googleService;
	
	public GoogleController() {
		System.out.println("GoogleController 실행");
	}
	
	@RequestMapping("/getHostGoogle.do")
	@ResponseBody
	public List<GoogleVO> getHostGoogle() {
		List<GoogleVO> list = googleService.getHostGoogle();
		return list;
	}
	
}