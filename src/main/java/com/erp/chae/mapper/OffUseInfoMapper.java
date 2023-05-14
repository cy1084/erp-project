package com.erp.chae.mapper;

import java.util.List;
import com.erp.chae.vo.OffUseInfoVO;
import com.erp.chae.vo.WorkingInfoVO;

public interface OffUseInfoMapper {
	List<OffUseInfoVO> getOffUseInfos(OffUseInfoVO offUseInfoVO);
	
	OffUseInfoVO getOffUseInfo(OffUseInfoVO offUseInfoVO);
	
	OffUseInfoVO getOffUseInfoByDay(OffUseInfoVO offUseInfoVO);
	
	List<OffUseInfoVO> getOffUseInfo2(OffUseInfoVO offUseInfoVO);
	
	int insertOffUseInfo(OffUseInfoVO offUseInfoVO);
	
	int updateOffUseInfo(OffUseInfoVO offUseInfoVO);
	
	int updateOffUseInfoStatus(OffUseInfoVO offUseInfoVO);
	
	int deleteOffUseInfo(OffUseInfoVO offUseInfoVO);

}
