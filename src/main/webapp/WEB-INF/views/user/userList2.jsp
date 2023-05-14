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
			
				<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>사원번호</th>
											<th>이름</th>
											<th>성별</th>
											<th>생년월일</th>
											<th>이메일</th>
											<th>부서</th>
											<th>직급</th>
											<th>담당업무</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${page.list}" var="user">
											<tr onclick="goPage('/user/view?uiNum=${user.uiNum}&page=${page.pageNum}')"
												style="cursor: pointer">
												<td>${user.uiId}</td>
												<td>${user.uiName}</td>
												<td>${user.uiTrans}</td>
												<td>${user.uiBirth}</td>
												<td>${user.uiEmail}</td>
												<td>${user.diName}</td>
												<td>${user.giName}</td> 
												<td>${user.uiDuties}</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
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