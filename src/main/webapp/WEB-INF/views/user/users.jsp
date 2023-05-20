<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body>
	<div class="wrapper">
		<c:import url="/WEB-INF/views/common/nav.jsp" />

		<div class="main">
			<c:import url="/WEB-INF/views/common/top.jsp" />
			<main class="content">
				<div class="container-fluid p-0">
					<h1 class="h3 mb-3">
						<strong>사원정보</strong>
					</h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
							 	<form action="/users" method="GET">
							 	 <input type="hidden" name="active" value="1">
								<input type="text" name="uiId" value="${param.uiId}" placeholder="사원번호를 입력해주세요">													
								<input type="text" name="uiName" value="${param.uiName}" placeholder="이름을 입력해주세요">
								<button>검색</button>
								</form>
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>번호</th>
											<th>사원번호</th>
											<th>이름</th>
											<th>성별</th>
											<th>이메일</th>
											<th>직급</th>
											<th>부서</th>
											<th>입사일</th>
											<th>재직여부</th>
											<th>출력</th>
									
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty page.list }">
											<tr>
												<th colspan="6">내용이 없습니다.</th>
											</tr>
										</c:if>
										<c:forEach items="${page.list}" var="user">
											<tr>
												<td>${user.uiNum}</td>
												<td>${user.uiId}</td>
												<td>${user.uiName}</td>
												<td>${user.uiTrans}</td>
												<td>${user.uiEmail}</td>
												<td>${user.giName}</td>
												<td>${user.diName}</td>
												<td>${user.credat}</td>
												<td>${user.outdat}</td>
												<td>
													<c:if test="${user.active==0 }">
														퇴직
													</c:if>
													<c:if test="${user.active==1 }">
														재직중
													</c:if>
													<c:if test="${user.active==2 }">
														입사예정
													</c:if>
												</td>
												<td>
													<button onclick="goPage('/user/view?uiNum=${user.uiNum}&page=${page.pageNum}&print=true')">출력</button>
												</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
<body>
</body>
</html>