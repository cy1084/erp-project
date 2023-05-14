package com.erp.chae.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.erp.chae.service.NoticeInfoService;
import com.erp.chae.vo.NoticeInfoVO;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ViewsController {
	@Autowired
	private NoticeInfoService noticeInfoService;

	@GetMapping("/views/**")
	public void goPage() {
		log.info("이건 views를 만족했음");
	}
	@GetMapping("/")
	public String home(Model model, @ModelAttribute NoticeInfoVO noticeInfoVO) {
		PageInfo<NoticeInfoVO> page = noticeInfoService.getNoticeInfos(noticeInfoVO);
		model.addAttribute("page", page);
		return "/views/index";
	}
}
