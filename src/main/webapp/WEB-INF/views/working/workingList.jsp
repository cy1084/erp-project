<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>

<div class="wrapper">
		<c:import url="/WEB-INF/views/common/nav.jsp" />

		<div class="main">
			<c:import url="/WEB-INF/views/common/top.jsp" />
			<main class="content">
				<div class="container-fluid p-0">
					<h1 class="h3 mb-3">
						<strong>근태 관리</strong>
					</h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								
								
								<form action="/workings" method="GET">
									<input type="date" name="wiDate" value="${param.wiDate}">
									<input type="text" name="uiId" value="${param.uiId}" placeholder="사원번호를 입력해주세요">													
									<input type="text" name="uiName" value="${param.uiName}" placeholder="이름을 입력해주세요">
									<button>검색</button>

								</form>	
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>날짜</th>
											<th>이름</th>
											<th>사원번호</th>
											<th>부서</th>
											<th>직급</th>
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
												<td>${working.wiDate}</td>
												<td>${working.uiName}</td>
												<td>${working.uiId}</td>
												<td>${working.diName}</td>
												<td>${working.giName}</td>
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



		
	