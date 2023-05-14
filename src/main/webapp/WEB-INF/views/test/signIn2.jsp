<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP</title>
</head>
<body>
	<form action="/test/signIn2" method="post" onsubmit="return validation()">
		<fieldset style="width:150">
			<label for="uiId">아이디</label>
			<input type="text" name="uiId" id="uiId"/><br><br>
			<label for="uiPwd">비밀번호</label>
			<input type="password" name="uiPwd" id="uiPwd"/><br><br>
    		<button>로그인</button><br><br>
    	</fieldset>
    </form>
    <script>
    	function validation(){
    		if(document.querySelector('#uiId').value.trim().length<3){
    			alert('아이디는 3글자 이상입니다.');
    			document.querySelector('#uiId').value='';
    			document.querySelector('#uiId'),focus();
    			return false;	
    		}
    		if(document.querySelector('#uiPwd').value.trim().length<3){
    			alert('비밀번호는 3글자 이상입니다.');
    			document.querySelector('#uiPwd').value='';
    			document.querySelector('#uiPwd'),focus();
    			return false;   		
    	}
    		return true;
	</script>
</body>
</html>