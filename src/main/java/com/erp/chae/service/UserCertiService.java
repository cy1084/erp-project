package com.erp.chae.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.UserCertiMapper;
import com.erp.chae.vo.UserCertiVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserCertiService {

	@Autowired
	private UserCertiMapper userCertiMapper;

	public PageInfo<UserCertiVO> getUserCertis(UserCertiVO userCertiVO){
		PageHelper.startPage(userCertiVO.getPage(), userCertiVO.getRows());
		return new PageInfo<>(userCertiMapper.getUserCertis(userCertiVO));
	}
	
	public UserCertiVO getUserCerti(UserCertiVO userCertiVO){
		return userCertiMapper.getUserCerti(userCertiVO);
	}
	
	public boolean insertUserCerti(UserCertiVO userCertiVO){
		if(userCertiMapper.getUserCerti(userCertiVO)!=null) { //직급 명은 유니크이기 떄문에 조회 결과 null이 아닐 경우는 중복
			return false; // 중복일 경우 실패로 처리 한다.
		}
		return userCertiMapper.insertUserCerti(userCertiVO) == 1 ? true : false;
	}
	
	public boolean updateUserCerti(UserCertiVO userCertiVO){
		return userCertiMapper.updateUserCerti(userCertiVO) == 1 ? true : false;
	}
	
	public boolean acceptUserCerti(UserCertiVO userCertiVO){
		return userCertiMapper.acceptUserCerti(userCertiVO) == 1 ? true : false;
	}
	
	public boolean deleteUserCerti(UserCertiVO userCertiVO){
		return userCertiMapper.deleteUserCerti(userCertiVO) == 1 ? true : false;
	}

}
