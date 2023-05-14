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
						<strong>퇴직 관리</strong>
					</h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
							 	<form action="/users/out" method="GET">
								<input type="text" name="uiId" value="${param.uiId}" placeholder="사원번호를 입력해주세요">													
								<input type="text" name="uiName" value="${param.uiName}" placeholder="이름을 입력해주세요">
								<select name="active">
									<option value="">전체</option>
									<option value="1" ${param.active==1?'selected':''}>재직중</option>
									<option value="0" ${param.active==0?'selected':''}>퇴직</option>
									<option value="2" ${param.active==2?'selected':''}>입사예정</option>
								</select>
								<button>검색</button>
								</form>
								<form action="/users/out" method="POST">
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>번호</th>
											<th>이름</th>
											<th>사원번호</th>
											<th>입사일</th>
											<th>퇴사일</th>
											<th>재직여부</th>
											<th>퇴직</th>
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
												<td>${user.uiName}</td>
												<td>${user.uiId}</td>
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
													<button type="button" onclick="userOut('${user.uiNum}','${user.active}')">
													<c:if test="${user.active!=0}">
														퇴직
													</c:if>
													<c:if test="${user.active==0}">
														퇴직취소
													</c:if>
													</button>
												</td>
											</tr>
										</c:forEach>
										
									</tbody>
										
								</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</main>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>

<form action="/users/out" method="POST" id="userOut">
	<input type="hidden" id="uiNum" name="uiNum">
</form>
<script>
function userOut(uiNum,active){
	document.querySelector('#uiNum').value = uiNum;
	if(active==0){
		document.querySelector('#userOut').action='/users/out/cancel';
	}
	document.querySelector('#userOut').submit();
}
</script>
</body>
</html>