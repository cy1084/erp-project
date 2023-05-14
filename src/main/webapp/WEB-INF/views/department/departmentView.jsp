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
									<h1 class="h2">부서 등록</h1>
									<p class="lead"  style="color:red">*부서명은 중복 될 수 없습니다.</p>
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">
											<form action="/department/update" method="POST" id="departmentForm">
												<input type="hidden" name="diNum" value="${department.diNum}">
												<div class="mb-3">
													<label class="form-label" for="diName">부서명</label> 
													<input class="form-control form-control-lg" type="text" name="diName" placeholder="부서명을 입력해주세요." value="${department.diName}"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="diDesc">부서 설명</label> 
													<input class="form-control form-control-lg" type="text" name="diDesc" placeholder="부서 설명을 입력해주세요." value="${department.diDesc}"/>
												</div>
												<div class="text-center mt-3">
													<button type="button" onclick="changeAction(1)" class="btn btn-lg btn-primary">부서 수정</button>
													<button type="button" onclick="changeAction(2)" class="btn btn-lg btn-primary">부서 삭제</button>
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
		function changeAction(type){
			if(type==2){
				document.querySelector('#departmentForm').action='/department/delete'
			}
			document.querySelector('#departmentForm').submit();
		}
	</script>
</body>
</html>