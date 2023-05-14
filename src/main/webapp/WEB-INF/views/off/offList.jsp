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
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<form action="/offs" method="GET">
								<input type="text" name="uiId" value="${param.uiId}" placeholder="사원번호를 입력해주세요">					
								<input type="text" name="uiName" value="${param.uiName}" placeholder="이름을 입력해주세요">
								<button>검색</button>
								</form>	
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>사원번호</th>
											<th>이름</th>
											<th>기준년도</th>
											<th>총 연차</th>
											<th>사용 연차</th>
											<th>잔여 연차</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty page.list }">
											<tr>
												<th colspan="5">내용이 없습니다.</th>
											</tr>
										</c:if>
										<c:forEach items="${page.list}" var="off">
											<tr onclick="goPage('/off/view?oiNum=${off.oiNum}&page=${page.pageNum}')"
												style="cursor: pointer">
												<td>${off.uiId}</td>
												<td>${off.uiName}</td>
												<td>${off.oiYear}</td>
												<td>${off.oiDay}</td>
												<td>${off.useDay}</td>
												<td>${off.leftDay}</td>
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