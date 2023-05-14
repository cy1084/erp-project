package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.WorkingInfoVO;

public interface WorkingInfoMapper {
	
	List<WorkingInfoVO> getWorkingInfos(WorkingInfoVO workingInfoVO);
	
	WorkingInfoVO getWorkingInfo(WorkingInfoVO workingInfoVO);
	
	List<WorkingInfoVO> getWorkingInfo2(WorkingInfoVO workingInfoVO);
	
	int insertWorkingInfo(WorkingInfoVO workingInfoVO);
	
	int updateWorkingInfo(WorkingInfoVO workingInfoVO);
	
	int deleteWorkingInfo(WorkingInfoVO workingInfoVO);

	int endWorkingInfo(WorkingInfoVO workingInfoVO);
}
