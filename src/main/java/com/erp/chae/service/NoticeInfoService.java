package com.erp.chae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.NoticeInfoMapper;
import com.erp.chae.util.UploadFileUtil;
import com.erp.chae.vo.NoticeInfoVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class NoticeInfoService {
	
	@Autowired
	private NoticeInfoMapper noticeInfoMapper;
	@Autowired
	private UploadFileUtil fileUtil; 

	public PageInfo<NoticeInfoVO> getNoticeInfos(NoticeInfoVO noticeInfoVO){
        PageHelper.startPage(noticeInfoVO.getPage(), noticeInfoVO.getRows());
        List<NoticeInfoVO> noticeList = noticeInfoMapper.getNoticeInfos(noticeInfoVO);
		return new PageInfo<NoticeInfoVO>(noticeList);
	}
	
	public NoticeInfoVO getNoticeInfo(NoticeInfoVO noticeInfoVO){
		return noticeInfoMapper.getNoticeInfo(noticeInfoVO);
	}
	
	public void updateNoticeInfoCnt(NoticeInfoVO noticeInfoVO) {
		noticeInfoMapper.updateNoticeInfoCnt(noticeInfoVO);
	}
	public boolean insertNoticeInfo(NoticeInfoVO noticeInfoVO){
		if(noticeInfoVO.getNiFile()!=null && !"".equals(noticeInfoVO.getNiFile().getOriginalFilename())) {
			fileUtil.saveFile(noticeInfoVO, "NiFile");
		}
		return noticeInfoMapper.insertNoticeInfo(noticeInfoVO) == 1;
	}
	
	public boolean updateNoticeInfo(NoticeInfoVO noticeInfoVO){
		
		return noticeInfoMapper.updateNoticeInfo(noticeInfoVO) == 1 ;
	}
	
	public boolean deleteNoticeInfo(NoticeInfoVO noticeInfoVO){
		return noticeInfoMapper.deleteNoticeInfo(noticeInfoVO) == 1 ;
	}

}
