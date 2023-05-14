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
					<h1 class="h3 mb-3"><strong>부서 목록</strong></h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<form action="/departments" method="GET">
								<input type="text" name="diName" value="${param.diName}" placeholder="부서명을 입력해주세요">													
								<button>검색</button>
								</form>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>번호</th>
											<th>부서명</th>
											<th>부서 설명</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${departmentList}" var="department">
										<tr onclick="goPage('/department/view?diNum=${department.diNum}')" style="cursor:pointer">
											<td >${department.diNum}</td>
											<td >${department.diName}</td>
											<td >${department.diDesc}</td>
										</tr>
									</c:forEach>
										<tr>
											<td colspan="3" style="text-align:right">
												<button onclick="goPage('/views/department/departmentInsert')">등록</button>
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