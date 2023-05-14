<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<style>
	input::placeholder{
		font-size:15px;
	}
.circular--landscape { 
	display: inline-block; 
	position: relative; 
	width: 200px; 
	height: 200px; 
	overflow: hidden; 
	border-radius: 50%; 
} 

.circular--landscape--ori img { 
	
	width: auto; 
	height: 100%; 
	margin-left: 0px; 
	
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
  	margin-bottom: 24px;
}

</style>
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

								<div class="text-center mt-4">
									<h1 class="h2">내 프로필</h1>
									<p class="lead"></p>
								</div>
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
								<div class="circular--parent">
								<form action="/user/update" method="POST" enctype="multipart/form-data">
								<input type="file" name="uiFile" accept="image/*" onchange="loadFile(event)">
								</div>
								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">
												<div class="mb-3">
													<label class="form-label">사원번호 :</label> 
													${user.uiId}
												</div>
												<div class="mb-3">
													<label class="form-label">성별 :</label> 
													${user.uiTrans}
												</div>
												<div class="mb-3">
													<label class="form-label">이메일</label> <input
														class="form-control form-control-lg" type="email"
														name="uiEmail" placeholder="이메일을 입력해주세요." value="${user.uiEmail}"/>
												</div>
												<div class="mb-3">
													<label class="form-label">주소</label> <input
														class="form-control form-control-lg" type="text"
														name="uiAddress" placeholder="주소를 입력해주세요." value="${user.uiAddress}"/>
												</div>
												<div class="mb-3">
													<label class="form-label">생년월일</label> <input
														class="form-control form-control-lg" type="date"
														name="uiBirth" placeholder="생년월일을 입력해주세요." value="${user.uiBirth}"/>
												</div>
												<div class="mb-3">
													<label class="form-label">담당업무 :</label> 
													${user.uiDuties}
												</div>
												<div class="mb-3">
													<label class="form-label">직급 :</label> 
													 ${user.giName}
												</div>
												<div class="mb-3">
													<label class="form-label">부서 :</label> 
													 ${user.diName}
												</div>
												<div class="text-center mt-3">
													<button type="submit" class="btn btn-lg btn-primary">프로필 수정</button>
												</div>
										</div>
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</main>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
<script>
	const loadFile = function(event) {
		const output = document.querySelector('#profile');
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src) // free memory
		}
	};
</script>
</body>
</html>