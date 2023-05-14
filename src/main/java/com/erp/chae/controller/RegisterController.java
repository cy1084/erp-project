package com.erp.chae.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.vo.UserInfoVO;

@Controller
public class RegisterController {

	@GetMapping("/register/add")
	// @RequestMapping(value="/register/add", method=RequestMethod.GET)
	public String register() {
		return "registerForm";
		// WEB-INF/views/registerForm.jsp
	}

	@PostMapping("/register/save")
	// @RequestMapping(value="/register/save", method=RequestMethod.POST)
	public String save(UserInfoVO user, Model model) {
		if (!isValid(user)) {
			String msg = "id를 잘못 입력하셨습니다.";
			return "redirect:/register/add?msg=" + msg;
			// 신규 회원가입 화면으로 이동(redirect)
		}
		return "registerInfo";
	}

	private boolean isValid(UserInfoVO user) {
		return false;
	}

}