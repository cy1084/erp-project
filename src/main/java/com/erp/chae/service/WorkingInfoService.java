package com.erp.chae.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.WorkingInfoMapper;
import com.erp.chae.util.DateUtil;
import com.erp.chae.vo.WorkingInfoVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class WorkingInfoService {

	@Autowired
	private WorkingInfoMapper workingInfoMapper;

	public PageInfo<WorkingInfoVO> getWorkingInfos(WorkingInfoVO workingInfoVO){
		PageHelper.startPage(workingInfoVO.getPage(), workingInfoVO.getRows());
		return new PageInfo<>(workingInfoMapper.getWorkingInfos(workingInfoVO));
	}
	
	public WorkingInfoVO getWorkingInfo(WorkingInfoVO workingInfoVO){
		return workingInfoMapper.getWorkingInfo(workingInfoVO);
	}
	
	public PageInfo<WorkingInfoVO> getWorkingInfo2(WorkingInfoVO workingInfoVO){
		PageHelper.startPage(workingInfoVO.getPage(), workingInfoVO.getRows());
		return new PageInfo<>(workingInfoMapper.getWorkingInfo2(workingInfoVO));
	}
	
	public boolean insertWorkingInfo(WorkingInfoVO workingInfoVO){
		if(workingInfoMapper.getWorkingInfo(workingInfoVO)!=null) { 
			return false; 
		}
		return workingInfoMapper.insertWorkingInfo(workingInfoVO) == 1 ? true : false;
	}
	
	public boolean startWorkingInfo(WorkingInfoVO workingInfoVO){
		String wiDate = DateUtil.getDate("yyyyMMdd");
		workingInfoVO.setWiDate(wiDate);
		if(workingInfoMapper.getWorkingInfo(workingInfoVO)!=null) { 
			return false; 
		}
		return workingInfoMapper.insertWorkingInfo(workingInfoVO) == 1 ? true : false;
	}
	
	public boolean endWorkingInfo(WorkingInfoVO workingInfoVO){
		return workingInfoMapper.endWorkingInfo(workingInfoVO) == 1 ? true : false;
	}
	
	public boolean updateWorkingInfo(WorkingInfoVO workingInfoVO){
		if(workingInfoMapper.getWorkingInfo(workingInfoVO)!=null) { 
			return false; 
		}
		return workingInfoMapper.updateWorkingInfo(workingInfoVO) == 1 ? true : false;
	}
	
	public boolean deleteWorkingInfo(WorkingInfoVO workingInfoVO){
		return workingInfoMapper.deleteWorkingInfo(workingInfoVO) == 1 ? true : false;
	}

}
