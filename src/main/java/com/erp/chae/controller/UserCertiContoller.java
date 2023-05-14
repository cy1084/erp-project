package com.erp.chae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.service.UserCertiService;
import com.erp.chae.service.UserInfoService;
import com.erp.chae.vo.UserCertiVO;
import com.erp.chae.vo.UserInfoVO;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserCertiContoller {

	@Autowired
	private UserCertiService userCertiService;
	@Autowired
	private UserInfoService uiService;
	

	@GetMapping("/certies")
	public String userCertis(Model model, @ModelAttribute UserCertiVO userCertiVO) {
		PageInfo<UserCertiVO> page = userCertiService.getUserCertis(userCertiVO);
		model.addAttribute("page",page);
		return "/views/certi/certiList";
	}
	@GetMapping("/certiManage")
	public String userCertiManage(Model model, @ModelAttribute UserCertiVO userCertiVO, HttpSession session) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		userCertiVO.setUiNum(user.getUiNum());
		PageInfo<UserCertiVO> page = userCertiService.getUserCertis(userCertiVO);
		model.addAttribute("page",page);
		return "/views/certi/certiManageList";
	}
	
	@GetMapping("/certi/view")
	public String userCerti(Model model, @ModelAttribute UserCertiVO userCertiVO) {
		UserCertiVO certi = userCertiService.getUserCerti(userCertiVO);
		model.addAttribute("certi",certi);
		return "/views/certi/certi";
	}

	@PostMapping("/certi/insert")
	public String addUserCerti(Model model, @ModelAttribute UserCertiVO userCertiVO) {
		//일단 실패를 가정한다.
		
		model.addAttribute("msg","재직증명서 등록이 실패하였습니다.");
		model.addAttribute("url","/certi/view");
		
		if(userCertiService.insertUserCerti(userCertiVO)) {//true가 나왔다면 재직증명서 등록이 성공
			model.addAttribute("msg","재직증명서 등록이 성공하였습니다.");
			model.addAttribute("url","/certies");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/certi/update")
	public String updateUserCerti(Model model, @ModelAttribute UserCertiVO userCertiVO) {
		//일단 실패를 가정한다.
		
		model.addAttribute("msg","재직증명서 수정이 실패하였습니다.");
		model.addAttribute("url",userCertiVO.getUrl());
		if(userCertiService.updateUserCerti(userCertiVO)) {//true가 나왔다면 재직증명서 수정이 성공
			model.addAttribute("msg","재직증명서 수정이 성공하였습니다.");
			model.addAttribute("url",userCertiVO.getUrl());
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/certi/accept")
	public String acceptUserCerti(Model model, @ModelAttribute UserCertiVO userCertiVO, HttpSession session) {
		model.addAttribute("msg","재직증명서 수정이 실패하였습니다.");
		model.addAttribute("url","/certiManage");
		if(userCertiService.acceptUserCerti(userCertiVO)) {
			model.addAttribute("msg","재직증명서 수정이 성공하였습니다.");
			uiService.reloadSession(session);
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/certi/delete")
	public String deleteUserCerti(Model model, @ModelAttribute UserCertiVO userCertiVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","재직증명서 삭제가 실패하였습니다.");
		model.addAttribute("url","/certi/view?giNum=" + userCertiVO.getUcNum());
		if(userCertiService.deleteUserCerti(userCertiVO)) {//true가 나왔다면 재직증명서 삭제가 성공
			model.addAttribute("msg","재직증명서 삭제가 성공하였습니다.");
			model.addAttribute("url","/certies");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

}
