package com.erp.chae.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.erp.chae.interceptor.LoginInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LoginInterceptor loginIntercepter = new LoginInterceptor();
        registry.addInterceptor(loginIntercepter)
        		.excludePathPatterns("/views/user/sign-in","/resource/**","/user/sign-in","/views/common/msg","/views/user/changePwd","/user/sign-out","/user/pass-req")
                .addPathPatterns("/**");
    }
}