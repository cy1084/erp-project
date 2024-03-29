package com.erp.chae.mapper;

import java.util.List;


import com.erp.chae.vo.OffInfoVO;

public interface OffInfoMapper {
	List<OffInfoVO> getOffInfos(OffInfoVO offInfoVO);
	
	List<OffInfoVO> getOffInfosByUiNum(int uiNum);
	
	OffInfoVO getOffInfo(OffInfoVO offInfoVO);
	
	int insertOffInfo(OffInfoVO offInfoVO);
	
	int updateOffInfo(OffInfoVO offInfoVO);
	
	int deleteOffInfo(int oiNum);
	
	int deleteOffInfoByUiNum(int uiNum);
}



