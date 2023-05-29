package com.erp.chae.cron;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.erp.chae.mapper.UserInfoMapper;

@Component
public class UserInfoCron {

	@Autowired
	private UserInfoMapper uiMapper;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void fixedDelaySch() {
		uiMapper.changeActive();
	}
}
