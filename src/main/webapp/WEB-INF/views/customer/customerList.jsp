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
		
			<main class="content">
				<div class="container-fluid p-0">
					<h1 class="h3 mb-3"><strong>고객 목록</strong></h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>고객아이디</th>
											<th>고객이름</th>
											<th>나이</th>
											<th>등급</th>
											<th>직업</th>
											<th>적립금</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${customerList}" var="customer">
										<tr onclick="goPage('/customer/view?ciId=${customer.ciId}')" style="cursor:pointer">
											<td >${customer.ciId}</td>
											<td >${customer.ciName}</td>
											<td >${customer.ciAge}</td>
											<td >${customer.ciGrade}</td>
											<td >${customer.ciJob}</td>
											<td >${customer.ciPoint}</td>
										</tr>
									</c:forEach>
										<tr>
											<td colspan="3" style="text-align:right">
												<button onclick="goPage('/views/customer/customerInsert')">등록</button>
											</td>
										</tr>
									</tbody>
								</table>
								
							</div>
						</div>
					</div>

				</div>
			</main>
			
		
		</div>
	</div>
<script>
function goPage(url){
	location.href = url;
}
</script>

</body>
</body>
</html>