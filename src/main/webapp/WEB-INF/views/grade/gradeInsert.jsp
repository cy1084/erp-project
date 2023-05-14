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
			<main class="d-flex w-100">
				<div class="container d-flex flex-column">
					<div class="row vh-100">
						<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
							<div class="d-table-cell align-middle">

								<div class="text-center mt-4">
									<h1 class="h3">직급 등록</h1>
									<p class="lead"  style="color:red">*직급명은 중복 될 수 없습니다.</p>
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">
											<form action="/grade/insert" method="POST" onsubmit="return validation()">
												<div class="mb-3">
													<label class="form-label" for="giName">직급명</label> 
													<input class="form-control form-control-lg" id="giName" type="text" name="giName" placeholder="직급명을 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label" for="giDesc">직급 설명</label> 
													<input class="form-control form-control-lg" id="giDesc" type="text" name="giDesc" placeholder="직급 설명을 입력해주세요." />
												</div>
												<div class="text-center mt-3">
													<button type="submit" class="btn btn-lg btn-primary">직급 등록</button>
												</div>
											</form>
										</div>
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
	<script>
function validation(){
	const giName = document.querySelector('#giName');
	const giDesc = document.querySelector('#giDesc');
	if(giName.value.trim().length<2){
		alert('직급명은 2글자 이상입니다.');
		giName.value = '';
		giName.focus();
		return false;
	}
	if(giDesc.value.trim().length<2){ 
		alert('직급 설명을 입력해주세요.');
		giDesc.value = '';
		giDesc.focus();
		return false;
	}
	return true;
}
</script>
</body>
</html>