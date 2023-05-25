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
						<strong>근태 정보</strong>
					</h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								
								
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>No.</th>
											<th>날짜</th>												
											<th>출근 시간</th>
											<th>퇴근 시간</th>
											<th>근무 시간</th>											
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty page.list }">
											<tr>
												<th colspan="5">내용이 없습니다.</th>
											</tr>
										</c:if>
										<c:forEach items="${page.list}" var="working">
											<tr 
												style="cursor: pointer">
												<td></td>
												<td>${working.wiDate}</td>												
												<td>${working.wiStart}</td>
												<td>${working.wiEnd}</td>
												<td>${working.wiEtc}</td>
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