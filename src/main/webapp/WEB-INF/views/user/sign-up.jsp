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

.circular--landscape { display: inline-block; position: relative; width: 200px; height: 200px; overflow: hidden; border-radius: 50%; } 
.circular--landscape img { width: auto; height: 100%; margin-left: 0px; }
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
									<h1 class="h2">사원 등록</h1>
									<p class="lead"></p>
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">
											<form action="/user/sign-up" method="POST" enctype="multipart/form-data">
												
												<div class="circular--landscape"> 
													<img src="/resource/static/img/avatars/default.png" id="profile"/> 
												</div>
												<input type="file" name="uiFile"  accept="image/*" onchange="loadFile(event)">
												<div class="mb-3">
													<label class="form-label">사원명</label> <input
														class="form-control form-control-lg" type="text"
														name="uiName" placeholder="이름을 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">성별</label><br> <label
														for="male">남자</label> <input class="form-check-input"
														type="radio" name="uiTrans" id="male" value="M" checked />
													<label for="female">여자</label> <input
														class="form-check-input" type="radio" name="uiTrans"
														id="female" value="F" />
												</div>
												<div class="mb-3">
													<label class="form-label">이메일</label> <input
														class="form-control form-control-lg" type="email"
														name="uiEmail" placeholder="이메일을 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">주소</label> <input
														class="form-control form-control-lg" type="text" id="uiAddress"
														name="uiAddress" placeholder="주소를 입력해주세요." />
													<button onclick="findAddr()" type="button">검색</button>
												</div>
												<div class="mb-3">
													<label class="form-label">생년월일</label> <input
														class="form-control form-control-lg" type="date"
														name="uiBirth" placeholder="생년월일을 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">담당업무</label> <input
														class="form-control form-control-lg" type="text"
														name="uiDuties" placeholder="담당할 업무를 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">직급</label> <select
														class="form-select mb-3" name="giNum">
														<option selected>선택</option>
														<c:forEach items="${gradeList}" var="grade">
														<option value="${grade.giNum}"> ${grade.giName}</option> 
														<!-- 옵션엔 기본키, 사용자가 봐야하는 건 name -->
														</c:forEach>
													</select>
												</div>
												<div class="mb-3">
													<label class="form-label">부서</label> <select
														class="form-select mb-3" name="diNum">
														<option selected>선택</option>
														<c:forEach items="${departmentList}" var="depart">
														<option value="${depart.diNum}">${depart.diName}</option>
														</c:forEach>
													</select>
												</div>
												<div class="mb-3">
													<label class="form-label">기본급</label> <input
														class="form-control form-control-lg" type="text"
														name="uiBasepay" placeholder="기본급을 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">교육지원비</label> <input
														class="form-control form-control-lg" type="text"
														name="uiEdu" placeholder="교육지원비를 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">차량유지비</label> <input
														class="form-control form-control-lg" type="text"
														name="uiCarmaintenance" placeholder="차량유지비를 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">식대</label> <input
														class="form-control form-control-lg" type="text"
														name="uiMeal" placeholder="식대를 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">연장수당</label> <input
														class="form-control form-control-lg" type="text"
														name="uiExtension" placeholder="연장수당을 입력해주세요." />
												</div>
												<div class="mb-3">
													<label class="form-label">특별수당</label> <input
														class="form-control form-control-lg" type="text"
														name="uiSpecial" placeholder="특별수당을 입력해주세요." />
												</div>
												
												<div class="text-center mt-3">
													<button type="submit" class="btn btn-lg btn-primary">사원 등록</button>
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
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('uiAddress').value = data.zonecode + ', ';
            if(roadAddr !== ''){
                document.getElementById("uiAddress").value += roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("uiAddress").value += jibunAddr;
            }
        }
    }).open();
}
const loadFile = function(event) {
	const output = document.querySelector('#profile');
	output.src = URL.createObjectURL(event.target.files[0]);
	output.onload = function() {
		URL.revokeObjectURL(output.src) // free memory
	}
};
</script>
<body>
</body>
</html>