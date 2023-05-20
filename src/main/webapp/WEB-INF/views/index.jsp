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
						<strong>공지</strong>
					</h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty page.list }">
											<tr>
												<th colspan="5">내용이 없습니다.</th>
											</tr>
										</c:if>
										<c:forEach items="${page.list}" var="notice">
											<tr onclick="goPage('/notice/view?niNum=${notice.niNum}&page=${page.pageNum}')"
												style="cursor: pointer">
												<td>${notice.niNum}</td>
												<td>${notice.niTitle}</td>
												<td>${notice.uiName}</td>
												<td>${notice.credat}</td>
												<td>${notice.niCnt}</td>
											</tr>
										</c:forEach>
										<c:if test="${user.uiLvl==1}">
										<tr>
											<td colspan="5" style="text-align: right">
												<button onclick="goPage('/views/notice/noticeInsert')">등록</button>
											</td>
										</tr>
										</c:if>
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