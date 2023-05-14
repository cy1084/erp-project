package com.erp.chae.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.service.SalaryInfoService;
import com.erp.chae.vo.SalaryInfoVO;
import com.erp.chae.vo.UserInfoVO;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SalaryInfoController {
	@Autowired
	private SalaryInfoService salaryInfoService;
	
	@GetMapping("/salaries")
	public String salaryInfos(Model model, @ModelAttribute SalaryInfoVO salaryInfoVO) {
		PageInfo<SalaryInfoVO> salaryList = salaryInfoService.getSalaryInfos(salaryInfoVO);
		model.addAttribute("page",salaryList);
		return "/views/salary/salaryList";
	}
	
	@GetMapping("/salary/view")
	public String salaryInfo(Model model, @ModelAttribute SalaryInfoVO salaryInfoVO) {
		SalaryInfoVO salary = salaryInfoService.getSalaryInfo(salaryInfoVO);
		model.addAttribute("salary",salary);
		return "/views/salary/salaryView";

	}
	
	@GetMapping("/salary/my_view")
	public String my_salaryInfo(Model model, @ModelAttribute SalaryInfoVO salaryInfoVO, HttpSession session) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		salaryInfoVO.setUiNum(user.getUiNum());
		PageInfo<SalaryInfoVO> salary = salaryInfoService.getMySalaryInfo(salaryInfoVO);
		model.addAttribute("page",salary);
		return "/views/salary/my_salary";
	}
	
	@PostMapping("/salary/insert")
	public String addSalaryInfo(Model model, @ModelAttribute SalaryInfoVO salaryInfoVO) {
		model.addAttribute("msg","급여 등록을 실패하였습니다.");
		model.addAttribute("url","/salary/view");
		if(salaryInfoService.insertSalaryInfo(salaryInfoVO)) {
			model.addAttribute("msg","급여 등록을 성공하였습니다.");
			model.addAttribute("url","/salaries");
		}
		return "/views/common/msg"; 
	}

	@PostMapping("/salary/update")
	public String updateSalaryInfo(Model model, @ModelAttribute SalaryInfoVO salaryInfoVO) {
		model.addAttribute("msg","급여 수정을 실패하였습니다.");
		model.addAttribute("url","/salary/view?siNum=" + salaryInfoVO.getSiNum());
		if(salaryInfoService.updateSalaryInfo(salaryInfoVO)) {
			model.addAttribute("msg","급여 수정을 성공하였습니다.");
			model.addAttribute("url","/salaries");
		}
		return "/views/common/msg"; 
	}

	@PostMapping("/salary/delete")
	public String deleteSalaryInfo(Model model, @ModelAttribute SalaryInfoVO salaryInfoVO) {
		model.addAttribute("msg","급여 삭제를 실패하였습니다.");
		model.addAttribute("url","/salary/view?siNum=" + salaryInfoVO.getSiNum());
		if(salaryInfoService.deleteSalaryInfo(salaryInfoVO)) {
			model.addAttribute("msg","급여 삭제를 성공하였습니다.");
			model.addAttribute("url","/salaries");
	}
		return "/views/common/msg"; 
	}

}
