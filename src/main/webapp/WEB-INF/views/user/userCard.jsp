<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>인사기록카드</title>
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
	height: 842px;
	margin: 0 auto;
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
<%--div.picture1 {
   background-image:url('/resource/static/img/photos/seal.png');
   background-repeat:no-repeat;
   background-position: right 5% bottom;
   margin:0; /* If you want no margin */
   padding:0; /*if your want to padding */
}--%>

.circular--landscape { 
	display: inline-block; 
	position: relative; 
	width: 180px; 
	height: 180px; 
	overflow: hidden; 
	border-radius: 50%; 
} 
	
.circular--landscape img {
	position: absolute; 
	width: auto; 
	height: 100%; 
	display:block;
	margin-left: auto; 
	margin-right: auto;
	top:50%;
	left:50%;
	transform:translate(-50%, -50%);
}
.circular--parent {
	display: flex;
  	justify-content:center; 
  	align-items : center;
  	margin-bottom: 48px;
}
</style>
<body>
	<div id="wrap" class="border">
		<div class="container">
			<h1 class="center">인사기록카드</h1>
			<div class="circular--parent">
			<div class="circular--landscape"> 
				<c:if test="${user.uiFilePath==null}">
				<img src="/resource/static/img/avatars/default.png" id="profile"/>
				</c:if>
				<c:if test="${user.uiFilePath!=null}">
				<img src="/resource/upload/${user.uiFilePath}" id="profile"/>
				</c:if>
			</div>
			</div>
			<form action="/user/view" method="GET" value="${user.uiNum}">		
				<table class="center">
				<tr>
					<th class="border borderleft">성명</th>
					<td class="border">${user.uiName}</td>
					<th class="border">생년월일</th>
					<td class="border borderright">${user.uiBirth }</td>
				</tr>
				<tr>
					<th class="border borderleft">성별</th>
					<td class="border">${user.uiTrans}</td>
					<th class="border">이메일</th>
					<td class="border borderright">${user.uiEmail }</td>
				</tr>
				<tr>
					<th class="border borderleft">부서</th>
					<td class="border">${user.diName }</td>
					<th class="border">직급</th>
					<td class="border borderright">${user.giName }</td>
				</tr>
				<tr>
					<th class="border borderleft">주소</th>
					<td class="border borderright left" colspan="3">${user.uiAddress }</td>
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
				
			</table>
		</form>
		</div>
	</div>
</body>
</html>