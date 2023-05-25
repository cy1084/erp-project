<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 지시자 -->

<nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<a class="sidebar-brand" href="/"> <span class="align-middle">ERP</span>
		</a>

		<ul class="sidebar-nav">
			<li class="sidebar-header">PAGES</li>

			<li class="sidebar-item active" data-menu="/notices"><a class="sidebar-link"
				href="/notices"> <i class="align-middle"
					data-feather="bell"></i> <span class="align-middle">공지사항</span>
			</a></li>
			<c:if test="${user != null}"> <!-- session에 저장한 키값 -->
			
			<li class="sidebar-item"><a class="sidebar-link"
				href="${pageContext.request.contextPath}/user/sign-out"> <i
					class="align-middle" data-feather="log-out"></i> <span
					class="align-middle">로그아웃</span>
			</a></li>
			</c:if>

			<c:if test="${user == null}">
			<li class="sidebar-item" data-menu="sign-in"><a class="sidebar-link"
				href="${pageContext.request.contextPath}/views/user/sign-in"> <i
					class="align-middle" data-feather="log-in"></i> <span
					class="align-middle">로그인</span>
			</a></li>
			</c:if>
			
			<c:if test="${user != null && user.uiLvl == '2' && loginUser.uiLvl != '1'}">
			<li class="sidebar-item" " data-menu="/user/profile"><a class="sidebar-link"
				href="${pageContext.request.contextPath}/user/profile?uiNum=${sessionScope.user.uiNum}"> <i class="align-middle"
					data-feather="user"></i> <span class="align-middle">프로필</span>
			</a></li>
			
			<li class="sidebar-item" " data-menu="/users2"><a class="sidebar-link"
				href="/users2"> <i class="align-middle"
					data-feather="users"></i> <span class="align-middle">사원 정보</span>
			</a></li>
			<li class="sidebar-item" " data-menu="/working/view"><a class="sidebar-link"
				href="/working/view"> <i class="align-middle"
					data-feather="clock"></i> <span class="align-middle">근태 정보</span>
			</a></li>
			<!--  <li class="sidebar-item" " data-menu="/salary/my_view"><a class="sidebar-link"
				href="/salary/my_view"> <i class="align-middle"
					data-feather="file-text"></i> <span class="align-middle">급여 정보</span>
			</a></li>
			-->
			<li class="sidebar-item" " data-menu="/off-uses"><a class="sidebar-link"
				href="/off-uses"> <i class="align-middle"
					data-feather="align-left"></i> <span class="align-middle">연차 정보</span>
			</a></li>

			<li class="sidebar-item active" data-menu="/certies"><a class="sidebar-link"
				href="/certies?uiNum=${sessionScope.user.uiNum}"> <i class="align-middle"
					data-feather="bell"></i> <span class="align-middle">재직증명서 신청</span>
			</a></li>
			</c:if>

			<c:if test="${(user != null && user.uiLvl == '1')|| loginUser.uiLvl == '1'}">
			<li class="sidebar-header">ADMIN</li>

			<li class="sidebar-item" data-menu="/user/sign-up"><a class="sidebar-link"
				href="${pageContext.request.contextPath}/user/sign-up"> <i
					class="align-middle" data-feather="user-plus"></i> <span
					class="align-middle">사원 등록</span>
			</a></li>
			<li class="sidebar-item" data-menu="/users"><a class="sidebar-link"
				href="${pageContext.request.contextPath}/users?active=1"> <i class="align-middle"
					data-feather="users"></i> <span class="align-middle">인사 관리</span>
			</a></li>

			<li class="sidebar-item" data-menu="/workings"><a class="sidebar-link"
				href="/workings"> <i class="align-middle"
					data-feather="clock"></i> <span class="align-middle">근태 관리</span>
			</a></li>
 			
 			<!--  <li class="sidebar-item" data-menu="/salaries">
 				<a class="sidebar-link" href="/salaries"><i class="align-middle"
					data-feather="file-text"></i> <span class="fas fa-arrow-down">급여 관리</span></a>
 			</li>
 			-->
 			
			<li class="sidebar-item" data-menu="/users/out"><a class="sidebar-link"
				href="/users/out"> <i class="align-middle"
					data-feather="user-minus"></i> <span class="align-middle">퇴직 관리</span>
			</a></li>

			<li class="sidebar-item" data-menu="/departments">
				<a class="sidebar-link" href="/departments"> 
					<i class="align-middle" data-feather="align-left"></i> 
					<span class="align-middle">부서 관리</span>
				</a>
			</li>

			<li class="sidebar-item" data-menu="/grades">
				<a class="sidebar-link" href="/grades"> 
					<i class="align-middle" data-feather="align-left"></i> 
					<span class="align-middle">직급 관리</span>
				</a>
			</li>
			
			<!--  <li class="sidebar-item" data-menu="/offs">
				<a class="sidebar-link" href="/offs"> 
					<i class="align-middle" data-feather="align-left"></i> 
					<span class="align-middle">연차 정보</span>
				</a>
			</li>
			-->
			
			<li class="sidebar-item" data-menu="/off-uses-manage">
				<a class="sidebar-link" href="/off-uses-manage"> 
					<i class="align-middle" data-feather="align-left"></i> 
					<span class="align-middle">연차 관리</span>
				</a>
			</li>
			
			<li class="sidebar-item active" data-menu="/certiManage">
				<a class="sidebar-link" href="/certiManage">
					<i class="align-middle" data-feather="book"></i> 
					<span class="align-middle">증명서 관리</span>
			</a></li>
			
			<li class="sidebar-item active" data-menu="/users/pwd">
				<a class="sidebar-link" href="${pageContext.request.contextPath}/users/pwd?active=3">
					<i class="align-middle" data-feather="unlock"></i> 
					<span class="align-middle">비밀번호 관리</span>
			</a></li>
			</c:if>

			
		</ul>


	</div>
</nav>