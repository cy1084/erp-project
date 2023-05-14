package com.erp.chae.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.OffUseInfoMapper;
import com.erp.chae.mapper.UiNiMapper;
import com.erp.chae.mapper.UserCertiMapper;
import com.erp.chae.mapper.UserInfoMapper;
import com.erp.chae.util.UploadFileUtil;
import com.erp.chae.vo.OffUseInfoVO;
import com.erp.chae.vo.UserCertiVO;
import com.erp.chae.vo.UserInfoVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserInfoService {

	@Autowired
	private UserInfoMapper userInfoMapper;
	@Autowired
	private UiNiMapper umMapper;
	@Autowired
	private UserCertiMapper ucMapper;
	@Autowired
	private OffUseInfoMapper ouiMapper;
	@Autowired
	private UploadFileUtil fileUtil;
	
	public boolean signUp(UserInfoVO uiVO) {	
		if(userInfoMapper.getUserInfoById(uiVO)!=null) { //아이디 중복 되면 안됨
			return false; 
		}
		if(uiVO.getUiFile()!=null && !"".equals(uiVO.getUiFile().getOriginalFilename())) { //파일명이 있다는 것 -> 파일 첨부 했다면 
			fileUtil.saveFile(uiVO, "UiFile"); //파일 저장 
		}
		
		int cnt = userInfoMapper.signUp(uiVO); //insert 사원등록하고 기본키인 uiNum을 받아와서  1
		cnt += userInfoMapper.updateUiId(uiVO);//아이디, 비밀번호 업데이트 1
		return cnt==2; //2
	}
		

	public UserInfoVO signIn(UserInfoVO uiVO, HttpSession session) {
		UserInfoVO userVO = userInfoMapper.getUserInfoByIdAndPwd(uiVO); //로그인
		if(userVO!=null) {
			session.setAttribute("user", userVO); //key-> user/ value-> userVO 
			userVO = reloadSession(session); //알림들 다시 나오게 session에 저장(로그인 로그아웃 다시 해야되는 이유) 
		}
		return userVO;
	}
	
	public UserInfoVO reloadSession(HttpSession session) { //session 정보 다시 로드
		UserInfoVO userVO = (UserInfoVO) session.getAttribute("user");
		userVO = userInfoMapper.getUserInfoByNum(userVO);
		if("2".equals(userVO.getUiLvl())) {//사원
			userVO.setNotis(umMapper.selectNotis(userVO.getUiNum()));
		}else {//관리자
			UserCertiVO ucVO = new UserCertiVO();
			ucVO.setUcActive("2"); //재직증명서 신청 상태
			userVO.setCerties(ucMapper.getUserCertis(ucVO));
			OffUseInfoVO ouiVO = new OffUseInfoVO();
			ouiVO.setOuiStatus("2"); //연차 미승인 상태
			userVO.setOffUses(ouiMapper.getOffUseInfos(ouiVO));
		}
		session.setAttribute("user", userVO);
		return userVO;
	}
	
	public PageInfo<UserInfoVO> getUserInfos(UserInfoVO userInfoVO){
		PageHelper.startPage(userInfoVO.getPage(), userInfoVO.getRows());//볼 페이지, 한 화면 로우 개수
		return new PageInfo<UserInfoVO>(userInfoMapper.getUserInfos(userInfoVO));
	}
	
	
	public UserInfoVO getUserInfo(UserInfoVO userInfoVO){ //로그인 한 애들 정보를 다시 가져올 때
		return userInfoMapper.getUserInfoByNum(userInfoVO);
	}
	
	public boolean updateUserInfo(UserInfoVO userInfoVO, HttpSession session){
		if(userInfoMapper.getUserInfoByIdAndPwd(userInfoVO)!=null) { 
			return false;
		}
		UserInfoVO userVO = (UserInfoVO) session.getAttribute("user");
		userInfoVO.setUiNum(userVO.getUiNum());
		userInfoVO.setUiBirth(userInfoVO.getUiBirth().replace("-", ""));
		if(userInfoVO.getUiFile()!=null && !"".equals(userInfoVO.getUiFile().getOriginalFilename())) {
			fileUtil.saveFile(userInfoVO, "UiFile");
		}
		int result =  userInfoMapper.updateUserInfo(userInfoVO);
		if(result==1) {
			reloadSession(session); //데이터를 업데이트하고 세션 정보도 초기화 reload
			return true;
		}
		return false;
	}
	
	public boolean updateUserInfoActive(UserInfoVO userInfoVO){
		return userInfoMapper.updateUserInfoActive(userInfoVO) == 1;
	}


	public boolean changePwd(UserInfoVO userInfoVO, HttpSession session) { //입사예정자가 비밀번호 바꿀 때
		UserInfoVO sessionUserInfoVO = (UserInfoVO) session.getAttribute("user");//세션에는 uiNum 
		sessionUserInfoVO.setUiPwd(userInfoVO.getUiPwd());//사용자가 입력한 비밀번호를 가져와서 세션에 넣어줌
		if(userInfoMapper.changePwd(sessionUserInfoVO) == 1) {
			sessionUserInfoVO.setActive("1");
			reloadSession(session);
			return true;
		}
		return false;
	}
	
	public boolean pwdInitRequest(UserInfoVO userInfoVO) {
		return userInfoMapper.pwdInitRequest(userInfoVO) == 1;
	}
	
	public boolean pwdInit(UserInfoVO userInfoVO) {
		return userInfoMapper.pwdInit(userInfoVO) == 1;
	}
}
