<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>재직증명서</title>
</head>

<style>
.d-flex {
	display: flex;
}

.flex-column {
	flex-direction: column;
}

.d-block {
	display: block;
}

.border {
	border: 1px solid #333;
}

.borderleft {
	border-left: none;
}

.borderright {
	border-right: none;
}

.center {
	text-align: center;
}

.left {
	text-align: left;
}

.right {
	text-align: end;
}

#wrap {
	width: 595px;
	height: 640px;
	margin: 0 auto;
	margin-top: 50px;
}

h1 {
	margin: 60px 0;
	letter-spacing: 16px;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 60px;
}

th, td {
	padding: 10px 12px;
}

.bottom {
	padding: 4px 8px;
	gap: 10px;
}

.bottom>span {
	margin: 40px 0;
}

.bottom>div {
	gap: 16px;
	margin-top: 32px;
	padding-right: 20px;
}



.text-center mt-3{

}
</style>
<body>
	<form action="/certi/insert" method="POST">
	<div id="wrap" class="border">
		<div class="container">
			<h1 class="center">재직증명서</h1>
			<input type="hidden" name="uiNum" value="${user.uiNum}">
			
			<table class="center">
				<tr>
					<th class="border borderleft">성명</th>
					<td class="border">${user.uiName}</td>
					<th class="border">생년월일</th>
					<td class="border borderright" >${user.uiBirth }</td>
				</tr>
				<tr>
					<th class="border borderleft">부서</th>
					<td class="border">${user.diName }</td>
					<th class="border">직위</th>
					<td class="border borderright">${user.giName }</td>
				</tr>
				<tr>
					<th class="border borderleft">현주소</th>
					<td class="border borderright left" colspan="3">서울 마포구 월드컵북로5가길 22</td>
				</tr>
				<tr>
					<th class="border borderleft">담당업무</th>
					<td class="border borderright left" colspan="3">${user.uiDuties}</td>
				</tr>
				<tr>
					<th class="border borderleft">재직기간</th>
					<td class="border borderright left" colspan="3">
					 ${user.credat} - 
					 <c:if test="${user.outdat ==null }">
					 	현재
					 </c:if>
					 <c:if test="${user.outdat !=null }">
					 	${user.outdat}
					 </c:if>
					</td>
				</tr>
				<tr>
					<th class="border borderleft">용도</th>
					
					<td class="border borderright left" colspan="3">
					
						<select name="ucType"> <!-- onchange="searchCerti()" -->
									<option value="">선택</option>
									<option value="1" ${param.ucType==1?'selected':''}>금융기관 제출용</option>
									<option value="2" ${param.ucType==2?'selected':''}>관공서 제출용</option>
									<option value="3" ${param.ucType==3?'selected':''}>회사 제출용</option>
						</select>
					</td>
				</tr>
								
			</table>
			<!--  
			
			<div class="bottom d-flex flex-column">
				
				<span class="d-block center">${date}</span>
				<div class="d-flex flex-column right picture1">
					<span></span>
					<span></span>
					<span>런타임</span>
					<span>대표 박경훈</span>
				</div>				
			</div>	
			-->		
		</div>
		
		<div class="text-center mt-3"><!-- /certies -->
					<button type="submit" class="btn btn-lg btn-primary" style="float:right">신청하기</button>					
	</div>
	</div>
	
	</form>
	
										
									
</body>


</html>