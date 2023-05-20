package com.erp.chae.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.OffUseInfoMapper;
import com.erp.chae.vo.OffUseInfoVO;
import com.erp.chae.vo.WorkingInfoVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OffUseInfoService {
	
	@Autowired
	private OffUseInfoMapper offUseInfoMapper;

	public PageInfo<OffUseInfoVO> getOffUseInfos(OffUseInfoVO offUseInfoVO){
		PageHelper.startPage(offUseInfoVO.getPage(), offUseInfoVO.getRows());
		return new PageInfo<>(offUseInfoMapper.getOffUseInfos(offUseInfoVO));
	}
	public OffUseInfoVO getOffUseInfo(OffUseInfoVO offUseInfoVO){
		return offUseInfoMapper.getOffUseInfo(offUseInfoVO);
	}
	
	public PageInfo<OffUseInfoVO> getOffUseInfo2(OffUseInfoVO offUseInfoVO){
		PageHelper.startPage(offUseInfoVO.getPage(), offUseInfoVO.getRows());
		return new PageInfo<>(offUseInfoMapper.getOffUseInfo2(offUseInfoVO));
	}
	
	public boolean insertOffUseInfo(OffUseInfoVO offUseInfoVO){
		return offUseInfoMapper.insertOffUseInfo(offUseInfoVO) == 1;
	}

	public boolean updateOffUseInfo(OffUseInfoVO offUseInfoVO){
		return offUseInfoMapper.updateOffUseInfo(offUseInfoVO) == 1;
	}

	public boolean updateOffUseInfoStatus(OffUseInfoVO offUseInfoVO){
		return offUseInfoMapper.updateOffUseInfoStatus(offUseInfoVO) == 1;
	}
	
	public boolean deleteOffUseInfo(OffUseInfoVO offUseInfoVO){
		return offUseInfoMapper.deleteOffUseInfo(offUseInfoVO) == 1;
	}

}
