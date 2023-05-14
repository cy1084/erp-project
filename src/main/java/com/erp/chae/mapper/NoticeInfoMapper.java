package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.NoticeInfoVO;


public interface NoticeInfoMapper {
	List<NoticeInfoVO> getNoticeInfos(NoticeInfoVO noticeInfoVO);
	
	NoticeInfoVO getNoticeInfo(NoticeInfoVO noticeInfoVO);
	
	int insertNoticeInfo(NoticeInfoVO noticeInfoVO);
	
	int updateNoticeInfo(NoticeInfoVO noticeInfoVO);
	
	int deleteNoticeInfo(NoticeInfoVO noticeInfoVO);

	void updateNoticeInfoCnt(NoticeInfoVO noticeInfoVO);	

}
 