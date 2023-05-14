package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.UserCertiVO;

public interface UserCertiMapper {
	
	List<UserCertiVO> getUserCertis(UserCertiVO userCertiVO);
	
	UserCertiVO getUserCerti(UserCertiVO userCertiVO);
	
	int insertUserCerti(UserCertiVO userCertiVO);

	int updateUserCerti(UserCertiVO userCertiVO);
	int acceptUserCerti(UserCertiVO userCertiVO);
	
	
	int deleteUserCerti(UserCertiVO userCertiVO);
}
