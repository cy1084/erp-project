package com.erp.chae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.OffInfoMapper;

import com.erp.chae.vo.OffInfoVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OffInfoService {
	@Autowired
	private OffInfoMapper offInfoMapper;

	public PageInfo<OffInfoVO> getOffInfos(OffInfoVO offInfoVO){
		PageHelper.startPage(offInfoVO.getPage(), offInfoVO.getRows());
		List<OffInfoVO> list = offInfoMapper.getOffInfos(offInfoVO);
		return new PageInfo<>(list);
	}

	public PageInfo<OffInfoVO> getOffInfosByUiNum(OffInfoVO offInfoVO){
		PageHelper.startPage(offInfoVO.getPage(), offInfoVO.getRows());
		List<OffInfoVO> list = offInfoMapper.getOffInfosByUiNum(offInfoVO.getUiNum());
		return new PageInfo<>(list);
	}
	
	
	public OffInfoVO getOffInfo(OffInfoVO offInfoVO){
		return offInfoMapper.getOffInfo(offInfoVO);
	}
	
	public boolean insertOffInfo(OffInfoVO offInfoVO){
		if(offInfoMapper.getOffInfo(offInfoVO)!=null) { 
			return false; 
		}
		return offInfoMapper.insertOffInfo(offInfoVO) == 1;
	}

	public boolean updateOffInfo(OffInfoVO offInfoVO){
		if(offInfoMapper.getOffInfo(offInfoVO)!=null) { 
			return false; 
		}
		return offInfoMapper.updateOffInfo(offInfoVO) == 1;
	}
	
	public boolean deleteOffInfo(OffInfoVO offInfoVO){
		return offInfoMapper.deleteOffInfo(offInfoVO.getOiNum()) == 1;
	}

}
