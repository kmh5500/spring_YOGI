<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<%@include file="/ssi/ssi.jsp" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content">

		<div class="reserve">

			<!-- Right Content -->
			<div class="right">
				<section class="info">
					<p class="name">
						<strong>레스토랑이름&nbsp;</strong>요기 레스토랑
					</p>

					<p>
						<strong>예약시간&nbsp;</strong>11.16 금 15:00
					</p>
				</section>
				<section class="total_price_pc">

					<ul>
						<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
						<li>예약완료 후 <span>예약자 이름</span>으로 바로 <span>입장</span> 하시면 됩니다
						</li>
					</ul>
				</section>

				<button type="button" class="btn_pay gra_left_right_red"
					onclick="payment_confirm();">예약하기</button>
			</div>

			<!-- Left Content -->
			<Form name='frm' method='POST' action='/booking/create'
				onsubmit="return incheck(this)" enctype="multipart/form-data">
				
				<div class="left">

					<!-- 예약자 이름 -->

					<section class="info_chkin">
						<h3>예약자 정보</h3>
						<br> <strong>예약자 이름</strong>
						<p class="inp_wrap remove">
							<input type="text" name="do_user_name"
								onblur="reserveVadlidationCheck('name');"
								placeholder="예약시 필요한 정보입니다." value="" />
						</p>
						<p class="alert_txt" data-show="name" style="visibility: hidden;">한글,영문,숫자만
							입력이 가능합니다.</p>

						<strong class="mt_09">이메일 </strong> <span class="safety_txt">예약확정
							결과를 메일로 발송해드립니다.</span>

						<div class="email_confirm">
							<section>
								<p class="inp_wrap">
									<input type="email" id="email" name="do_user_email"
										placeholder="예약시 필요한 정보입니다." value="" />@ <select
										name="select_email">
										<option value="naver">naver.com</option>
										<option value="daum">daum.com</option>
										<option value="gmail">gmail.com</option>
										<option value="hanmail">hanmail.com</option>
									</select>
								</p>
								<p class="alert_txt" data-show="tel" style="visibility: hidden;">이메일
									양식을 확인해주세요.</p>
							</section>
						</div>

					</section>

					<!-- 비로그인 -->

					<!-- 구매 정보 -->
					<section class="coupon_wrap">

						<p>
							<button id="couponBtn">사용 가능 쿠폰 0장</button>
							<span class="val" id="couponVal">-</span>
						</p>
					</section>

					<!--안내사항 -->
					<section class="price_wrap">

						<ul>
							<li>예약완료 후 <span>예약자 이름</span>으로 바로 <span>입장</span> 하시면 됩니다
							</li>
							<li>예약 후 <span>계산시 </span>쿠폰적용 후 금액으로 결제됩니다
							</li>
							<li>예약시간 <span>1시간전 취소는 </span>불가하며, 패널티가 부과됩니다
							</li>
						</ul>
					</section>


					<!-- 동의 -->
					<section class="agree">
						<p class="all_check">
							<label><input type="checkbox" name="checkAll"
								class="inp_chk_02" /> <span>전체 동의</span></label>
						</p>
						<p>
							<input type="checkbox" name="checkOne" class="inp_chk_02" /> <span
								onclick="pop_agree_01();">이용규칙 및 취소/환불규정 동의 <b>(필수)</b></span>
						</p>
						<p>
							<input type="checkbox" name="checkOne" class="inp_chk_02" /> <span
								onclick="pop_agree_02();">개인정보 수집 및 이용 동의 <b>(필수)</b></span>
						</p>
						<p>
							<input type="checkbox" name="checkOne" class="inp_chk_02" /> <span
								onclick="pop_agree_03();">개인정보 제 3자 제공 동의 <b>(필수)</b></span>
						</p>


					</section>


					<button type="button" class="btn_pay gra_left_right_red"
						onclick="payment_confirm();">예약하기</button>
				</div>

			</Form>
		</div>

	</div>
</body>
</html>