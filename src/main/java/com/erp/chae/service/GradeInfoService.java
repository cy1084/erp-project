package com.erp.chae.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.GradeInfoMapper;
import com.erp.chae.vo.GradeInfoVO;

@Service
public class GradeInfoService {

	@Autowired
	private GradeInfoMapper gradeInfoMapper;

	public List<GradeInfoVO> getGradeInfos(GradeInfoVO gradeInfoVO){
		return gradeInfoMapper.getGradeInfos(gradeInfoVO);
	}
	
	public GradeInfoVO getGradeInfo(GradeInfoVO gradeInfoVO){
		return gradeInfoMapper.getGradeInfo(gradeInfoVO);
	}
	
	public boolean insertGradeInfo(GradeInfoVO gradeInfoVO){
		if(gradeInfoMapper.getGradeInfo(gradeInfoVO)!=null) { //직급 명은 유니크이기 때문에 조회 결과 null이 아닐 경우는 중복
			return false; // 중복일 경우 실패로 처리
		}
		return gradeInfoMapper.insertGradeInfo(gradeInfoVO) == 1 ? true : false;
	}
	
	public boolean updateGradeInfo(GradeInfoVO gradeInfoVO){
		if(gradeInfoMapper.getGradeInfo(gradeInfoVO)!=null) { 
			return false; 
		}
		return gradeInfoMapper.updateGradeInfo(gradeInfoVO) == 1 ? true : false;
	}
	
	public boolean deleteGradeInfo(GradeInfoVO gradeInfoVO){
		return gradeInfoMapper.deleteGradeInfo(gradeInfoVO) == 1 ? true : false;
	}

}
