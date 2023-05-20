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
				
				<div class="container d-flex flex-column">
					<div class="row vh-100">
						<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
							<div class="d-table-cell align-middle">
								<div class="text-center mt-4">
									<h1 class="h2">상품 수정</h1>									
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">
											<form action="/product/insert" method="POST" id="productForm">
												<div class="mb-3">
													<label class="form-label" for="ciName">상품명</label> 
													<input class="form-control form-control-lg" type="text" name="piName" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciAge">제조사</label> 								
													<input class="form-control form-control-lg" type="text" name="piManufacture" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciGrade">수량</label> 								
													<input class="form-control form-control-lg" type="text" name="piStock" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciJob">단가</label> 								
													<input class="form-control form-control-lg" type="text" name="piPrice" />
												</div>
												<div class="text-center mt-3">
												
													<button class="btn btn-lg btn-primary">상품 등록</button>
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
<body>
</body>
</html>