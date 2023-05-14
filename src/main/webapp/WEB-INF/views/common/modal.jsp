<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="commonModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalTitle"></h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close" onclick="modalClose()">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn" type="button" id="modalYes" onclick="modalClose()">예</button>
				<button class="btn" type="button" id="modalNo" data-dismiss="modal" onclick="modalClose()">아니요</button>
			</div>
		</div>
	</div>
</div>
<script>
	const modalClose = function(){
		$('#commonModal').modal('hide');
	}
	document.addEventListener('DOMContentLoaded',function(){
		const modalObjs = document.querySelectorAll('[data-modal]');
		for(const modal of modalObjs){
			modal.addEventListener('click',function(e){
				e.preventDefault();
				document.querySelector('.modal-title').innerHTML = modal.getAttribute('data-title');
				document.querySelector('.modal-body').innerHTML = modal.getAttribute('data-body');
				const modalClickYes = window[modal.getAttribute('data-yes')];
				const modalClickNo = window[modal.getAttribute('data-no')];
				if(modalClickYes){
					document.querySelector('#modalYes').onclick = modalClickYes;
				}
				if(modalClickNo){
					document.querySelector('#modalNo').onclick = modalClickNo;
				}
				$('#commonModal').modal("show");
			});
		}
	})
</script>