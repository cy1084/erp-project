<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<div class="wrapper">
		<div class="main">
			<main class="d-flex w-100">
				<div class="container d-flex flex-column">
					<div class="row vh-100">
						<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
							<div class="d-table-cell align-middle">
								<div class="text-center mt-4">
									<h1 class="h2">고객 수정</h1>									
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">
											<form action="/customer/update" method="POST" id="customerForm">
												<div class="mb-3">
													<label class="form-label" for="ciId">고객아이디</label> 								
													<input class="form-control form-control-lg" type="text" name="ciId" value="${customer.ciId}" readonly/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciName">고객이름</label> 
													<input class="form-control form-control-lg" type="text" name="ciName" value="${customer.ciName}"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciAge">나이</label> 								
													<input class="form-control form-control-lg" type="text" name="ciAge" value="${customer.ciAge}"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciGrade">등급</label> 								
													<input class="form-control form-control-lg" type="text" name="ciGrade" value="${customer.ciGrade}"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciJob">직업</label> 								
													<input class="form-control form-control-lg" type="text" name="ciJob" value="${customer.ciJob}"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="ciPoint">적립금</label> 								
													<input class="form-control form-control-lg" type="text" name="ciPoint" value="${customer.ciPoint}"/>
												</div>
												<div class="text-center mt-3">
													<button type="button" onclick="changeAction(1)" class="btn btn-lg btn-primary">고객 수정</button>
													<button type="button" onclick="changeAction(2)" class="btn btn-lg btn-primary">고객 삭제</button>
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
			
		</div>
	</div>
<body>
<script>
		function changeAction(type){
			if(type==2){
				document.querySelector('#customerForm').action='/customer/delete'
			}
			document.querySelector('#customerForm').submit();
		}
	</script>
</body>
</html>