package com.erp.chae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.mapper.OffUseInfoMapper;
import com.erp.chae.service.OffUseInfoService;
import com.erp.chae.vo.OffUseInfoVO;
import com.erp.chae.vo.UserInfoVO;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OffUseInfoController {

	@Autowired
	private OffUseInfoService offUseInfoService;
	@Autowired
	private OffUseInfoMapper offUseInfoMapper;

	@GetMapping("/off-uses") // 전체 read
	public String offUseInfos(Model model, @ModelAttribute OffUseInfoVO offInfoVO, HttpSession session) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		offInfoVO.setOiNum(user.getOiNum());
		PageInfo<OffUseInfoVO> offList = offUseInfoService.getOffUseInfos(offInfoVO);
		model.addAttribute("page", offList);
		return "/views/off-use/offUseList";
	}

	@GetMapping("/off-uses-manage") // 전체 read
	public String offUseInfosManage(Model model, @ModelAttribute OffUseInfoVO offInfoVO) {
		PageInfo<OffUseInfoVO> offList = offUseInfoService.getOffUseInfos(offInfoVO);
		model.addAttribute("page", offList);
		return "/views/off-use/offUseManageList";
	}
	/*
	 * @GetMapping("/off-use/view") public String offInfo(Model
	 * model,@ModelAttribute OffUseInfoVO offInfoVO) { OffUseInfoVO off =
	 * offUseInfoService.getOffUseInfo(offInfoVO); model.addAttribute("off",off);
	 * //System.out.println(off); return "/views/off-use/offUseView"; }
	 */

	@GetMapping("/off-use/view")
	public String offUseInfo(Model model, @ModelAttribute OffUseInfoVO offInfoVO, HttpSession session) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		offInfoVO.setOiNum(user.getOiNum());
		PageInfo<OffUseInfoVO> off = offUseInfoService.getOffUseInfo2(offInfoVO);
		model.addAttribute("page", off);

		return "/views/off-use/offUseView";
	}

	@PostMapping("/off-use/insert")
	public String addOffUseInfo(Model model, @ModelAttribute OffUseInfoVO offInfoVO, HttpSession session) {
		model.addAttribute("msg", "연차 신청을 실패하였습니다.");
		model.addAttribute("url", "/views/off-use/offUseInsert");
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		offInfoVO.setOiNum(user.getOiNum());

		offInfoVO.setOuiStart(offInfoVO.getOuiStart().replace("-", ""));
		offInfoVO.setOuiEnd(offInfoVO.getOuiEnd().replace("-", ""));
		if (offUseInfoMapper.getOffUseInfoByDay(offInfoVO) != null) {
			model.addAttribute("msg", "날짜가 겹칩니다.");
			model.addAttribute("url", "/off-uses");
		}else if (offUseInfoService.insertOffUseInfo(offInfoVO)) {
			model.addAttribute("msg", "연차 신청을 성공하였습니다.");
			model.addAttribute("url", "/off-uses");
		}
		return "/views/common/msg";
	}

	@PostMapping("/off-use/update")
	public String updateOffUseInfo(Model model, @ModelAttribute OffUseInfoVO offInfoVO) {
		model.addAttribute("msg", "연차 수정을 실패하였습니다.");
		model.addAttribute("url", "/off-use/view?oiNum=" + offInfoVO.getOiNum());
		if (offUseInfoService.updateOffUseInfo(offInfoVO)) {
			model.addAttribute("msg", "연차 수정을 성공하였습니다.");
			model.addAttribute("url", "/offUses");
		}
		return "/views/common/msg";
	}

	@PostMapping("/off-use/updateStatus")
	public String updateOffUseInfoStatus(Model model, @ModelAttribute OffUseInfoVO offInfoVO) {
		String msg = "연차 ";
		if ("0".equals(offInfoVO.getOuiStatus())) {
			msg += "반려를 ";
		} else if ("1".equals(offInfoVO.getOuiStatus())) {
			msg += "승인을 ";
		} else if ("3".equals(offInfoVO.getOuiStatus())) {
			msg += "취소를 ";
		}
		model.addAttribute("msg", msg + "실패하였습니다.");
		if (offUseInfoService.updateOffUseInfoStatus(offInfoVO)) {
			model.addAttribute("msg", msg + "성공하였습니다.");
		}
		model.addAttribute("url", offInfoVO.getUrl());
		return "/views/common/msg";
	}

	@PostMapping("/off-use/delete")
	public String deleteOffUseInfo(Model model, @ModelAttribute OffUseInfoVO offInfoVO) {
		model.addAttribute("msg", "연차 취소를 실패하였습니다.");
		model.addAttribute("url", "/off-use/view?oiNum=" + offInfoVO.getOiNum());
		if (offUseInfoService.deleteOffUseInfo(offInfoVO)) {
			model.addAttribute("msg", "연차 취소를 성공하였습니다.");
			model.addAttribute("url", "/offUses");
		}
		return "/views/common/msg";
	}

}
