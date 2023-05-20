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
					<div class="row vh-100">
						<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
							<div class="d-table-cell align-middle">

								<div class="text-center mt-4">
									<h1 class="h3">공지 수정</h1>
								</div>

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">
											<form action="/notice/update" method="POST" enctype="multipart/form-data">
												<input type="hidden" name="uiNum" value="${user.uiNum}">
												<input type="hidden" name="niNum" value="${notice.niNum}">
												<div class="mb-3">
													<label class="form-label" for="niTitle">제목</label> 
													<input class="form-control form-control-lg" type="text" name="niTitle" placeholder="제목을 입력해주세요." value="${notice.niTitle }"/>
												</div>
												<div class="mb-3">
													<label class="form-label" for="niContent">내용</label>
													<textarea class="form-control" name="niContent" rows="10">${notice.niContent}</textarea>
												</div>
												<c:if test="${notice.niFilePath != null }">
													<div class="mb-3">
														<label class="form-label" for="niContent">사진</label>  
														<img src="/resource/upload/${notice.niFilePath}" class="img-fluid pe-2" alt="Unsplash">
													</div>
												</c:if>
												<div class="mb-3">
													<label class="form-label" for="niContent">파일</label>
													<input class="form-control form-control-lg" type="file" name="niFile"  />
												</div>
												<div class="text-center mt-3">
													<button type="submit" class="btn btn-lg btn-primary">공지 수정</button>
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
<body>
</body>
</html>