package com.erp.chae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.service.UserInfoService;
import com.erp.chae.service.WorkingInfoService;
import com.erp.chae.vo.UserInfoVO;
import com.erp.chae.vo.WorkingInfoVO;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WorkingInfoController {

	@Autowired
	private WorkingInfoService workingInfoService;

	@Autowired
	private UserInfoService userInfoService;
	
	@GetMapping("/workings")
	public String workingInfos(Model model, @ModelAttribute WorkingInfoVO workingInfoVO) {
		if(workingInfoVO.getWiDate()!=null) {
			workingInfoVO.setWiDate(workingInfoVO.getWiDate().replace("-", ""));
		}
		PageInfo<WorkingInfoVO> workingList = workingInfoService.getWorkingInfos(workingInfoVO);
		//model.addAttribute("workingList",workingList);
		model.addAttribute("page",workingList);

		return "/views/working/workingList";
	}
	
	@GetMapping("/working/view")
	public String workingInfo(Model model, @ModelAttribute WorkingInfoVO workingInfoVO, HttpSession session) {
	 
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		workingInfoVO.setUiNum(user.getUiNum());
		
		PageInfo<WorkingInfoVO> working = workingInfoService.getWorkingInfo2(workingInfoVO);
		model.addAttribute("page",working);
		return "/views/working/workingView";
	}

	@PostMapping("/working/insert")
	public String addWorkingInfo(Model model, @ModelAttribute WorkingInfoVO workingInfoVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","출퇴근정보 등록이 실패하였습니다.");
		model.addAttribute("url","/working/view");
		if(workingInfoService.startWorkingInfo(workingInfoVO)) {//true가 나왔다면 출퇴근정보 등록이 성공
			model.addAttribute("msg","출퇴근정보 등록이 성공하였습니다.");
			model.addAttribute("url","/workings");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/working/start")
	public String startWorkingInfo(Model model, @ModelAttribute WorkingInfoVO workingInfoVO, HttpSession session) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","출퇴근정보 등록이 실패하였습니다.");
		model.addAttribute("url","/notices");
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		workingInfoVO.setUiNum(user.getUiNum());
		if(workingInfoService.startWorkingInfo(workingInfoVO)) {//true가 나왔다면 출퇴근정보 등록이 성공
			session.setAttribute("user", userInfoService.getUserInfo(user));
			model.addAttribute("msg","출퇴근정보 등록이 성공하였습니다.");
			model.addAttribute("url","/notices");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/working/end")
	public String endWorkingInfo(Model model, @ModelAttribute WorkingInfoVO workingInfoVO, HttpSession session) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","출퇴근정보 등록이 실패하였습니다.");
		model.addAttribute("url","/notices");
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		workingInfoVO.setUiNum(user.getUiNum());
		workingInfoVO.setWiNum(user.getWiNum());
		if(workingInfoService.endWorkingInfo(workingInfoVO)) {//true가 나왔다면 출퇴근정보 등록이 성공
			session.setAttribute("user", userInfoService.getUserInfo(user));
			model.addAttribute("msg","출퇴근정보 등록이 성공하였습니다.");
			model.addAttribute("url","/notices");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/working/update")
	public String updateWorkingInfo(Model model, @ModelAttribute WorkingInfoVO workingInfoVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","출퇴근정보 수정이 실패하였습니다.");
		model.addAttribute("url","/working/view?giNum=" + workingInfoVO.getWiNum());
		if(workingInfoService.updateWorkingInfo(workingInfoVO)) {//true가 나왔다면 출퇴근정보 수정이 성공
			model.addAttribute("msg","출퇴근정보 수정이 성공하였습니다.");
			model.addAttribute("url","/workings");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/working/delete")
	public String deleteWorkingInfo(Model model, @ModelAttribute WorkingInfoVO workingInfoVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","출퇴근정보 삭제가 실패하였습니다.");
		model.addAttribute("url","/working/view?giNum=" + workingInfoVO.getWiNum());
		if(workingInfoService.deleteWorkingInfo(workingInfoVO)) {//true가 나왔다면 출퇴근정보 삭제가 성공
			model.addAttribute("msg","출퇴근정보 삭제가 성공하였습니다.");
			model.addAttribute("url","/workings");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

}
