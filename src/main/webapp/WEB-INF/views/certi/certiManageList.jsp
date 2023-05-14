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
				<div class="container-flucd p-0">
					<h1 class="h3 mb-3">
						<strong>재직증명서 승인</strong>
					</h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
							 	<form action="/certies" method="GET" id="certiForm">
								<select name="ucActive" onchange="searchCerti()">
									<option value="">상태</option>
									<option value="2" ${param.ucActive==2?'selected':''}>신청</option>
									<option value="1" ${param.ucActive==1?'selected':''}>완료</option>
								</select>	
								<select name="ucType" onchange="searchCerti()">
									<option value="">용도</option>
									<option value="1" ${param.ucType==1?'selected':''}>금융기관</option>
									<option value="2" ${param.ucType==2?'selected':''}>관공서</option>
									<option value="3" ${param.ucType==3?'selected':''}>회사</option>
								</select>
								</form>
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr align="center">
											<th>신청번호</th>
											<th>용도</th>
											<th>아이디</th>
											<th>이름</th>
											<th>신청일</th>
											<th>열람기간</th>
											<th>상태</th>
											<th>승인</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty page.list }">
											<tr>
												<th colspan="8">내용이 없습니다.</th>
											</tr>
										</c:if>
										<c:forEach items="${page.list}" var="certi">
											<tr align="center">
												<td>${certi.ucNum}</td>
												<td>
												
													<c:if test="${certi.ucType==1 }">
														금융기관 제출용
													</c:if>
													<c:if test="${certi.ucType==2 }">
														관공서 제출용
													</c:if>
													<c:if test="${certi.ucType==3 }">
														회사 제출용
													</c:if>
												</td>
												<td>${certi.uiId}</td>
												<td>${certi.uiName}</td>
												<td>${certi.credat}</td>
												<td>
													${certi.periodStart} - ${certi.periodEnd}
												</td>
												<td>
													<c:if test="${certi.ucActive==1 }">
														완료
													</c:if>
													<c:if test="${certi.ucActive==2 }">
														신청
													</c:if>
												</td>
												<td>
													<c:if test="${certi.ucActive==2 }">
														<button onclick="manage(1,${certi.ucNum})">승인</button>
													</c:if>
													<c:if test="${certi.ucActive==1 }">
														<button onclick="manage(2,${certi.ucNum})">취소</button>
													</c:if>
												</td>
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
	<form action="/certi/accept" method="POST" id="certiUpdateForm">
		<input type="hidden" name="page" value="${param.page}">
		<input type="hidden" id="ucNum" name="ucNum">
		<input type="hidden" id="ucActive" name="ucActive">
		<input type="hidden" name="url" value="/certiManage">
	</form>
<script>
function searchCerti(){
	document.querySelector('#certiForm').submit();
}
function manage(ucActive, ucNum){
	document.querySelector('#ucNum').value = ucNum;
	document.querySelector('#ucActive').value = ucActive;
	document.querySelector('#certiUpdateForm').submit();
}
</script>
<body>
</body>
</html>