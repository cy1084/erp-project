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
					<div class="dropdown-menu-header">${fn:length(user.certies)} 신청서정보</div>
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
										<div class="text-muted small mt-1">${noti.credat}</div>
									</div>
								</div>
							</a> 
						</c:forEach>
						</c:if>
					</div>
					<div class="dropdown-menu-footer">
						<c:if test="${user.uiLvl == '1'}">
						<a href="/certiManage" class="text-muted">신청서내역</a>
						</c:if>
						<c:if test="${user.uiLvl == '2'}">
						<a href="/notices" class="text-muted">공지사항가기</a>
						</c:if>
					</div>
				</div></li>
				<!-- 
			<li class="nav-item dropdown"><a
				class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
				data-bs-toggle="dropdown">
					<div class="position-relative">
						<i class="align-middle" data-feather="message-square"></i>
					</div>
			</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
					aria-labelledby="messagesDropdown">
					<div class="dropdown-menu-header">
						<div class="position-relative">4 New Messages</div>
					</div>
					<div class="list-group">
						<a href="#" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="/resource/static/img/avatars/avatar-5.jpg"
										class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">Vanessa Tucker</div>
									<div class="text-muted small mt-1">Nam pretium turpis et
										arcu. Duis arcu tortor.</div>
									<div class="text-muted small mt-1">15m ago</div>
								</div>
							</div>
						</a> <a href="#" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="/resource/static/img/avatars/avatar-2.jpg"
										class="avatar img-fluid rounded-circle" alt="William Harris">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">William Harris</div>
									<div class="text-muted small mt-1">Curabitur ligula
										sapien euismod vitae.</div>
									<div class="text-muted small mt-1">2h ago</div>
								</div>
							</div>
						</a> <a href="#" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="/resource/static/img/avatars/avatar-4.jpg"
										class="avatar img-fluid rounded-circle" alt="Christina Mason">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">Christina Mason</div>
									<div class="text-muted small mt-1">Pellentesque auctor
										neque nec urna.</div>
									<div class="text-muted small mt-1">4h ago</div>
								</div>
							</div>
						</a> <a href="#" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="/resource/static/img/avatars/avatar-3.jpg"
										class="avatar img-fluid rounded-circle" alt="Sharon Lessman">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">Sharon Lessman</div>
									<div class="text-muted small mt-1">Aenean tellus metus,
										bibendum sed, posuere ac, mattis non.</div>
									<div class="text-muted small mt-1">5h ago</div>
								</div>
							</div>
						</a>
					</div>
					<div class="dropdown-menu-footer">
						<a href="#" class="text-muted">Show all messages</a>
					</div>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#"
				data-bs-toggle="dropdown"> <i class="align-middle"
					data-feather="settings"></i>
			</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
				href="#" data-bs-toggle="dropdown"> </a>
				<div class="dropdown-menu dropdown-menu-end">
					<a class="dropdown-item" href="pages-profile.html"><i
						class="align-middle me-1" data-feather="user"></i> Profile</a> <a
						class="dropdown-item" href="#"><i class="align-middle me-1"
						data-feather="pie-chart"></i> Analytics</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="index.html"><i
						class="align-middle me-1" data-feather="settings"></i> Settings &
						Privacy</a> <a class="dropdown-item" href="#"><i
						class="align-middle me-1" data-feather="help-circle"></i> Help
						Center</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Log out</a>
				</div></li>
				 -->
		</ul>
	</div>
</nav>