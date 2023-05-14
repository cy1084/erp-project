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
			<div class="card">
				<div class="card-body">
					<div class="m-sm-4">
						<form action="/off-use/insert" method="POST">
							<div class="mb-3">
							
								<label class="form-label" for="ouiDay">연차 날짜</label>
								<div class="input-group input-daterange ">
								    <input type="text" class="form-control" id="ouiDay" name="ouiDay" class="form-control form-control-lg" onchange="changeDate">
								</div>
							</div>
							<div class="mb-3">
							
								<label for="ouiType" class="form-label">연차 타입</label>
								<select name="ouiType" id="ouiType" class="form-select mb-3">
									<option value="1">휴가</option>
									<option value="2">반차</option>
									<option value="3">병가</option>
									<option value="4">조의</option>
								</select>
							</div>
							<div class="text-center mt-3">
								<button type="submit" class="btn btn-lg btn-primary">연차 신청</button>
							</div>
							<input type="hidden" name="ouiStart" id="ouiStart">
							<input type="hidden" name="ouiEnd" id="ouiEnd">
						</form>
					</div>
				</div>
			</div>
			</main>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
<body>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
Date.prototype.yyyymmdd = function() {
	  var mm = this.getMonth() + 1; // getMonth() is zero-based
	  var dd = this.getDate();

	  return [this.getFullYear(),
	          (mm>9 ? '' : '0') + mm,
	          (dd>9 ? '' : '0') + dd
	         ].join('');
	};
function changeDate(){
	console.log(this.value);
}
$(function() {
	let date = new Date();
	alert(date);
	document.querySelector('#ouiStart').value = date.yyyymmdd();
	document.querySelector('#ouiEnd').value = date.yyyymmdd();
  $('input[name="ouiDay"]').daterangepicker({
    opens: 'left'
  }, function(start, end, label) {
	  document.querySelector('#ouiStart').value = start.format('YYYYMMDD');
	  document.querySelector('#ouiEnd').value = end.format('YYYYMMDD');
  });
});
</script>
</body>
</html>