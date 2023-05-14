<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<style>
	input::placeholder{
		font-size:15px;
	}

</style>

<body>
	<div class="wrapper">
		<c:import url="/WEB-INF/views/common/nav.jsp" />

		<div class="main">
			<c:import url="/WEB-INF/views/common/top.jsp" />
			<main class="d-flex w-100">
				<div class="container d-flex flex-column">
					<div class="row vh-100">
						<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
							<div class="d-table-cell align-middle">

								<div class="text-center mt-4">
									<h1 class="h2">비밀번호를 변경해주세요.</h1>
									<p class="lead">처음 사용하실 경우 비밀번호를 반드시 변경해주셔야 합니다.</p>
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4"></div>
										<form action="/user/changePwd" method="POST">
											<div class="mb-3">
												<label class="form-label">아이디</label> 
												<input class="form-control form-control-lg" type="text" name="uiId" value="${user.uiId}" disabled/>
											</div>
											<div class="mb-3">
												<label class="form-label">비밀번호</label> 
												<input class="form-control form-control-lg" type="password" name="uiPwd" placeholder="비밀번호를 입력해주세요." />
											</div>
											<div class="text-center mt-3">
												<button type="submit" class="btn btn-lg btn-primary" style="font-size:15px">비밀번호 변경</button>
											</div>
										</form>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</main>

			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
	<script src="/resource/static/js/app.js"></script>

</body>

</html>