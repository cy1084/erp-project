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
						<strong>비밀번호 관리</strong>
					</h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
							 	
								<form action="/users" method="POST">
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>번호</th>
											<th>이름</th>
											<th>사원번호</th>
											<th>비밀번호 관리</th>
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
												<td>
													<button type="button" onclick="pwdInit('${user.uiNum}','2')">승인</button>
													<button type="button" onclick="pwdInit('${user.uiNum}','1')">신청취소</button>
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

<form action="/user/pass-init" method="POST" id="passInitForm">
	<input type="hidden" id="uiNum" name="uiNum">
	<input type="hidden" id="active" name="active">
	<input type="hidden" id="page" name="page" value="${param.page}">
</form>
<script>
function pwdInit(uiNum, active){
	document.querySelector('#uiNum').value = uiNum;
	document.querySelector('#active').value = active;
	document.querySelector('#passInitForm').submit();
}
</script>
</body>
</html>