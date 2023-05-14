package com.erp.chae.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.service.OffInfoService;
import com.erp.chae.vo.OffInfoVO;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OffInfoController {

		@Autowired
		private OffInfoService offInfoService;
		
		@GetMapping("/offs")//전체 read
		public String offInfos(Model model, @ModelAttribute OffInfoVO offInfoVO) {
			PageInfo<OffInfoVO> offList = offInfoService.getOffInfos(offInfoVO);
			model.addAttribute("page",offList);
			//System.out.println(offList);
			return "/views/off/offList";		
		}
		
		@GetMapping("/off/view")
		public String offInfo(Model model,@ModelAttribute OffInfoVO offInfoVO) {
			OffInfoVO off = offInfoService.getOffInfo(offInfoVO);
			model.addAttribute("off",off);
			//System.out.println(off);
			return "/views/off/offView";		
		} 
		
		@PostMapping("/off/insert")
		public String addOffInfo(Model model,@ModelAttribute OffInfoVO offInfoVO) {
			model.addAttribute("msg","연차 신청을 실패하였습니다.");
			model.addAttribute("url","/off/view");
			
			if(offInfoService.insertOffInfo(offInfoVO)) {
				model.addAttribute("msg","연차 신청을 성공하였습니다.");
				model.addAttribute("url","/offs");
			}		
			return "/views/common/msg";		
		}
		
		@PostMapping("/off/update")
		public String updateOffInfo(Model model, @ModelAttribute OffInfoVO offInfoVO) {
			model.addAttribute("msg","연차 수정을 실패하였습니다.");
			model.addAttribute("url","/off/view?oiNum=" + offInfoVO.getOiNum());
			if(offInfoService.updateOffInfo(offInfoVO)) {
				model.addAttribute("msg","연차 수정을 성공하였습니다.");
				model.addAttribute("url","/offs");
			}
			return "/views/common/msg"; 
		}
		
		@PostMapping("/off/delete") 
		public String deleteOffInfo(Model model, @ModelAttribute OffInfoVO offInfoVO) {
			model.addAttribute("msg","연차 취소를 실패하였습니다.");
			model.addAttribute("url","/off/view?oiNum=" + offInfoVO.getOiNum());
			if(offInfoService.deleteOffInfo(offInfoVO)) {
				model.addAttribute("msg","연차 취소를 성공하였습니다.");
				model.addAttribute("url","/offs");
			}
			return "/views/common/msg"; 
		}
		
}
