package com.erp.chae.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.service.OrderInfoService;
import com.erp.chae.vo.OrderInfoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
	public class OrderInfoController {
		@Autowired
		private OrderInfoService orderInfoService;
		
		@GetMapping("/orders")
		public String orderInfos(Model model, @ModelAttribute OrderInfoVO orderInfoVO) {
			List<OrderInfoVO> orderList = orderInfoService.getOrderInfos(orderInfoVO);
			model.addAttribute("orderList",orderList);
			return "/views/order/orderList";
		}
		
		@GetMapping("/order/view")
		public String orderInfo(Model model, @ModelAttribute OrderInfoVO orderInfoVO) {
			OrderInfoVO order = orderInfoService.getOrderInfo(orderInfoVO);
			model.addAttribute("order",order);
			return "/views/order/orderView";
		}

		@PostMapping("/order/insert")
		public String addOrderInfo(Model model, @ModelAttribute OrderInfoVO orderInfoVO) {
			if(orderInfoService.getOrderInfo(orderInfoVO) != null) {
				model.addAttribute("url","/views/order/orderInsert");

			}
			else {
				model.addAttribute("msg","주문을 실패하였습니다.");
				model.addAttribute("url","/order/view");
				
				if(orderInfoService.insertOrderInfo(orderInfoVO)) {
					model.addAttribute("msg","주문을 성공하였습니다.");
					model.addAttribute("url","/orders");
				}
			}
			
			return "/views/common/msg";
		}

		@PostMapping("/order/update")
		public String updateOrderInfo(Model model, @ModelAttribute OrderInfoVO orderInfoVO) {
			model.addAttribute("msg","주문 수정을 실패하였습니다.");
			model.addAttribute("url","/order/view?oiNum=" + orderInfoVO.getOiNum());
			if(orderInfoService.updateOrderInfo(orderInfoVO)) {
				model.addAttribute("msg","주문 수정을 성공하였습니다.");
				model.addAttribute("url","/orders");
			}
			return "/views/common/msg"; 
		}

		@PostMapping("/order/delete")
		public String deleteOrderInfo(Model model, @ModelAttribute OrderInfoVO orderInfoVO) {
			model.addAttribute("msg","주문 삭제를 실패하였습니다.");
			model.addAttribute("url","/order/view?oiNum=" + orderInfoVO.getOiNum());
			if(orderInfoService.deleteOrderInfo(orderInfoVO)) {
				model.addAttribute("msg","주문 삭제를 성공하였습니다.");
				model.addAttribute("url","/orders");
			}
			return "/views/common/msg"; 
		}


}
