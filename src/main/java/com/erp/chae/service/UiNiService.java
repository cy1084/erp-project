package com.erp.chae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.UiNiMapper;
import com.erp.chae.vo.NoticeInfoVO;
import com.erp.chae.vo.UserInfoVO;

@Service
public class UiNiService {

	@Autowired
	private UiNiMapper unMapper;
	
	public List<NoticeInfoVO> selectNotis(int uiNum) {
		return unMapper.selectNotis(uiNum);
	}
	public int insertUiNiMap(NoticeInfoVO niVO, UserInfoVO uiVO) {
		
		int cnt =  unMapper.insertUiNiMap(niVO);
		uiVO.setNotis(selectNotis(uiVO.getUiNum()));
		return cnt;
	}
}
