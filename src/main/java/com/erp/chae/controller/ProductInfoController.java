package com.erp.chae.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import com.erp.chae.service.ProductInfoService;
import com.erp.chae.vo.ProductInfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
	public class ProductInfoController {
		@Autowired
		private ProductInfoService productInfoService;
		
		@GetMapping("/Products")
		public String productInfos(Model model, @ModelAttribute ProductInfoVO productInfoVO) {
			List<ProductInfoVO> productList = productInfoService.getProductInfos(productInfoVO);
			model.addAttribute("productList",productList);
			return "/views/product/productList";
		}
		
		@GetMapping("/product/view")
		public String productInfo(Model model, @ModelAttribute ProductInfoVO productInfoVO) {
			ProductInfoVO product = productInfoService.getProductInfo(productInfoVO);
			model.addAttribute("product",product);
			return "/views/product/productView";
		}

		@PostMapping("/product/insert")
		public String addProductInfo(Model model, @ModelAttribute ProductInfoVO productInfoVO) {
			if(productInfoService.getProductInfo(productInfoVO) != null) {
				model.addAttribute("url","/views/product/productInsert");

			}
			else {
				model.addAttribute("msg","상품 등록을 실패하였습니다.");
				model.addAttribute("url","/product/view");
				
				if(productInfoService.insertProductInfo(productInfoVO)) {
					model.addAttribute("msg","상품 등록을 성공하였습니다.");
					model.addAttribute("url","/products");
				}
			}
			
			return "/views/common/msg";
		}

		@PostMapping("/product/update")
		public String updateProductInfo(Model model, @ModelAttribute ProductInfoVO productInfoVO) {
			model.addAttribute("msg","상품 수정을 실패하였습니다.");
			model.addAttribute("url","/product/view?piNum=" + productInfoVO.getPiNum());
			if(productInfoService.updateProductInfo(productInfoVO)) {
				model.addAttribute("msg","상품 수정을 성공하였습니다.");
				model.addAttribute("url","/products");
			}
			return "/views/common/msg"; 
		}

		@PostMapping("/product/delete")
		public String deleteProductInfo(Model model, @ModelAttribute ProductInfoVO productInfoVO) {
			model.addAttribute("msg","상품 삭제를 실패하였습니다.");
			model.addAttribute("url","/product/view?piNum=" + productInfoVO.getPiNum());
			if(productInfoService.deleteProductInfo(productInfoVO)) {
				model.addAttribute("msg","상품 삭제를 성공하였습니다.");
				model.addAttribute("url","/products");
			}
			return "/views/common/msg"; 
		}

	}



