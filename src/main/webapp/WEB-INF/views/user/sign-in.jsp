<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</style>

<body>
	<div class="wrapper">
		<c:import url="/WEB-INF/views/common/nav.jsp" />

		<div class="main">
			<c:import url="/WEB-INF/views/common/top.jsp" />
			<main class="d-flex w-100">
				<div class="container d-flex flex-column">
					<div class="row vh-100">
						<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
							<div class="d-table-cell align-middle">

								<div class="text-center mt-4">
									
									<p class="lead">Sign in to your account to continue</p>
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4"></div>
										<form action="/user/sign-in" method="POST" onsubmit="return validation()">
											<div class="mb-3">
												<label class="form-label">아이디</label> <input
													class="form-control form-control-lg" type="text"
													id="uiId"
													name="uiId" placeholder="아이디를 입력해주세요." />
											</div>
											<div class="mb-3">
												<label class="form-label">비밀번호</label> 
												<input class="form-control form-control-lg" type="password"
													id="uiPwd"
													name="uiPwd" placeholder="비밀번호를 입력해주세요." /> <small>
													<a href="#" data-modal="test" data-title="비밀번호 초기화"
													data-yes="clickYes"
													data-body="초기화 신청을 하시겠습니까?<br><input type='text' id='id' placeholder='초기화할 아이디를 입력해주세요' class='form-control form-control-lg' >">비밀번호를 잊으셨나요?</a>
												</small>
											</div>
											<!--  <div>
												<label class="form-check"> <input
													class="form-check-input" type="checkbox"
													value="remember-me" name="remember-me" checked> <span
													class="form-check-label"> Remember me next time </span>
												</label>
											</div>
											-->
											<div class="text-center mt-3">

												<button type="submit" class="btn btn-lg btn-primary" style="font-size:15px">로그인</button>
											</div>
										</form>
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
	<script src="/resource/static/js/app.js"></script>
<form method="post" action="/user/pass-init" id="passInitForm">
	<input type="hidden" name="uiId" id="initUiId">
</form>
<script>
function validation(){
	const uiId = document.querySelector('#uiId');
	const uiPwd = document.querySelector('#uiPwd');
	if(uiId.value.trim().length<3){
		alert('아이디는 3글자 이상입니다.');
		uiId.value = '';
		uiId.focus();
		return false;
	}
	if(uiPwd.value.trim().length<1){ //이후 전시회 할때는 4자로 바꿀 예정
		alert('비밀번호는 1글자 이상입니다.');
		uiPwd.value = '';
		uiPwd.focus();
		return false;
	}
	return true;
}
function clickYes(){
	if(document.querySelector('#id').value.trim().length<3){
		alert('아이디를 작성해주세요.')
		return;
	}
	$.post({
		url : '/user/pass-req',
		data : JSON.stringify({'uiId' : document.querySelector('#id').value.trim()}),
		contentType: 'application/json; charset=utf-8',
		success : function(res){
			alert(res.msg);
			if(res.result === 'TRUE'){
				$('#commonModal').modal("hide");
			}
		}
	})
}
function clickNo(){
	$('#commonModal').modal("hide");
}
</script>
</body>

</html>