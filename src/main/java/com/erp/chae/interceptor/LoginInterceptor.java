package com.erp.chae.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.erp.chae.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	HttpSession session = request.getSession();
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
    	if(user==null) {
            response.sendRedirect("/views/user/sign-in");
    		return false;
    	}
		if("2".equals(user.getActive())) {
			String uri = request.getRequestURI();
			if("/user/changePwd".equals(uri)) {
				return true;
			}
            response.sendRedirect("/views/user/changePwd");
    		return false;
		}
    	return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
