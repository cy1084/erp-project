<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand navbar-light navbar-bg">
	<a class="sidebar-toggle js-sidebar-toggle"> <i
		class="hamburger align-self-center"></i>
	</a>
	<div class="navbar-collapse collapse">
		<ul class="navbar-nav navbar-align">
			<li class="nav-item dropdown"><a
				class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
				data-bs-toggle="dropdown">
					<div class="position-relative">
						<c:if test="${user.uiLvl == '2'}">
						<i class="align-middle" data-feather="bell"></i> <span
							class="indicator">${fn:length(user.notis)}</span> <!-- 안읽은 공지사항 개수 -->
						</c:if>
						<c:if test="${user.uiLvl == '1'}">
						<i class="align-middle" data-feather="bell"></i> <span
							class="indicator">${fn:length(user.certies)+fn:length(user.offUses)}</span>
						</c:if>
					</div>
			</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
					aria-labelledby="alertsDropdown">
					<c:if test="${user.uiLvl == '1'}">
					<div class="dropdown-menu-header">${fn:length(user.certies)} 신청서 정보</div>
					</c:if>
					<c:if test="${user.uiLvl == '2'}">
					<div class="dropdown-menu-header">${fn:length(user.notis)} 공지사항</div>
					</c:if>
					<div class="list-group">
						<c:if test="${user.uiLvl == '1'}">
							<c:forEach begin="0" end="2" items="${user.offUses}" var="offUse"> 
								<a href="/off-uses-manage" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<i class="text-warning" data-feather="bell"></i>
										</div>
										<div class="col-10">
											<div class="text-dark">연차 : ${offUse.uiName}</div>
											<div class="text-muted small mt-1">${offUse.uiId}</div>
											<div class="text-muted small mt-1">${offUse.ouiDay}일</div>
										</div>
									</div>
								</a> 
							</c:forEach>
							<c:forEach begin="0" end="2" items="${user.certies}" var="certi">
								<a href="/certiManage" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<i class="text-warning" data-feather="bell"></i>
										</div>
										<div class="col-10">
											<div class="text-dark">재직증명서 : ${certi.uiName}</div>
											<div class="text-muted small mt-1">${certi.uiId}</div>
											<div class="text-muted small mt-1">${certi.credat}</div>
										</div>
									</div>
								</a> 
							</c:forEach> 
							
						</c:if>
						<c:if test="${user.uiLvl == '2'}">
						<c:forEach begin="0" end="2" items="${user.notis}" var="noti">
							<a href="/notice/view?niNum=${noti.niNum}" class="list-group-item">
								<div class="row g-0 align-items-center">
									<div class="col-2">
										<i class="text-warning" data-feather="bell"></i>
									</div>
									<div class="col-10">
										<div class="text-dark">${noti.niTitle}</div>
										<div class="text-muted small mt-1">${fn:substring(noti.niContent,0,10)}</div>
										<!-- 공지사항 내용 10글자까지 보이게 -->
										<div class="text-muted small mt-1">${noti.credat}</div>
									</div>
								</div>
							</a> 
						</c:forEach>
						</c:if>
					</div>
					<div class="dropdown-menu-footer">
						<c:if test="${user.uiLvl == '1'}">
						<a href="/certiManage" class="text-muted">신청서 내역</a>
						</c:if>
						<c:if test="${user.uiLvl == '2'}">
						<a href="/notices" class="text-muted">공지사항 가기</a>
						</c:if>
					</div>
				</div></li>
				
			
		</ul>
	</div>
</nav>