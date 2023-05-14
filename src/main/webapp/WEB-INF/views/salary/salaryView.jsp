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
					<div class="row">
						<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
							<div class="d-table-cell align-middle">
					

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4" >
											<form action="/salary/update" method="POST" id="salaryForm"> 
												<input type="hidden" name="uiNum" value="${salary.uiNum}">
												
										   	<div class="mb-3"> 
													<label class="form-label" for="uiId">사원번호</label> 
													 <input class="form-control form-control-lg" type="text" name="uiId"  value="${salary.uiId}"/> 
											  	</div>  
												 	<div class="mb-3"> 
													<label class="form-label" for="uiName">이름</label> 
													<input class="form-control form-control-lg" type="text" name="uiName"  value="${salary.uiName}"/>
												  	</div>  
												 	<div class="mb-3"> 
													<label class="form-label" for="siYear">연차</label> 
													<input class="form-control form-control-lg" type="text" name="siYear"  value="${salary.siYear}"/>
												
											
											
												 	<div class="mb-3">
													<label class="form-label" for="basePay">연봉</label> 
													<input class="form-control form-control-lg" type="text" name="basePay" value="${salary.basePay}"/>
												  	</div>  
													<div class="mb-3"> 
													<label class="form-label" for="mealAllowance">식대</label> 
													<input class="form-control form-control-lg" type="text" name="mealAllowance"  value="${salary.mealAllowance}"/>
												  	</div>  
												 	<div class="mb-3"> 
													<label class="form-label" for="carMaintenance">차량유지비</label> 
													<input class="form-control form-control-lg" type="text" name="carMaintenance"  value="${salary.carMaintenance}"/>
												  	</div>  
												 	<div class="mb-3"> 
													<label class="form-label" for="eduExpense">교육지원비</label> 
													<input class="form-control form-control-lg" type="text" name="eduExpense"  value="${salary.eduExpense}"/>
												  	</div>  						  	
										 			<div class="mb-3"> 
													<label class="form-label" for="extensionAllowance">연장수당</label> 
													<input class="form-control form-control-lg" type="text" name="extensionAllowance"  value="${salary.extensionAllowance}"/>
												  	</div> 
												 	<div class="mb-3"> 
													<label class="form-label" for="specialAllowance">특별수당</label> 
													<input class="form-control form-control-lg" type="text" name="specialAllowance"  value="${salary.specialAllowance}"/>
												  	</div>  
												 	<div class="mb-3"> 
													<label class="form-label" for="dutyAllowance">직급수당</label> 
													<input class="form-control form-control-lg" type="text" name="dutyAllowance"  value="${salary.dutyAllowance}"/>
												  	</div>  
												 	<div class="mb-3"> 
													<label class="form-label" for="retirementPay">퇴직금</label> 
													<input class="form-control form-control-lg" type="text" name="retirementPay"  value="${salary.retirementPay}"/>
												  	</div>  
												
												
												  <div class="text-center mt-3">
													<button type="button" onclick="changeAction(1)" class="btn btn-lg btn-primary">급여 수정</button>
													</div>
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
		if(type==1)		
		document.querySelector('#salaryForm').submit();
	}
	</script>

<body>
</body>
</html>