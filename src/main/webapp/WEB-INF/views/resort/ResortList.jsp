<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/Top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리조트 리스트</title>
<style type="text/css">
	.list{margin-bottom: 15px;}
</style>
</head>
<body>
	
<!-- 	검색 정렬순서 -->
        <section class="module-small" style="padding-top: 50px; padding-bottom: 30px;">
          <div class="container">
          <h4 class="font-alt" align="center">리조트 게시판</h4>
            <form role="form" style="text-align:-webkit-center;">
                  <div class="search-box" style="width: 40%; margin-bottom: 10px;">
                    <input class="form-control" type="text" placeholder="Search..."/>
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
                </form>
                <div class="row" style="margin: 0;">
                <select class="form-control" style="width: 120px; float: left;">
                  <option selected="selected" disabled="disabled">지역선택</option>
                  <option>제주도</option>
                  <option>동해</option>
                  <option>서해</option>
                  <option>남해</option>
                </select>
                <select class="form-control" style="width: 120px; float: left; margin-left: 1%">
                  <option selected="selected" disabled="disabled">정렬 순서</option>
                  <option>후기 갯수</option>
                  <option>조회순</option>
                  <option>등록순</option>
                </select>
                </div>
<!-- 	검색 정렬순서 -->
<!-- 	리스트 -->
          	<div class="col-sm-10" style="margin-top: 2%;">
            <div class="row list">
              <div class="col-sm-6 col-md-8 col-lg-8" style="padding-left: 0%;"><img src="${contextPath}/resources/assets/images/section-1.jpg" alt="Title of Image"/></div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="work-details">
                  <h4 class="work-details-title font-alt">리조트 이름</h4>
                  <p> 150자 이내 리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명 </p>
                  <ul>
                    <li><strong>Client: </strong><span class="font-serif"><a href="#" target="_blank">SomeCompany</a></span>
                    </li>
                    <li><strong>Online: </strong><span class="font-serif"><a href="#" target="_blank">www.example.com</a></span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            
             <div class="row list">
              <div class="col-sm-6 col-md-8 col-lg-8" style="padding-left: 0%;"><img src="${contextPath}/resources/assets/images/section-1.jpg" alt="Title of Image"/></div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="work-details">
                  <h4 class="work-details-title font-alt">리조트 이름</h4>
                  <p> 150자 이내 리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명 </p>
                  <ul>
                    <li><strong>Client: </strong><span class="font-serif"><a href="#" target="_blank">SomeCompany</a></span>
                    </li>
                    <li><strong>Online: </strong><span class="font-serif"><a href="#" target="_blank">www.example.com</a></span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            
             <div class="row list">
              <div class="col-sm-6 col-md-8 col-lg-8" style="padding-left: 0%;"><img src="${contextPath}/resources/assets/images/section-1.jpg" alt="Title of Image"/></div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="work-details">
                  <h4 class="work-details-title font-alt">리조트 이름</h4>
                  <p> 150자 이내 리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명리조트 설명 </p>
                  <ul>
                    <li><strong>Client: </strong><span class="font-serif"><a href="#" target="_blank">SomeCompany</a></span>
                    </li>
                    <li><strong>Online: </strong><span class="font-serif"><a href="#" target="_blank">www.example.com</a></span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
           </div>
            <!-- 우측 네비바 -->
			<div class="col-sm-2 col-md-2 sidebar" style="margin-top:2%;">
					<div class="widget">
						<h5 class="widget-title font-alt" style="font-size: 12px"><mark>인기 리조트</mark></h5>
						<ul class="icon-list">
							<li><a href="#">Photography - 7</a></li>
							<li><a href="#">Web Design - 3</a></li>
							<li><a href="#">Illustration - 12</a></li>
							<li><a href="#">Marketing - 1</a></li>
							<li><a href="#">Wordpress - 16</a></li>
						</ul>
					</div>
					<div class="widget">
						<h5 class="widget-title font-alt" style="font-size: 12px"><mark>최근 본 리조트</mark></h5>
						<ul class="widget-posts">
							<li class="clearfix">
								<div class="widget-posts-image">
									<a href="#"><img src="${contextPath}/resources/assets/images/rp-3.jpg"
										alt="Post Thumbnail" /></a>
								</div>
								<div class="widget-posts-body">
									<div class="widget-posts-title">
										<a href="#">Designer Desk Essentials</a>
									</div>
									<div class="widget-posts-meta">23 january</div>
								</div>
							</li>
							<li class="clearfix">
								<div class="widget-posts-image">
									<a href="#"><img src="${contextPath}/resources/assets/images/rp-4.jpg"
										alt="Post Thumbnail" /></a>
								</div>
								<div class="widget-posts-body">
									<div class="widget-posts-title">
										<a href="#">Realistic Business Card Mockup</a>
									</div>
									<div class="widget-posts-meta">15 February</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- 우측 네비바 -->
			  <div class="col-sm-12" style="text-align: center;">
                <div class="pagination font-alt"><a href="#"><i class="fa fa-angle-left"></i></a><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a></div>
              </div>
 			</div>
                 </section>
<!-- 	리스트 -->
	<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>