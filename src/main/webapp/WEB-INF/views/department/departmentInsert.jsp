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
									<h1 class="h3">부서 등록</h1>
									<p class="lead"  style="color:red">*부서명은 중복 될 수 없습니다.</p>
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">
											<form action="/department/insert" method="POST" onsubmit="return validation()">
												<div class="mb-3">
													<label class="form-label" for="diName">부서명</label>
													<input class="form-control form-control-lg" id="diName" type="text" name="diName" placeholder="부서명을 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label" for="diDesc">부서 설명</label> 
													<input class="form-control form-control-lg" id="diDesc" type="text" name="diDesc" placeholder="부서 설명을 입력해주세요." />
												</div>
												<div class="text-center mt-3">
													<button type="submit" class="btn btn-lg btn-primary">부서 등록</button>
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
	const diName = document.querySelector('#diName');  //id값
	const diDesc = document.querySelector('#diDesc');
	if(diName.value.trim().length<3){
		alert('부서명은 3글자 이상입니다.');
		diName.value = '';
		diName.focus();
		return false;
	}
	if(diDesc.value.trim().length<3){ 
		alert('부서 설명을 입력해주세요.');
		diDesc.value = '';
		diDesc.focus();
		return false;
	}
	return true;
}
</script>
</body>
</html>