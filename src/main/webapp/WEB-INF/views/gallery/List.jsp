<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../inc/Top.jsp" />
	<!-- 헤더 -->

	<!-- 게시판 이미지 글 출력 -->
	<section class="module">
		<div class="container">
		<!-- 리스트 -->
			<div class="row multi-columns-row post-columns">
				<div class="col-sm-8" style="width: 73%; margin-top: 2%;">
				<h1 class="module-title font-alt" style="margin-bottom: 30px;">수중 갤러리</h1>
                <form role="form" style="text-align:-webkit-center;">
                  <div class="search-box" style="width: 40%;">
                    <input class="form-control" type="text" placeholder="Search..."/>
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
                </form>
                <div class="row" style="margin: 15px;">
                <select class="form-control" style="width: 100px; float: left;">
                  <option selected="selected">등록순</option>
                  <option>좋아요순</option>
                  <option>조회순</option>
                </select>
              <button class="btn btn-border-d btn-round" style="float: right;">글쓰기</button>
                </div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-1.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">제목</a>
								</h2>
								<div class="post-meta">
									지역 | 좋아요 | 등록일자
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-2.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">Shore after the tide</a>
								</h2>
								<div class="post-meta">
									By&nbsp;<a href="#">Andy River</a>&nbsp;| 11 November | 4
									Comments
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-3.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">We in New Zealand</a>
								</h2>
								<div class="post-meta">
									By&nbsp;<a href="#">Dylan Woods</a>&nbsp;| 5 November | 15
									Comments
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-4.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">Plane in the field</a>
								</h2>
								<div class="post-meta">
									By&nbsp;<a href="#">Mark Stone</a>&nbsp;| 23 November | 3
									Comments
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-5.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">Clock</a>
								</h2>
								<div class="post-meta">
									By&nbsp;<a href="#">Andy River</a>&nbsp;| 11 November | 4
									Comments
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-6.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">Lighthouse to the shore</a>
								</h2>
								<div class="post-meta">
									By&nbsp;<a href="#">Dylan Woods</a>&nbsp;| 5 November | 15
									Comments
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-5.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">Clock</a>
								</h2>
								<div class="post-meta">
									By&nbsp;<a href="#">Andy River</a>&nbsp;| 11 November | 4
									Comments
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-5.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">Clock</a>
								</h2>
								<div class="post-meta">
									By&nbsp;<a href="#">Andy River</a>&nbsp;| 11 November | 4
									Comments
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="#"><img src="../assets/images/post-5.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">Clock</a>
								</h2>
								<div class="post-meta">
									By&nbsp;<a href="#">Andy River</a>&nbsp;| 11 November | 4
									Comments
								</div>
							</div>
							<div class="post-entry">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart.</p>
							</div>
						</div>
					</div>
				</div>
				<!-- 리스트 -->
				<!-- 우측 네비바 -->
				<div class="col-sm-4 col-md-3 col-md-offset-1 sidebar"
					style="margin-left: 2%; width: 25%; margin-top:16%; min-width: 292px;">
					<div class="widget">
						<h5 class="widget-title font-alt">인기 글</h5>
						<ul class="icon-list">
							<li><a href="#">제목 - 7</a></li>
							<li><a href="#">Web Design - 3</a></li>
							<li><a href="#">Illustration - 12</a></li>
							<li><a href="#">Marketing - 1</a></li>
							<li><a href="#">Wordpress - 16</a></li>
						</ul>
					</div>
					<div class="widget">
						<h5 class="widget-title font-alt">최근 본 글</h5>
						<ul class="widget-posts">
							<li class="clearfix">
								<div class="widget-posts-image">
									<a href="#"><img src="../assets/images/rp-3.jpg"
										alt="Post Thumbnail" /></a>
								</div>
								<div class="widget-posts-body">
									<div class="widget-posts-title">
										<a href="#">제목</a>
									</div>
									<div class="widget-posts-meta">글쓴이</div>
								</div>
							</li>
							<li class="clearfix">
								<div class="widget-posts-image">
									<a href="#"><img src="../assets/images/rp-4.jpg"
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
				<!-- 사이드 바 -->
			<!-- 페이징 -->
			</div>
              <div class="col-sm-12" style="text-align: center;">
                <div class="pagination font-alt"><a href="#"><i class="fa fa-angle-left"></i></a><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a></div>
              </div>
			<!-- 페이징 -->
		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="../inc/Footer.jsp" />
	<!-- 푸터 -->
</body>
</html>