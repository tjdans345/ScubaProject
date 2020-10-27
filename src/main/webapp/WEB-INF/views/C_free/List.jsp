<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/Top.jsp" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
  	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <title>Titan | Multipurpose HTML5 Template</title>
    
    <script type="text/javascript">
    $(document).ready(function() {
    	$("#writebtn").click(function() {
			location.href="${contextPath}/freeBoard/writeboard";
		});
    	
	});
    </script>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt" style="margin-bottom: 5%">자유 게시판</h1>
                <form role="form" style="text-align:-webkit-center;">
                  <div class="search-box" style="width: 60%;">
                    <input class="form-control" type="text" placeholder="Search..."/>
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
                </form>
              </div>
            </div>
            <div class="row" style="margin: 10px 0;">
                <select class="form-control" style="width: 100px; float: left;">
                  <option selected="selected">등록순</option>
                  <option>좋아요순</option>
                  <option>조회순</option>
                </select>
              <button id="writebtn" class="btn btn-border-d btn-round" style="float: right;">글쓰기</button>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs" width="10%">글번호</th>
                      <th width="50%">제목</th>
                      <th class="hidden-xs" width="10%">작성자</th>
                      <th class="hidden-xs" width="10%">작성일</th>
                      <th width="10%">조회</th>
                      <th width="10%">좋아요</th>
                    </tr>
                    <tr>
                      <td class="hidden-xs">1</td>
                      <td>
                        <h5 class="product-title font-alt">Accessories Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">나</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">1994/02/02</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">500</h5>
                      </td>
                      <td class="pr-remove">30</td>
                    </tr>
                    <tr>
                      <td class="hidden-xs">2</td>
                      <td>
                        <h5 class="product-title font-alt">Men’s Casual Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">너</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">1994/02/02</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">400</h5>
                      </td>
                      <td class="pr-remove">10</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
              <div class="col-sm-12" style="text-align: center;">
                <div class="pagination font-alt"><a href="#"><i class="fa fa-angle-left"></i></a><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a></div>
              </div>
          </div>
        </section>
      </div>
   <jsp:include page="../inc/Footer.jsp"/>
  </body>
</html>