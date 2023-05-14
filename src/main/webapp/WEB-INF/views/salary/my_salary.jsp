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
						<strong>급여 지급 내역</strong>
					</h1>
					
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											
											<th>연차</th>
											<th>연봉</th>
											<th>식대</th>
											<th>차량유지비</th>
											<th>교육지원비</th>
											<th>연장수당</th>
											<th>특별수당</th>
											<th>직급수당</th>
											<th>퇴직금</th>
											
											
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty page.list }">
											<tr>
												<th colspan="5">내용이 없습니다.</th>
											</tr>
										</c:if>
										<c:forEach items="${page.list}" var="salary">
											<tr onclick="goPage('/salary/view?siNum=${salary.siNum}&page=${page.pageNum}')"
												style="cursor: pointer">
												<td>${salary.siYear}</td>
												<td>${salary.basePay}</td>
												<td>${salary.mealAllowance}</td>
												<td>${salary.carMaintenance}</td>
												<td>${salary.eduExpense}</td>
												<td>${salary.extensionAllowance}</td>
												<td>${salary.specialAllowance}</td>
												<td>${salary.dutyAllowance}</td>
												<td>${salary.retirementPay}</td>
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