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
			<div class="container-fluid p-0">
					<h1 class="h3 mb-3"><strong>고객 목록</strong></h1>
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>상품번호</th>
											<th>상품명</th>
											<th>제조사</th>
											<th>수량</th>
											<th>단가</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${productList}" var="product">
										<tr onclick="goPage('/product/view?piId=${product.piNum}')" style="cursor:pointer">
											<td >${product.piNum}</td>
											<td >${product.piName}</td>
											<td >${product.piManufacture}</td>
											<td >${product.piStock}</td>
											<td >${product.piPrice}</td>
										</tr>
									</c:forEach>
										<tr>
											<td colspan="3" style="text-align:right">
												<button onclick="goPage('/views/product/productInsert')">등록</button>
											</td>
										</tr>
									</tbody>
								</table>
								
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