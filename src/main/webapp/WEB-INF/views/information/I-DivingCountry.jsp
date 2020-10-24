<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/Top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<section class="module">
	      <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
              <h2 class="module-title font-alt" style="margin-bottom: 20px">대한민국</h2>
            </div>
          </div>
          <div class="container">
<!--           이미지 -->
            <div class="row">
            <div class="col-sm-3 mb-sm-20" style="margin-bottom: 15px;">
                <select class="form-control" style="width: 100px; float: left;">
                  <option selected="selected">Korea</option>
                  <option>미국</option>
                </select>
                <select class="form-control" style="width: 100px;">
                  <option selected="selected" disabled="disabled">지역선택</option>
                  <option>제주</option>
                  <option>동해</option>
                  <option>서해</option>
                </select>
                <a href="${contextPath}/EnterCountry.info">나라 등록</a>
              </div>
              <div class="col-sm-12"><img src="${contextPath}/resources/assets/images/section-1.jpg" alt="Title of Image"/></div>
            </div>
<!--             이미지 -->
<!-- 추천지역 -->
            <div class="row multi-columns-row post-columns" style="margin-top: 25px;">
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post">
                  <div class="post-thumbnail"><a href="#"><img src="${contextPath}/resources/assets/images/post-1.jpg" alt="Blog-post Thumbnail"/></a></div>
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="#">지역 1</a></h2>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post">
                  <div class="post-thumbnail"><a href="#"><img src="${contextPath}/resources/assets/images/post-2.jpg" alt="Blog-post Thumbnail"/></a></div>
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="#">지역 2</a></h2>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post">
                  <div class="post-thumbnail"><a href="#"><img src="${contextPath}/resources/assets/images/post-3.jpg" alt="Blog-post Thumbnail"/></a></div>
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="#">지역 3</a></h2>
                  </div>
                </div>
              </div>
            </div>
<!-- 추천지역 -->
<!-- 			메인 설명 -->
            <div class="row multi-columns-row" style="margin-top: 20px;">
              <div class="col-sm-18 col-md-12 col-lg-12">
				<p style="font-size: 14px;">일반적으로 스쿠버 다이빙을 열대바다의 투명한 물속에서 즐기는 다이빙이라 생각하기 쉬운데 우리나라의 바다는 해외의 바다와는 다른 아름다움을 간직하고 있다.<br>
				 강이든 바다든 일단은 물이 있는 모든 곳에서는 다이빙이 가능하다고 생각하면 이해하기 쉽다.<br>
				우리나라 바다는 수온이 계절에 따라 달라지며 열대바다와 달리 수온이 낮아 웻수트 다이빙은 제한적이다.<br>
				최근은 수온이 많이 높아진 편이어서 여름에 3mm 수트로도낮은 수심에서는 가능할 때도 있으나 일반적으로는 최소 5mm 수트가 필수이다. 보통 5mm 수트에 후드베스트를 추가로 입어주어 수온이 20도 가까이 떨어지는 11월까지는 다이빙이 가능. 12월부터는 7mm 수트나 드라이가 필요하다.<br>
				강이 얼어붙는 겨울철에는 가평, 홍천 등지에서 드라이수트를 착용하고 아이스 다이빙을 즐기는 모습을 이제 심심찮게 볼 수 있다.<br>
				대체로 한국의 특히 동해 바다는 시베리아 한류의 영향으로 열대바다에 비해 탁한 시야와 차가운 수온으로 하드한 환경이지만 물때를 잘 맞춰가면 시야가 탁 트이는데 (다이버들 사이에서는 "청물이 들어온다" 라고 표현한다) 한국 바다 나름의 아름다움을 느낄 수 있다.<br>
				횟감으로나 보던 녀석들이 내 주변을 둘러싸고 있어!<br>
				낚시할 때 사용하는 물때 체크 어플 같은 것이 제법 유용하게 쓰인다.<Br>
				조금을 전후로 조류가 약해질 때가 대체로 시야가 좋아지는 편이다.<br>
				 한국 바다의 시야는 열대바다에 비해 물때의 영향을 매우 많이 받는 편이다.<br>
				  예를 들어 동해에서도 시야가 잘 나오는 편이라는 얘길 듣는 포항 앞바다 청물이 들어올 때는 10미터 아래에 있는 다이버들이 거뭇거뭇하게 보일정도로 물이 맑아지기도 한다.<br>
				 하지만 한번 물이 뒤집어지거나, 물때가 좋지 않을때는 입수하는 순간 버디가 사라지고 하강줄도 보이지 않고 내 잔압계도 겨우 보일 정도로 탁해지기도 한다.<br>
				 열대바다에서 다이빙을 하고 한국바다에 처음 들어가는 다이버들은 이 때 패닉이 오는 경우가 많아 주의가 필요하다.<br>
				제주도는 쿠로시오 난류의 지류가 올라오기 때문에 그 영향으로 수온이 좀 더 높고 시야도 대체로 맑은 편이다.<br>
				 최근 수온변화로 열대어종들도 보이게 되었다.
국내 해안가에 위치한 다이빙 샵/리조트는 인근 해역에서 다이빙을 즐길 수 있는 포인트를 발굴하여 많은 동호인들이 즐기고 있다.</p>
              </div>
            </div>
<!--             메인 설명 -->
          </div>
        </section>
<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>