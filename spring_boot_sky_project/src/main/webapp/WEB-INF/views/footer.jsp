<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- footer ìì -->
	<footer class="footer text-center text-lg-start text-white" style="background-color: #929fba">
    	<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">Â© 2023 Copyright: 日本語単語</div>
	</footer>
    
    <div class="scroll-top-wrapper ">
	  <span class="scroll-top-inner"><i class="xi-angle-up"></i></span>
	</div>
</body>
<script>
$(document).ready(function(){

	$(function(){
	 
	    $(document).on( 'scroll', function(){
	 
	    	if ($(window).scrollTop() > 10) {
				$('.scroll-top-wrapper').addClass('show');
			} else {
				$('.scroll-top-wrapper').removeClass('show');
			}
		});
	 
		$('.scroll-top-wrapper').on('click', scrollToTop);
	});
	 
	function scrollToTop() {
		verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
		element = $('body');
		offset = element.offset();
		offsetTop = offset.top;
		$('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
	}

});
</script>
</html>