<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리조트 상세보기</title>
<jsp:include page="../inc/Top.jsp"/>
</head>
<body>
<!-- 리조트 정보 -->
        <section class="module-small">
          <div class="container">
            <div class="row"> 
              <div class="col-sm-8">
                <div class="post">
					<div class="post-images-slider">
	                  <ul class="slides">
	                    <li><img class="center-block" src="../assets/images/work-1.jpg" alt="Slider Image"/></li>
	                    <li><img class="center-block" src="../assets/images/work-2.jpg" alt="Slider Image"/></li>
	                    <li><img class="center-block" src="../assets/images/work-4.jpg" alt="Slider Image"/></li>
	                  </ul>
                	</div>                 
                	<div class="post-header font-alt">
                    <h1 class="post-title">글 제목</h1>
                    <div class="post-meta">작성자| 등록일자 | ♥ 개수 
                    </div>
                  </div>
                  <div class="post-entry">
                    <p>리조트 설명 내용입니다.</p>
                  </div>
                </div>
                <div class="row">
               	  <button class="btn btn-border-d btn-round" type="submit" style="float: right; margin: 5px;">목록보기</button>
                  <button class="btn btn-border-d btn-round" type="submit" style="float: right; margin: 5px;">글 삭제</button>
                  <button class="btn btn-border-d btn-round" type="submit" style="float: right; margin: 5px;">글 수정</button>
                </div>
              </div>
<!--               위 ( 이미지 , 설명 ) // 아래 ( 사이드바 ) -->
              <div class="col-sm-4 col-md-3 col-md-offset-1 sidebar">
                <div class="widget">
                  <h5 class="widget-title font-alt">근처의 다른 숖(파워광고)</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../assets/images/rp-3.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Eco bag Mockup</a></div>
                        <div class="widget-posts-meta">21 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../assets/images/rp-4.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Bottle Mockup</a></div>
                        <div class="widget-posts-meta">2 March</div>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">해쉬태그</h5>
                  <div class="tags font-serif"><a href="#" rel="tag">Blog</a><a href="#" rel="tag">Photo</a><a href="#" rel="tag">Video</a><a href="#" rel="tag">Image</a><a href="#" rel="tag">Minimal</a><a href="#" rel="tag">Post</a><a href="#" rel="tag">Theme</a><a href="#" rel="tag">Ideas</a><a href="#" rel="tag">Tags</a><a href="#" rel="tag">Bootstrap</a><a href="#" rel="tag">Popular</a><a href="#" rel="tag">English</a>
                  </div>
                </div> <br><br><br>
              </div>
            </div>
          </div>
<!--         리조트 정보 , 리뷰 , 인삿말 -->
          <div class="container" style="margin-top: -140px;">
            <div class="row mt-70">
              <div class="col-sm-12">
                <ul class="nav nav-tabs font-alt" role="tablist">
                  <li class="active"><a href="#description" data-toggle="tab"><span class="icon-tools-2"></span>인사말</a></li>
                  <li><a href="#data-sheet" data-toggle="tab"><span class="icon-tools-2"></span>리조트정보</a></li>
                  <li><a href="#reviews" data-toggle="tab"><span class="icon-tools-2"></span>리뷰(갯수)</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
					<p>인사말</p>
                  </div>
                  <div class="tab-pane" id="data-sheet">
                    <table class="table table-striped ds-table table-responsive">
                      <tbody>
                        <tr>
                          <th width="20%">리조트 이름</th>
                          <td colspan="3">이름</td>
                        </tr>
                        <tr>
                          <th>주소</th>
                          <td>부산시</td>
                          <th>휴대폰</th>
                          <td>01012341234</td>
                        </tr>
                        <tr>
                          <th>홈페이지 주소</th>
                          <td >google.com</td>
                          <th><img src="../assets/images/kakaoIcon.png" width="19px" alt="kakaoIcon"></th>
                          <td>KaKaOId</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane" id="reviews">
                    <div class="comments reviews" style="margin-top: -3%;">
                    <div class="comment-form mt-30">
                      <form method="post">
                        <div class="row">
                          <div class="col-sm-2" style="float: right;">
                            <div class="form-group" style="width: 132.5px; float: right;">
                              <select class="form-control">
                                <option selected="selected" disabled="disabled">별점</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                              </select>
                            </div>
                          </div>
                          </div>
                          <div class="row">
                          <div class="col-sm-12">
                            <div class="form-group">
                              <textarea class="form-control" id="" name="" rows="4" placeholder="Review" style="resize: none;"></textarea>
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <button class="btn btn-border-d btn-round" type="submit" style="float: right;">댓글 등록</button>
                          </div>
                        </div>
                      </form>
                    </div>
                      <div class="comment clearfix">
                        <div class="comment-avatar"><img src="" alt="../avatar"/></div>
                        <div class="comment-content clearfix">
                          <div class="comment-author font-alt"><a href="#">John Doe</a></div>
                          <div class="comment-body">
                            <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                          </div>
                          <div class="comment-meta font-alt">Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star-off"></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="comment clearfix">
                      
                        <div class="comment-avatar"><img src="" alt="../avatar"/></div>
                        <div class="comment-content clearfix">
                          <div class="comment-author font-alt"><a href="#">Mark Stone</a></div>
                          <div class="comment-body">
                            <p>Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                          </div>
                          <div class="comment-meta font-alt">Today, 14:59 -<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star-off"></i></span><span><i class="fa fa-star star-off"></i></span>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
<!--         리조트 정보 -->
<!--         다른 샾 -->
		        <hr class="divider-w">
        <section class="module" style="padding-top: 0px;">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <div class="module-subtitle font-serif">같은 지역의 다른 리조트</div>
              </div>
            </div>
            <div class="row">
              <div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../assets/images/shop/product-1.jpg" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">Leather belt</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../assets/images/shop/product-3.jpg" alt="Derby shoes"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">Derby shoes</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../assets/images/shop/product-2.jpg" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">Leather belt</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../assets/images/shop/product-4.jpg" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">Leather belt</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../assets/images/shop/product-5.jpg" alt="Chelsea boots"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">Chelsea boots</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../assets/images/shop/product-6.jpg" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">Leather belt</a></h4>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
<!-- 		다른 샾 -->
<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>