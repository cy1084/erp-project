package com.erp.chae.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import com.erp.chae.service.CustomerInfoService;
import com.erp.chae.vo.CustomerInfoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomerInfoController {
	@Autowired
	private CustomerInfoService customerInfoService;
	
	@GetMapping("/customers")
	public String customerInfos(Model model, @ModelAttribute CustomerInfoVO customerInfoVO) {
		List<CustomerInfoVO> customerList = customerInfoService.getCustomerInfos(customerInfoVO);
		model.addAttribute("customerList",customerList);
		return "/views/customer/customerList";
	}
	
	@GetMapping("/customer/view")
	public String customerInfo(Model model, @ModelAttribute CustomerInfoVO customerInfoVO) {
		CustomerInfoVO customer = customerInfoService.getCustomerInfo(customerInfoVO);
		model.addAttribute("customer",customer);
		return "/views/customer/customerView";
	}

	@PostMapping("/customer/insert")
	public String addCustomerInfo(Model model, @ModelAttribute CustomerInfoVO customerInfoVO) {
		if(customerInfoService.getCustomerInfo(customerInfoVO) != null) {
			model.addAttribute("url","/views/customer/customerInsert");

		}
		else {
			model.addAttribute("msg","고객 등록을 실패하였습니다.");
			model.addAttribute("url","/customer/view");
			
			if(customerInfoService.insertCustomerInfo(customerInfoVO)) {
				model.addAttribute("msg","고객 등록을 성공하였습니다.");
				model.addAttribute("url","/customers");
			}
		}
		
		return "/views/common/msg";
	}

	@PostMapping("/customer/update")
	public String updateCustomerInfo(Model model, @ModelAttribute CustomerInfoVO customerInfoVO) {
		model.addAttribute("msg","고객 수정을 실패하였습니다.");
		model.addAttribute("url","/customer/view?ciId=" + customerInfoVO.getCiId());
		if(customerInfoService.updateCustomerInfo(customerInfoVO)) {
			model.addAttribute("msg","고객 수정을 성공하였습니다.");
			model.addAttribute("url","/customers");
		}
		return "/views/common/msg"; 
	}

	@PostMapping("/customer/delete")
	public String deleteCustomerInfo(Model model, @ModelAttribute CustomerInfoVO customerInfoVO) {
		model.addAttribute("msg","고객 삭제를 실패하였습니다.");
		model.addAttribute("url","/customer/view?ciId=" + customerInfoVO.getCiId());
		if(customerInfoService.deleteCustomerInfo(customerInfoVO)) {
			model.addAttribute("msg","고객 삭제를 성공하였습니다.");
			model.addAttribute("url","/customers");
		}
		return "/views/common/msg"; 
	}

}
