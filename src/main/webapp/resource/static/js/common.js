/**
 * 
 */
function goPage(pathname){
	location.href=pathname;
}
//data-total="${page.total}" data-page-num="${page.pageNum}" data-block-size="10
window.addEventListener('DOMContentLoaded', function(){
	const {pathname} = window.location;
	const menus = document.querySelectorAll('li.sidebar-item[data-menu]');
	for(const menu of menus){
		menu.classList.remove('active');
		if(pathname === menu.getAttribute('data-menu')){
			menu.classList.add('active');
		}
	}
	const paginationObj = document.querySelector('table[data-pages]');
	if(paginationObj){
		const pages = paginationObj.getAttribute('data-pages');
		if(pages==='0'){
			return;
		}
		const pathname = window.location.href;
		const pagePrefix = paginationObj.getAttribute('data-page-prefix')?paginationObj.getAttribute('data-page-prefix'):'';
		const pageStr = pagePrefix + 'page';
		const pageNum = paginationObj.getAttribute('data-page-num');
		const startBlock = Math.floor((pageNum - 1)/10)*10+1;
		const beforBlock = startBlock!=1?startBlock-1:1;
		const endBlock = (startBlock + 9)> pages ? pages : startBlock + 9;
		const afterBlock = endBlock!=pages?endBlock+1:endBlock;
		let html = '							<nav aria-label="Page navigation example" id="pagination"  >'
				+ '							      <ul class=\'pagination justify-content-center\'>\n'
				+ '										<li class=\'page-item\'>\n'
				+ '											<a class=\'page-link\' href=\'' +pathname +'&' + pageStr + '=' + (beforBlock) +'\' aria-label=\'Previous\'> \n'
				+ '												<span aria-hidden=\'true\'>&laquo;</span>\n'
				+ '											</a>\n'
				+ '										</li>\n';
		for(let i=startBlock;i<=endBlock;i++){
				const active = i==pageNum?'active':''
				html += '										<li class=\'page-item ' + active + '\'><a class=\'page-link\' href=\'' +pathname +'&' + pageStr + '=' + i +'\'>' + i + '</a></li>\n'
		}
				
		html += '										<li class=\'page-item\'>\n'
				+ '											<a class=\'page-link\' href=\'' +pathname +'&' + pageStr + '=' + (afterBlock) +'\' aria-label=\'Next\'> \n'
				+ '												<span aria-hidden=\'true\'>&raquo;</span>\n'
				+ '											</a>\n'
				+ '										</li>\n'
				+ '									</ul>'
				+ ' 							</nav>';
		paginationObj.insertAdjacentHTML('afterend', html);		
		
	}
})