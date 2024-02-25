package com.feb.name.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.feb.name.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	// 브라우져에 http://localhost:8080/spring/loginPage.do치면 로그인 페이지(login.jsp)로 이동되고
	@GetMapping("/loginPage.do") // 로그인시 POST로 login.jsp가 다시 POSTMapping인 login.do로 이동시킨다.
	public ModelAndView loginPage() {//
		ModelAndView mv = new ModelAndView();// ModelAndView객체 생성
		mv.setViewName("login");// login.jsp는 뷰 이름
		return mv;// 값이 담겨있는 mv 반환
	}

	@PostMapping("/login.do") 
	public ModelAndView login(@RequestParam HashMap<String, String> params) { //HashMap으로 저장한다.이 코드에서는 "member_id"와 "passwd" 파라미터를 받는다.
		ModelAndView mv = new ModelAndView();//객체 생성(ModelAndView 는 데이터 관리하는데 사용)

		System.out.println("member_id1111111111111111111 : " + params.get("member_id"));
		System.out.println("passwd22222222222222222 : " + params.get("passwd"));

		mv.setViewName("login");//보여지는 뷰는  login.jsp로 설정

		boolean result = loginService.login(params); //loginService.login() 메서드는 받은 파라미터를 사용하여 로그인을 시도하고, 결과를 boolean 값으로 반환 -> true 또는 false를 반환.
		System.out.println("result44444444444444 : " + result);

		if (result) { // result가 true면 로그인 성공ㅡ false면 로그인 실패
			mv.addObject("resultMsg", "로그인 성공");
		} else {
			mv.addObject("resultMsg", "로그인 실패");
		}

		return mv;
	}
}