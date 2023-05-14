package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.GradeInfoVO;

public interface GradeInfoMapper {
	
	List<GradeInfoVO> getGradeInfos(GradeInfoVO gradeInfoVO);
	
	GradeInfoVO getGradeInfo(GradeInfoVO gradeInfoVO);
	
	int insertGradeInfo(GradeInfoVO gradeInfoVO);
	
	int updateGradeInfo(GradeInfoVO gradeInfoVO);
	
	int deleteGradeInfo(GradeInfoVO gradeInfoVO);
}
