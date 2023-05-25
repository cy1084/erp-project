/**
 * 
 */
function goPage(pathName){
	location.href=pathName;
}
//data-total="${page.total}" data-page-num="${page.pageNum}" data-block-size="10
window.addEventListener('DOMContentLoaded', function(){
	let pathName = window.location.href;
	const menus = document.querySelectorAll('li.sidebar-item[data-menu]');
	for(const menu of menus){
		menu.classList.remove('active');
		if(pathName === menu.getAttribute('data-menu')){
			menu.classList.add('active');
		}
	}
	const paginationObj = document.querySelector('table[data-pages]');
	if(paginationObj){
		const pages = paginationObj.getAttribute('data-pages');
		if(pages==='0'){
			return;
		}
		
		if(!pathName.includes('?')){
			pathName += '?';
		}
		const pagePrefix = paginationObj.getAttribute('data-page-prefix')?paginationObj.getAttribute('data-page-prefix'):'';
		let pageStr = pagePrefix + 'page';
		if(pathName.includes(pageStr)){
			const regex = new RegExp(`&${pageStr}=+[0-9]*`, 'g');
			pathName = pathName.replace(regex,'');
		}
		pathName += '&' + pageStr + '=';
		const pageNum = paginationObj.getAttribute('data-page-num');
		const startBlock = Math.floor((pageNum - 1)/10)*10+1;
		const beforBlock = startBlock!=1?startBlock-1:1;
		const endBlock = (startBlock + 9)> pages ? pages : startBlock + 9;
		const afterBlock = endBlock!=pages?endBlock+1:endBlock;
		let html = '							<nav aria-label="Page navigation example" id="pagination"  >'
				+ '							      <ul class=\'pagination justify-content-center\'>\n';
		if(pageNum!=1){
			html +='										<li class=\'page-item\'>\n'
				+ '											<a class=\'page-link\' href=\'' +pathName+ (beforBlock) +'\' aria-label=\'Previous\'> \n'
				+ '												<span aria-hidden=\'true\'>&laquo;</span>\n'
				+ '											</a>\n'
				+ '										</li>\n';
		}
		for(let i=startBlock;i<=endBlock;i++){
			const active = i==pageNum?'active':''
			html += '										<li class=\'page-item ' + active + '\'><a class=\'page-link\' href=\'' +pathName+ i +'\'>' + i + '</a></li>\n'
		}
		if(pageNum!=endBlock){
			html += '										<li class=\'page-item\'>\n'
				+ '											<a class=\'page-link\' href=\'' +pathName+ (afterBlock) +'\' aria-label=\'Next\'> \n'
				+ '												<span aria-hidden=\'true\'>&raquo;</span>\n'
				+ '											</a>\n'
				+ '										</li>\n';
		}
		html += '									</ul>'
				+ ' 							</nav>';
		paginationObj.insertAdjacentHTML('afterend', html);		
		
	}
})