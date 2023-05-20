package com.erp.chae.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.service.DepartmentInfoService;
import com.erp.chae.vo.DepartmentInfoVO;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DepartmentInfoController {
	
	@Autowired
	private DepartmentInfoService departmentInfoService;
	
	@GetMapping("/departments")
	public String departmentInfos(Model model, @ModelAttribute DepartmentInfoVO departmentInfoVO) {
		List<DepartmentInfoVO> departmentList = departmentInfoService.getDepartmentInfos(departmentInfoVO);
		model.addAttribute("departmentList",departmentList);
		return "/views/department/departmentList";		
	}
	
	@GetMapping("/department/view")
	public String departmentInfo(Model model,@ModelAttribute DepartmentInfoVO departmentInfoVO) {
		DepartmentInfoVO department = departmentInfoService.getDepartmentInfo(departmentInfoVO);
		model.addAttribute("department",department); //department는 키값
		return "/views/department/departmentView";		
	} 
	
	@PostMapping("/department/insert")
	public String addDepartmentInfo(Model model,@ModelAttribute DepartmentInfoVO departmentInfoVO) {
		
		
		if(departmentInfoService.getDepartmentInfo(departmentInfoVO)!= null) {
			model.addAttribute("msg","중복된 부서입니다. 다시 입력해주세요.");
			model.addAttribute("url","/views/department/departmentInsert");

		}
		else {
			model.addAttribute("msg","부서 등록을 실패하였습니다.");
			model.addAttribute("url","/department/view");
			
			if(departmentInfoService.insertDepartmentInfo(departmentInfoVO)) {
				model.addAttribute("msg","부서 등록을 성공하였습니다.");
				model.addAttribute("url","/departments");
			}	
		}
		
			
		return "/views/common/msg";		
	}
	
	@PostMapping("/department/update")
	public String updateDepartmentInfo(Model model, @ModelAttribute DepartmentInfoVO departmentInfoVO) {
		model.addAttribute("msg","부서 수정을 실패하였습니다.");
		model.addAttribute("url","/department/view?diNum=" + departmentInfoVO.getDiNum());
		if(departmentInfoService.updateDepartmentInfo(departmentInfoVO)) {
			model.addAttribute("msg","부서 수정을 성공하였습니다.");
			model.addAttribute("url","/departments");
		}
		return "/views/common/msg"; 
	}
	
	@PostMapping("/department/delete") 
	public String deleteDepartmentInfo(Model model, @ModelAttribute DepartmentInfoVO departmentInfoVO) {
		model.addAttribute("msg","부서 삭제를 실패하였습니다.");
		model.addAttribute("url","/department/view?diNum=" + departmentInfoVO.getDiNum());
		if(departmentInfoService.deleteDepartmentInfo(departmentInfoVO)) {
			model.addAttribute("msg","부서 삭제를 성공하였습니다.");
			model.addAttribute("url","/departments");
		}
		return "/views/common/msg"; 
	}
	

}
