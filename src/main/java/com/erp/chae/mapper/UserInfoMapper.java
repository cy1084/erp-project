package com.erp.chae.mapper;

import java.util.List;
import com.erp.chae.vo.UserInfoVO;

public interface UserInfoMapper {
	
	List<UserInfoVO> getUserInfos(UserInfoVO uiVO);
	
	UserInfoVO getUserInfo(UserInfoVO uiVO);
	
	UserInfoVO getUserInfoById(UserInfoVO uiVO);
	
	UserInfoVO getUserInfoByNum(UserInfoVO uiVO);
	
	UserInfoVO getUserInfoByIdAndPwd(UserInfoVO uiVO); 
	
	int updateUiId(UserInfoVO uiVO);
	
	int signUp(UserInfoVO uiVO);
	
	int updateUserInfo(UserInfoVO uiVO);
	
	int updateUserInfoByUiNum(UserInfoVO uiVO);
	
	int updateUserInfoActive(UserInfoVO uiVO);

	int changePwd(UserInfoVO userInfoVO);
	
	int pwdInitRequest(UserInfoVO userInfoVO);
	
	int pwdInit(UserInfoVO userInfoVO);
	
	int deleteUserInfo(UserInfoVO userInfoVO);
}
