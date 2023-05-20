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
											<form action="/product/update" method="POST" id="productForm">
												<div class="mb-3">
													<label class="form-label" for="ciId">상품번호</label> 								
													<input class="form-control form-control-lg" type="text" name="piNum" value="${product.piNum}" readonly/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciName">상품명</label> 
													<input class="form-control form-control-lg" type="text" name="piName" value="${product.piName}"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciAge">제조사</label> 								
													<input class="form-control form-control-lg" type="text" name="piManufacture" value="${product.piManufacture}"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciGrade">수량</label> 								
													<input class="form-control form-control-lg" type="text" name="piStock" value="${product.piStock}"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciJob">단가</label> 								
													<input class="form-control form-control-lg" type="text" name="piPrice" value="${product.piPrice}"/>
												</div>
												<div class="text-center mt-3">
												
													<button type="button" onclick="changeAction(1)" class="btn btn-lg btn-primary">상품 수정</button>
													<button type="button" onclick="changeAction(2)" class="btn btn-lg btn-primary">상품 삭제</button>
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
			document.querySelector('#productForm').action='/product/delete'
		}
		document.querySelector('#productForm').submit();
	}
</script>
</body>
</html>