<%@page contentType="text/html; charset=UTF-8" %>

	<!-- FOOTER =============================-->
	<div class="footer text-center">
		<div class="container">
			<div class="row">
				<p class="footernote">Connect with yogi</p>
				<ul class="social-iconsfooter">
					<li><a href="#"><i class="fa fa-phone"></i></a></li>
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
					<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
				</ul>
				
				<br />
            <p>
                <b>고객행복센터 1670-6250</b>
                오전 9시30분 - 오후 6시30분, 점심시간: 오후 1시30분 - 오후 2시30분
            </p>
            
            <address>
                <span>(주) 요기이노베이션</span>
                주소 : 서울특별시 종로구 관철동 종로코아빌딩 5층<br/>
                대표이사 : 홍길동 | 사업자등록번호: 123-86-00001<br/>
                전화번호 : 1577-1577<br/>
                전자우편주소 : yogi@gmail.com<br/>
                Copyright YOGIINNOVATION Corp. All rights reserved.
            </address>
			
			</div>
		</div>
	</div>

	<!-- SCRIPTS =============================-->
	<script src="${root }/resources/js/jquery-.js"></script>
	<script src="${root }/resources/js/bootstrap.min.js"></script>
	<script src="${root }/resources/js/anim.js"></script>
	<script>
		//----HOVER CAPTION---//	  
		jQuery(document).ready(function($) {
			$('.fadeshop').hover(function() {
				$(this).find('.captionshop').fadeIn(150);
			}, function() {
				$(this).find('.captionshop').fadeOut(150);
			});
		});
	</script>
</body>
</html>