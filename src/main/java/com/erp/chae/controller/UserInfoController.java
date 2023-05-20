package com.erp.chae.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.chae.service.DepartmentInfoService;
import com.erp.chae.service.GradeInfoService;
import com.erp.chae.service.UserCertiService;
import com.erp.chae.service.UserInfoService;
import com.erp.chae.util.DateUtil;
import com.erp.chae.vo.UserInfoVO;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserInfoController {

	@Autowired
	private UserInfoService uiService;

	@Autowired
	private UserCertiService ucService;

	@Autowired
	private DepartmentInfoService diService;

	@Autowired
	private GradeInfoService giService;
	

	@GetMapping("/user/sign-up")
	public String signUp(Model model) {
		model.addAttribute("departmentList", diService.getDepartmentInfos(null));
		model.addAttribute("gradeList", giService.getGradeInfos(null));
		return "/views/user/sign-up";
	}
	@PostMapping("/user/sign-up")
	public String signUp(UserInfoVO uiVO, Model model) { //VO 앞에 modelAttribute 생략
		uiVO.setUiBirth(uiVO.getUiBirth().replaceAll("-", ""));
		//유저등록 실패를 가정한다.
		model.addAttribute("msg","사원등록이 실패하였습니다.");
		model.addAttribute("url","/views/user/sign-up");
		if(uiService.signUp(uiVO)) { //true가 나왔다면 로그인 성공
			model.addAttribute("msg","사원등록이 성공하였습니다.");
			model.addAttribute("url","/");
		}
		return "/views/common/msg"; 
	}
	
	@PostMapping("/user/changePwd")
	public String changePwd(UserInfoVO uiVO, HttpSession session, Model model) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","비밀번호 변경이 실패하였습니다.");
		model.addAttribute("url","/user/changePwd");
		if(uiService.changePwd(uiVO, session)) { 
			model.addAttribute("msg","비밀번호 변경이 성공하였습니다.");
			model.addAttribute("url","/users");
		}
		return "/views/common/msg"; 
	}
	@PostMapping("/user/sign-in")
	public String signIn(UserInfoVO uiVO, HttpSession session, Model model) {
		//일단 실패를 가정한다.
		String url = "/views/user/sign-in";
		String msg = "로그인이 실패하였습니다.";
		uiVO = uiService.signIn(uiVO, session);
		if(uiVO!=null) { 
			msg = "로그인이 성공하였습니다.";
			url = "/users";
			if("2".equals(uiVO.getUiLvl())) {
				url = "/notices";
			}
			if("0".equals(uiVO.getActive())) {
				msg = "이미 퇴사한 직원입니다.";
				session.invalidate();
			}
			if("3".equals(uiVO.getActive())) {
				msg = "비밀번호 초기화를 신청한 아이디입니다. 관리자에게 문의 바랍니다.";
				session.invalidate();
			}
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "/views/common/msg"; 
	}

	
	@GetMapping("/user/sign-out")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("msg","로그아웃 되었습니다.");
		model.addAttribute("url","/views/user/signIn");
		return "/views/common/msg"; 
	}
	
	@GetMapping("/users")
	public String userInfos(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		PageInfo<UserInfoVO> userList = uiService.getUserInfos(userInfoVO);
		model.addAttribute("page",userList);
		return "/views/user/userList";
	}
	
	@GetMapping("/users/pwd")
	public String userPwdInfos(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		userInfoVO.setActive("3"); //active=3인 애들
		PageInfo<UserInfoVO> userList = uiService.getUserInfos(userInfoVO);
		model.addAttribute("page",userList);
		return "/views/user/pwd";
	}
	
	@GetMapping("/users/out")
	public String outUserInfos(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		userInfoVO.setActive("0");
		PageInfo<UserInfoVO> userList = uiService.getUserInfos(userInfoVO);
		model.addAttribute("page",userList);
		return "/views/user/outUserList";
	}

	@PostMapping("/users/delete")
	public String deleteUserInfo(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","삭제가 실패하였습니다.");
		model.addAttribute("url","/users/out");
		if(uiService.deleteUserInfo(userInfoVO)) { 
			model.addAttribute("msg","삭제가 성공하였습니다.");
		}
		return "/views/common/msg";
	}
	@PostMapping("/users/out")
	public String outUserInfo(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","퇴직처리가 실패하였습니다.");
		model.addAttribute("url","/users/out");
		userInfoVO.setActive("0");
		userInfoVO.setOutdat(DateUtil.getDate("yyyyMMdd"));
		if(uiService.updateUserInfoActive(userInfoVO)) { 
			model.addAttribute("msg","퇴직처리가 성공하였습니다.");
		}
		return "/views/common/msg"; 
	}
	@PostMapping("/users/out/cancel")
	public String outCancelUserInfo(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","퇴직 취소 처리가 실패하였습니다.");
		model.addAttribute("url","/users/out");
		userInfoVO.setActive("1"); //active=1로
		//userInfoVO.setOutdat("");
		if(uiService.updateUserInfoActive(userInfoVO)) {
			model.addAttribute("msg","퇴직 취소 처리가 성공하였습니다.");
		}
		return "/views/common/msg"; 
	}
	@GetMapping("/users2")
	public String userInfos2(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		PageInfo<UserInfoVO> userList2 = uiService.getUserInfos(userInfoVO);
		model.addAttribute("page",userList2);
		return "/views/user/userList2";
	}
	
	
	@GetMapping("/user/view")
	public String userInfo(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		UserInfoVO user = uiService.getUserInfo(userInfoVO);
		model.addAttribute("user",user);
		return "/views/user/userCard";
	}
	
	@GetMapping("/user/profile")
	public String getUserInfoProfile(Model model) {
		
		return "/views/user/profile";
	}
	
	@GetMapping("/user/certi")
	public String userInfoForCerti(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		UserInfoVO user = uiService.getUserInfo(userInfoVO);
		model.addAttribute("user",user);
		model.addAttribute("date",DateUtil.getDate("yyyy년 MM월 dd일"));
		return "/views/user/userCerti";
	}
	
	@GetMapping("/user/certis")
	public String userInfoForCertis(Model model, @ModelAttribute UserInfoVO userInfoVO) {
		UserInfoVO user = uiService.getUserInfo(userInfoVO);
		model.addAttribute("user",user);
		model.addAttribute("date",DateUtil.getDate("yyyy년 MM월 dd일"));
		return "/views/user/userCerti";
	}
	
	@PostMapping("/user/update")
	public String updateUserInfo(Model model, @ModelAttribute UserInfoVO userInfoVO, HttpSession session) {
		model.addAttribute("msg","사원 수정이 실패하였습니다.");
		model.addAttribute("url","/user/profile");
		if(uiService.updateUserInfo(userInfoVO, session)) {
			model.addAttribute("msg","사원 수정이 성공하였습니다.");
		}
		return "/views/common/msg"; 
	}
	
	@PostMapping("/user/pass-init")
	public String userPwsswordInit(Model model, @ModelAttribute UserInfoVO userInfoVO, HttpSession session) {

		String url = "/users/pwd";
		String msg = "비밀번호 초기화가 실패하였습니다.";
		if("1".equals(userInfoVO.getActive())) {
			msg = "비밀번호 초기화 신청 취소가 실패하였습니다.";
		}
		if(uiService.pwdInit(userInfoVO)) {
			msg = "비밀번호 초기화가 성공하였습니다.";
			if("1".equals(userInfoVO.getActive())) {
				msg = "비밀번호 초기화 신청 취소를 성공하였습니다.";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "/views/common/msg"; 
	}

	@PostMapping("/user/pass-req")
	@ResponseBody
	public Map<String,String> userPasswordReq(@RequestBody UserInfoVO uiVO) {
		Map<String,String> res = new HashMap<>();
		res.put("msg","아이디를 잘못 입력하셨습니다");
		res.put("result", "FALSE");
		if(uiService.pwdInitRequest(uiVO)) {
			res.put("msg","입력하신 아이디" + uiVO.getUiId() + "를 초기화 했습니다.");
			res.put("result", "TRUE");
		}
		return res;
	}
}
