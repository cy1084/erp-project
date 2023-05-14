package com.erp.chae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.service.NoticeInfoService;
import com.erp.chae.service.UiNiService;
import com.erp.chae.vo.NoticeInfoVO;
import com.erp.chae.vo.UserInfoVO;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeInfoController {

	@Autowired
	private NoticeInfoService noticeInfoService;
	@Autowired
	private UiNiService unService;

	@GetMapping("/notices")
	public String noticeInfos(Model model, @ModelAttribute NoticeInfoVO noticeInfoVO) {
		PageInfo<NoticeInfoVO> page = noticeInfoService.getNoticeInfos(noticeInfoVO);
		model.addAttribute("page", page);
		return "/views/notice/noticeList";
	}

	@GetMapping("/notice/view")
	public String noticeInfo(Model model, @ModelAttribute NoticeInfoVO noticeInfoVO, HttpSession session) {
		NoticeInfoVO notice = noticeInfoService.getNoticeInfo(noticeInfoVO);
		UserInfoVO uiVO = (UserInfoVO) session.getAttribute("user");
		noticeInfoVO.setUiNum(uiVO.getUiNum());
		unService.insertUiNiMap(noticeInfoVO, uiVO);
		
		model.addAttribute("notice", notice);
		return "/views/notice/noticeView";
	}

	@GetMapping("/notice/upload")
	public String noticeInfoForUpload(Model model, @ModelAttribute NoticeInfoVO noticeInfoVO) {
		NoticeInfoVO notice = noticeInfoService.getNoticeInfo(noticeInfoVO);
		model.addAttribute("notice", notice);
		return "/views/notice/noticeUpdate";
	}

	@PostMapping("/notice/insert")
	public String addNoticeInfo(Model model, @ModelAttribute NoticeInfoVO noticeInfoVO) {
		model.addAttribute("msg", "공지사항 등록이 실패하였습니다.");
		model.addAttribute("url", "/notice/view");
		if (noticeInfoService.insertNoticeInfo(noticeInfoVO)) {
			model.addAttribute("msg", "공지사항 등록이 성공하였습니다.");
			model.addAttribute("url", "/notices");
		}
		return "/views/common/msg";
	}

	@PostMapping("/notice/update")
	public String updateNoticeInfo(Model model, @ModelAttribute NoticeInfoVO noticeInfoVO) {
		model.addAttribute("msg", "공지사항 수정이 실패하였습니다.");
		model.addAttribute("url", "/notice/view?niNum=" + noticeInfoVO.getNiNum());
		if (noticeInfoService.updateNoticeInfo(noticeInfoVO)) {
			model.addAttribute("msg", "공지사항 수정이 성공하였습니다.");
			model.addAttribute("url", "/notices");
		}
		return "/views/common/msg";
	}

	@PostMapping("/notice/delete")
	public String deleteNoticeInfo(Model model, @ModelAttribute NoticeInfoVO noticeInfoVO) {
		model.addAttribute("msg", "공지사항 삭제가 실패하였습니다.");
		model.addAttribute("url", "/notice/view?niNum=" + noticeInfoVO.getNiNum());
		if (noticeInfoService.deleteNoticeInfo(noticeInfoVO)) {
			model.addAttribute("msg", "공지사항 삭제가 성공하였습니다.");
			model.addAttribute("url", "/notices");
		}
		return "/views/common/msg";
	}
}
