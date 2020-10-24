<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/Top.jsp"/>
		<section class="module">
	      <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
              <h2 class="module-title font-alt" style="margin-bottom: 20px">다이빙 정보</h2>
            </div>
          </div>
          <div class="container">
<!--           이미지 -->
            <div class="row">
              <div class="col-sm-3 mb-sm-20" style="margin-bottom: 15px; margin-right: 2%;">
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
              </div>
              <div class="col-sm-12"><img src="${contextPath}/resources/assets/images/section-1.jpg" alt="Title of Image"/></div>
            </div>
<!--             이미지 -->
<!-- 			메인 설명 -->
            <div class="row multi-columns-row" style="margin-top: 20px;">
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="work-details" style="margin-top: 2%;">
                  <h5 class="work-details-title font-alt">Project Details</h5>
                  <p></p>
                  <ul>
                    <li><strong>지역 명: </strong><span class="font-serif"><a href="#" target="_blank">SomeCompany</a></span>
                    </li>
                    <li><strong>평균 수온: </strong><span class="font-serif"><a href="#" target="_blank">23 November, 2015</a></span>
                    </li>
                    <li><strong>다이빙 적정기간: </strong><span class="font-serif"><a href="#" target="_blank">www.example.com</a></span>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <p>The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.</p>
                <p>Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary.</p>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <p>The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.</p>
              </div>
            </div>
<!--             메인 설명 -->
<!-- 어류 정보 -->
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-1.jpg" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">어류 1</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-3.jpg" alt="Derby shoes"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">어류2</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-2.jpg" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">어류3</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-4.jpg" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">어류4</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-5.jpg" alt="Chelsea boots"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">어류5</a></h4>
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-6.jpg" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">어류6</a></h4>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
<!-- 어류정보 -->
<!-- 			그외 정보 -->
			<div role="tabpanel">
              <ul class="nav nav-tabs font-alt" role="tablist">
                <li class="active"><a href="#review" data-toggle="tab">
                	<i class="fa fa-fw">&#xf044;</i>후기</a>
                </li>
                <li><a href="#resort" data-toggle="tab"><span class="icon-map-pin">
                	</span>&nbsp;주변 리조트</a>
                </li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active" id="review">
<!-- 1번 카테고리 -->
	                <table class="table table-striped table-border checkout-table">
	                  <tbody>
	                    <tr>
	                      <th class="hidden-xs" width="7%">글번호</th>
	                      <th width="7%">이미지</th>
	                      <th width="50%">제목</th>
	                      <th class="hidden-xs" width="12%">작성자</th>
	                      <th class="hidden-xs" width="12%">등록일자</th>
	                      <th width="12%">좋아요</th>
	                    </tr>
	                    <tr>
	                      <td class="hidden-xs">1</td>
	                      <td><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-14.jpg" alt="Accessories Pack"/></a></td>
	                      <td>
	                        <h5 class="product-title font-alt">Accessories Pack</h5>
	                      </td>
	                      <td class="hidden-xs">
	                        <h5 class="product-title font-alt">우리</h5>
	                      </td>
	                      <td class="hidden-xs">
	                        <h5 class="product-title font-alt">1994/02/02</h5>
	                      </td>
	                      <td class="pr-remove"><a href="#" title="Remove"><i class="fa fa-times"></i></a></td>
	                    </tr>
	                    <tr>
	                      <td class="hidden-xs">2</td>
	                      <td><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-14.jpg" alt="Accessories Pack"/></a></td>
	                      <td>
	                        <h5 class="product-title font-alt">Accessories Pack</h5>
	                      </td>
	                      <td class="hidden-xs">
	                        <h5 class="product-title font-alt">우리</h5>
	                      </td>
	                      <td class="hidden-xs">
	                        <h5 class="product-title font-alt">1994/02/02</h5>
	                      </td>
	                      <td class="pr-remove"><a href="#" title="Remove"><i class="fa fa-times"></i></a></td>
	                    </tr>
	                  </tbody>
	                </table>
<!-- 1번 카테고리 -->
                </div>
                <div class="tab-pane" id="resort">
<!-- 2번 카테고리 -->
	                <table class="table table-striped table-border checkout-table">
	                  <tbody>
	                    <tr>
	                      <th class="hidden-xs" width="7%">이미지</th>
	                      <th width="20%">리조트명</th>
	                      <th class="hidden-xs" width="13%">홈페이지주소</th>
	                      <th width="10%">연락처</th>
	                      <th width="50%">인사말</th>
	                    </tr>
	                    <tr>
	                      <td class="hidden-xs"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-14.jpg" alt="Accessories Pack"/></a></td>
	                      <td>
	                        <h5 class="product-title font-alt">코랄그랜드</h5>
	                      </td>
	                      <td class="hidden-xs">
	                        <h5 class="product-title font-alt">google.com</h5>
	                      </td>
	                      <td>
	                        <h5 class="product-title font-alt">01043349422</h5>
	                      </td>
	                      <td>
	                        <h5 class="product-title font-alt">안녕하세요 </h5>
	                      </td>
	                    </tr>
	                    <tr>
	                      <td class="hidden-xs"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-14.jpg" alt="Accessories Pack"/></a></td>
	                      <td>
	                        <h5 class="product-title font-alt">코랄그랜드</h5>
	                      </td>
	                      <td class="hidden-xs">
	                        <h5 class="product-title font-alt">google.com</h5>
	                      </td>
	                      <td>
	                        <h5 class="product-title font-alt">01043349422</h5>
	                      </td>
	                      <td>
	                        <h5 class="product-title font-alt">안녕하세요 </h5>
	                      </td>
	                    </tr>
	                    <tr>
	                      <td class="hidden-xs"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-14.jpg" alt="Accessories Pack"/></a></td>
	                      <td>
	                        <h5 class="product-title font-alt">코랄그랜드</h5>
	                      </td>
	                      <td class="hidden-xs">
	                        <h5 class="product-title font-alt">google.com</h5>
	                      </td>
	                      <td>
	                        <h5 class="product-title font-alt">01043349422</h5>
	                      </td>
	                      <td>
	                        <h5 class="product-title font-alt">안녕하세요 </h5>
	                      </td>
	                    </tr>
	                    <tr>
	                      <td class="hidden-xs"><a href="#"><img src="${contextPath}/resources/assets/images/shop/product-14.jpg" alt="Accessories Pack"/></a></td>
	                      <td>
	                        <h5 class="product-title font-alt">코랄그랜드</h5>
	                      </td>
	                      <td class="hidden-xs">
	                        <h5 class="product-title font-alt">google.com</h5>
	                      </td>
	                      <td>
	                        <h5 class="product-title font-alt">01043349422</h5>
	                      </td>
	                      <td>
	                        <h5 class="product-title font-alt">안녕하세요 </h5>
	                      </td>
	                    </tr>
	                  </tbody>
	                </table>
<!-- 2번 카테고리 -->
                </div>
              </div>
            </div>
<!-- 			그외 정보 -->
          </div>
        </section>
	<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>