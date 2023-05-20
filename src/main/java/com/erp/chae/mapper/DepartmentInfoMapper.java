package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.DepartmentInfoVO;



public interface DepartmentInfoMapper {
	List<DepartmentInfoVO> getDepartmentInfos(DepartmentInfoVO departmentInfoVO);
	
	DepartmentInfoVO getDepartmentInfo(DepartmentInfoVO departmentInfoVO);
	
	DepartmentInfoVO validationDepartmentInfo(DepartmentInfoVO departmentInfoVO);
	
	
	int insertDepartmentInfo(DepartmentInfoVO departmentInfoVO);
	
	int updateDepartmentInfo(DepartmentInfoVO departmentInfoVO);
	
	int deleteDepartmentInfo(DepartmentInfoVO departmentInfoVO);

}
