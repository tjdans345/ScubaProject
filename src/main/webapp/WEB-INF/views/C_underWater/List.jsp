<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/Top.jsp" %>
<!DOCTYPE html>
<html>
<%
	request.getSession().setAttribute("category", "underwater");
%>
<head>
<link rel="shortcut icon" href="#">
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".wrt_btn").click(function() {
				location.href="${contextPath}/underWaterBoard/underWaterBoardWrite";
			});
		
			$(".view_btn").click(function() {
				var num = $(this).data("num");
				location.href="${contextPath}/underWaterBoard/underWaterBoardView?num="+num;
			});	
		
		
		});
	</script>
</head>
<body>
	<!-- 게시판 이미지 글 출력 -->
	<section class="module">
		<div class="container">
		<!-- 리스트 -->
			<div class="row multi-columns-row post-columns">
				<div class="col-sm-8" style="width: 73%; margin-top: 2%;">
				<h1 class="module-title font-alt" style="margin-bottom: 30px;">수중 갤러리</h1>
                <form role="form" style="text-align:-webkit-center;" onsubmit="return false">
                  <div class="search-box" style="width: 40%;">
            	    <input type="text" hidden="hidden" />
                    <input class="form-control" type="text" placeholder="Search..."/>
                    <button class="search-btn" type="button"><i class="fa fa-search"></i></button>
                  </div>
                </form>
                <div class="row" style="margin: 15px;">
                <select class="form-control" style="width: 100px; float: left;">
                  <option selected="selected">등록순</option>
                  <option>좋아요순</option>
                  <option>조회순</option>
                </select>
              <button class="btn btn-border-d btn-round wrt_btn" style="float: right;">글쓰기</button>
                </div>
                
                <!-- 게시글 리스트 출력 -->
                	<c:forEach var="list" items="${underWaterBoardList}">
                	<fmt:formatDate var="writeDate" pattern="yyyy-MM-dd" value="${list.writedate}"/>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
							  <c:choose>
							  	<c:when test="${list.thumbnail eq 'baseImage.jpg'}">
							  	<a href="javascript:;" class="view_btn" data-num="${list.num}">
								<img src="${contextPath}/resources/images/${list.communityname}/Thumbnail/${list.thumbnail}" alt="Blog-post Thumbnail" style="width: 200px; height: 200px;"/>
								</a>
							  	</c:when>
							  	<c:otherwise> 
							  	<a href="javascript:;" class="view_btn" data-num="${list.num}">
								<img src="${contextPath}/resources/images/${list.communityname}/Thumbnail/${list.num}/${list.thumbnail}" alt="Blog-post Thumbnail"  style="width: 200px; height: 200px;"/>
								</a>
							  	</c:otherwise>
							  </c:choose>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="javascript:;" class="view_btn" data-num="${list.num}">${list.title}</a>
								</h2>
								<div class="post-meta">
									${list.nickname} | ${list.likecount} | ${list.writedate}
								</div>
							</div>
							<div class="post-entry">
								<p>${list.introduction}</p>
							</div>
						</div>
					</div>
					</c:forEach>
				<!-- 게시글 리스트 출력 -->
				</div>
				
				
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
									<a href="#"><img src="${contextPath}/resources/assets/images/rp-3.jpg"
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