package com.erp.chae.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PostController {
	
	public PostController() {
		log.info("메모리 생성");
	}
	
	// 글쓰기 페이지 /post/writeForm
    @GetMapping("/post/writeForm")
    public String writeForm() {
        return "/views/post/writeForm"; // /WEB-INF/post/writeForm.jsp
    }

  
    // 글 목록 페이지 /post/list/
    @GetMapping("/post/list") // 두 가지 방법
    public String list() {
        return "/views/post/list";
    }

    // 글 상세보기 페이지 /post/{id} 
    @GetMapping("/post/{id}")
    public String detail(@PathVariable Integer id) { // Integer는 초깃값 null                      
        return "post/" + id;
    }

    // 글 수정 페이지 /post/{id}/updateForm
    @GetMapping("/post/{id}/updateForm")
    public String updateForm(@PathVariable Integer id) {
        return "post/updateForm"; 
    }

    // DELETE 글 삭제 /post/{id} -> 글 목록으로 가기
    @DeleteMapping("/post/{id}")
    public String delete(@PathVariable Integer id) {
        return "redirect:/";
    }

    // UPDATE 글 수정 /post/{id} -> 글 상세보기 페이지 가기
    @PutMapping("/post/{id}")
    public String update(@PathVariable Integer id) {
        return "redirect:/post/" + id;
    }

    // POST 글 쓰기 /post -> 글 목록으로 가기
    @PostMapping("/post")
    public String post() {
        return "redirect:/"; 
    }

}
