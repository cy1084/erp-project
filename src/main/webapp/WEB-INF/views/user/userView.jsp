<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />

<style>
.leftPage {
	width: 48%;
	float: left;
}

.rightPage {
	width: 48%;
	float: right;
}
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="/WEB-INF/views/common/nav.jsp" />

		<div class="main">
			<c:import url="/WEB-INF/views/common/top.jsp" />
			<main class="d-flex w-100">
				<div class="container d-flex flex-column mt-5">
					<div class="row">
						<!-- div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100" -->

						<div class="d-table-cell align-middle">

							<div>
								<div class="leftPage">
									<div class="card">
										<div class="text-center mt-4">
											<h1 class="h2">사원 정보</h1>
										</div>
										<div class="card-body">

											<!-- 기본정보, 수정하기 -->
											<form action="/user/updates" method="POST" id="userForm">
												<input type="hidden" name="uiNum" value="${user.uiNum}">
												<div class="mb-3">
													<label class="form-label" for="uiId">사원번호 : </label>
													${user.uiId}
												</div>
												<div class="mb-3">
													<label class="form-label" for="uiName">이름 : </label>
													${user.uiName}
												</div>
												<div class="mb-3">
													<label class="form-label" for="uiTrans">성별 : </label>
													${user.uiTrans}
												</div>
												<div class="mb-3">
													<label class="form-label" for="uiBirth">생년월일 : </label>
													${user.uiBirth}
												</div>
												<div class="mb-3">
													<label class="form-label" for="uiEmail">이메일 : </label>
													${user.uiEmail}
												</div>
												<div class="mb-3">
													<label class="form-label" for="uiAddress">주소 : </label>
													${user.uiAddress}
												</div>


												<div class="mb-3">
													<label class="form-label">직급</label> <select
														class="form-select mb-3" name="giNum">
														<option value="${user.giNum}" selected>${user.giName}</option>
														<c:forEach items="${gradeList}" var="grade">
															<option value="${grade.giNum}">${grade.giName}</option>

														</c:forEach>
													</select>
												</div>

												<div class="mb-3">
													<label class="form-label">부서</label> <select
														class="form-select mb-3" name="diNum">
														<option value="${user.diNum}" selected>${user.diName}</option>
														<c:forEach items="${departmentList}" var="depart">
															<option value=" ${depart.diNum}">${depart.diName}</option>
														</c:forEach>
													</select>
												</div>
												<div class="text-center mt-5">
													<h1 class="h2">급여</h1>
												</div>
												<div class="mb-3">
													<label class="form-label" for="basePay">기본급</label> <input
														class="form-control form-control-lg" type="text"
														name="uiBasepay" value="${user.uiBasepay}" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="mealAllowance">식대</label> <input
														class="form-control form-control-lg" type="text"
														name="uiMeal" value="${user.uiMeal}" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="carMaintenance">차량유지비</label>
													<input class="form-control form-control-lg" type="text"
														name="uiCarmaintenance" value="${user.uiCarmaintenance}" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="eduExpense">교육지원비</label> <input
														class="form-control form-control-lg" type="text"
														name="uiEdu" value="${user.uiEdu}" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="extensionAllowance">연장수당</label>
													<input class="form-control form-control-lg" type="text"
														name="uiExtension" value="${user.uiExtension}" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="specialAllowance">특별수당</label>
													<input class="form-control form-control-lg" type="text"
														name="uiSpecial" value="${user.uiSpecial}" />
												</div>

												<div class="mb-3">
													<label class="form-label" for="retirementPay">퇴직금</label> <input
														class="form-control form-control-lg" type="text"
														name="uiRetirement" value="${user.uiRetirement}" />
												</div>


												<div class="text-center mt-3">
													<button type="button" onclick="changeAction(1)"
														class="btn btn-lg btn-primary">사원정보 수정</button>

												</div>
											</form>

										</div>
									</div>
								</div>
								<!-- // 기본정보, 수정하기 -->
								<!-- 출퇴근, 연차 -->

								<div class="rightPage">
									<div class="card">
										<div class="card-body">

											<div>
												<div class="text-center mt-3">

													<h1 class="h2">근태</h1>

													<table class="table table-hover my-0"
														data-href-prefix="working." data-pages="${wiPage.pages}"
														data-page-num="${wiPage.pageNum}">
														<thead>
															<tr>
																<th>날짜</th>
																<th>출근 시간</th>
																<th>퇴근 시간</th>
																<th>근무 시간</th>


															</tr>
														</thead>
														<tbody>
															<c:if test="${empty wiPage.list }">
																<tr>
																	<th colspan="5">내용이 없습니다.</th>
																</tr>
															</c:if>
															<c:forEach items="${wiPage.list}" var="working">
																<tr>
																	<td>${working.wiDate}</td>
																	<td>${working.wiStart}</td>
																	<td>${working.wiEnd}</td>
																	<td>${working.wiEtc}</td>
																</tr>
															</c:forEach>

														</tbody>
													</table>
												</div>




												<div class="text-center mt-5">

													<h1 class="h2">연차</h1>

													<table class="table table-hover my-0"
														data-pages="${oiPage.pages}"
														data-page-num="${oiPage.pageNum}">
														<thead>
															<tr>

																<th>기준년도</th>
																<th>총 연차</th>
																<th>사용 연차</th>
																<th>잔여 연차</th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${empty oiPage.list }">
																<tr>
																	<th colspan="5">내용이 없습니다.</th>
																</tr>
															</c:if>
															<c:forEach items="${oiPage.list}" var="off">
																<tr>

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
								</div>
								<!-- //출퇴근,연차 -->

							</div>
						</div>

						<!-- /div -->
					</div>
				</div>
			</main>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
	<script>
		function changeAction(type) {
			if(type==1)
			document.querySelector('#userForm').submit();
		}
	</script>
</body>
</html>