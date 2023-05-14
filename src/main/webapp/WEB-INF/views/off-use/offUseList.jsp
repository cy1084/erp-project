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
								<form action="/off-uses" method="GET">
									<select name="ouiType" id="ouiType">
										<option value="">타입선택</option>
										<option value="1" ${param.ouiType==1?'selected':''}>휴가</option>
										<option value="2" ${param.ouiType==2?'selected':''}>반차</option>
										<option value="3" ${param.ouiType==3?'selected':''}>병가</option>
										<option value="4" ${param.ouiType==4?'selected':''}>조의</option>
									</select>
									<button>검색</button>
								</form>
								<table class="table table-hover my-0" data-pages="${page.pages}" data-page-num="${page.pageNum}">
									<thead>
										<tr>
											<th>사원번호</th>
											<th>연차 타입</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>사용일수</th>
											<th>상태</th>
											<th>취소</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty page.list }">
											<tr>
												<th colspan="7">내용이 없습니다.</th>
											</tr>
										</c:if>
										<c:forEach items="${page.list}" var="offUse">
											<tr>
												<td>${offUse.uiId}</td>
												<td>
													<c:if test="${offUse.ouiType == '1'}">
														휴가
													</c:if>
													<c:if test="${offUse.ouiType == '2'}">
														반차
													</c:if>
													<c:if test="${offUse.ouiType == '3'}">
														병가
													</c:if>
													<c:if test="${offUse.ouiType == '4'}">
														조의
													</c:if>
												</td>
												<td>${offUse.ouiStart}</td>
												<td>${offUse.ouiEnd}</td>
												<td>${offUse.ouiDay}</td>
												<td>
													<c:if test="${offUse.ouiStatus == '0'}">
														반려
													</c:if>
													<c:if test="${offUse.ouiStatus == '1'}">
														승인
													</c:if>
													<c:if test="${offUse.ouiStatus == '2'}">
														신청
													</c:if>
													<c:if test="${offUse.ouiStatus == '3'}">
														취소
													</c:if>
												</td>
												<td>
													<c:if test="${offUse.ouiStatus == '2'}">
														<button type="button" onclick="manage(${offUse.ouiNum}, 3)">취소</button>
													</c:if>
												</td>
											</tr>
										</c:forEach>
										
										<tr>
											<td colspan="7" style="text-align: right">
												<button onclick="goPage('/views/off-use/offUseInsert')">연차 신청</button>
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

	<form action="/off-use/updateStatus" method="POST" id="offUseUpdateForm">
		<input type="hidden" name="page" value="${param.page}">
		<input type="hidden" id="ouiNum" name="ouiNum">
		<input type="hidden" id="ouiStatus" name="ouiStatus">
		<input type="hidden" name="url" value="/off-uses">
	</form>
<script>
function searchCerti(){
	document.querySelector('#certiForm').submit();
}
function manage(ouiNum, ouiStatus){
	document.querySelector('#ouiNum').value = ouiNum;
	document.querySelector('#ouiStatus').value = ouiStatus;
	document.querySelector('#offUseUpdateForm').submit();
}
</script>
</body>
</html>