package com.erp.chae.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.erp.chae.service.GradeInfoService;
import com.erp.chae.vo.GradeInfoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GradeInfoController {

	@Autowired
	private GradeInfoService gradeInfoService;
	
	@GetMapping("/grades")
	public String gradeInfos(Model model, @ModelAttribute GradeInfoVO gradeInfoVO) {
		List<GradeInfoVO> gradeList = gradeInfoService.getGradeInfos(gradeInfoVO);
		model.addAttribute("gradeList",gradeList);
		return "/views/grade/gradeList";
	}
	
	@GetMapping("/grade/view")
	public String gradeInfo(Model model, @ModelAttribute GradeInfoVO gradeInfoVO) {
		GradeInfoVO grade = gradeInfoService.getGradeInfo(gradeInfoVO);
		model.addAttribute("grade",grade);
		return "/views/grade/gradeView";
	}

	@PostMapping("/grade/insert")
	public String addGradeInfo(Model model, @ModelAttribute GradeInfoVO gradeInfoVO) {
		//일단 실패를 가정한다.
		if(gradeInfoService.getGradeInfo(gradeInfoVO) != null) {
			model.addAttribute("msg","중복된 직급입니다. 다시 입력해주세요.");
			model.addAttribute("url","/views/grade/gradeInsert");

		}
		else {
			model.addAttribute("msg","직급 등록이 실패하였습니다.");
			model.addAttribute("url","/grade/view");
			
			if(gradeInfoService.insertGradeInfo(gradeInfoVO)) {//true가 나왔다면 직급 등록이 성공
				model.addAttribute("msg","직급 등록이 성공하였습니다.");
				model.addAttribute("url","/grades");
			}
		}
		
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/grade/update")
	public String updateGradeInfo(Model model, @ModelAttribute GradeInfoVO gradeInfoVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","직급 수정이 실패하였습니다.");
		model.addAttribute("url","/grade/view?giNum=" + gradeInfoVO.getGiNum());
		if(gradeInfoService.updateGradeInfo(gradeInfoVO)) {//true가 나왔다면 직급 수정이 성공
			model.addAttribute("msg","직급 수정이 성공하였습니다.");
			model.addAttribute("url","/grades");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

	@PostMapping("/grade/delete")
	public String deleteGradeInfo(Model model, @ModelAttribute GradeInfoVO gradeInfoVO) {
		//일단 실패를 가정한다.
		model.addAttribute("msg","직급 삭제가 실패하였습니다.");
		model.addAttribute("url","/grade/view?giNum=" + gradeInfoVO.getGiNum());
		if(gradeInfoService.deleteGradeInfo(gradeInfoVO)) {//true가 나왔다면 직급 삭제가 성공
			model.addAttribute("msg","직급 삭제가 성공하였습니다.");
			model.addAttribute("url","/grades");
		}
		return "/views/common/msg"; //메세지를 보여줄 화면으로 이동
	}

}
