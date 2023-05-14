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
					<h1 class="h3 mb-3"><strong>직급 목록</strong></h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<form action="/grades" method="GET">
								<input type="text" name="giName"  value="${param.giName}" placeholder="직급명을 입력해주세요">													
								<button>검색</button>
								</form>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>번호</th>
											<th>직급명</th>
											<th>직급 설명</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${gradeList}" var="grade">
										<tr onclick="goPage('/grade/view?giNum=${grade.giNum}')" style="cursor:pointer">
											<td >${grade.giNum}</td>
											<td >${grade.giName}</td>
											<td >${grade.giDesc}</td>
										</tr>
									</c:forEach>
										<tr>
											<td colspan="3" style="text-align:right">
												<button onclick="goPage('/views/grade/gradeInsert')">등록</button>
											</td>
										</tr>
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
<script>
function goPage(url){
	location.href = url;
}
</script>

</body>
</html>