package com.erp.chae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.DepartmentInfoMapper;
import com.erp.chae.vo.DepartmentInfoVO;

@Service
public class DepartmentInfoService {
	
	@Autowired
	private DepartmentInfoMapper departmentInfoMapper;

	public List<DepartmentInfoVO> getDepartmentInfos(DepartmentInfoVO departmentInfoVO){
		return departmentInfoMapper.getDepartmentInfos(departmentInfoVO);
	}
	
	public DepartmentInfoVO getDepartmentInfo(DepartmentInfoVO departmentInfoVO){
		return departmentInfoMapper.getDepartmentInfo(departmentInfoVO);
	}
	
	public boolean insertDepartmentInfo(DepartmentInfoVO departmentInfoVO){
		if(departmentInfoMapper.getDepartmentInfo(departmentInfoVO)!=null) { 
			return false; 
		}
		return departmentInfoMapper.insertDepartmentInfo(departmentInfoVO) == 1 ? true : false;
	}
	
	public boolean updateDepartmentInfo(DepartmentInfoVO departmentInfoVO){
		if(departmentInfoMapper.validationDepartmentInfo(departmentInfoVO)!=null) { 
			return false; 
		}
		return departmentInfoMapper.updateDepartmentInfo(departmentInfoVO) == 1 ? true : false;
	}
	
	public boolean deleteDepartmentInfo(DepartmentInfoVO departmentInfoVO){
		return departmentInfoMapper.deleteDepartmentInfo(departmentInfoVO) == 1 ? true : false;
	}

}
