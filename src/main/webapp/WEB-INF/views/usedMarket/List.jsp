<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <title>Titan | Multipurpose HTML5 Template</title>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <jsp:include page="../inc/Top.jsp"/>
      <div class="main">
      
        <section class="module">
          <div class="container">
          	<div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt" style="margin-bottom: 5%">중고장터 게시판</h1>
                <select class="form-control" style="width: 25%; float: left;">
                  <option selected="selected">팜니다</option>
                  <option>삽니다</option>
                </select>
                <form role="form">
                  <div class="search-box" style="float: left; width: 75%;">
                    <input class="form-control" type="text" placeholder="Search..."/>
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
                </form>
              </div>
            </div>
            <div class="row" style="float: right; margin: 10px 0;">
            	<button class="btn btn-border-d btn-round">글쓰기</button>
            </div>
            <div class="row" style="clear: both;">
          <!-- 카테고리 시작 -->
          <div class="col-sm-12">
            <div role="tabpanel">
                  <ul class="nav nav-tabs font-alt" role="tablist">
                    <li class="active"><a href="#sell" data-toggle="tab"><i class="fa fa-fw">&#xf155;</i>팜니다</a></li>
                    <li><a href="#buy" data-toggle="tab"><i class="fa fa-fw">&#xf032;</i>삽니다</a></li>
                    <li><a href="#read" data-toggle="tab"><i class="fa fa-fw">&#xf0e3;</i><font color="red">필독사항</font></a></li>
                  </ul>
             <div class="tab-content">
             <!-- 팝니다 카테고리 -->   
               <div class="tab-pane active" id="sell">
               
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs" width="7%">글번호</th>
                      <th width="7%">이미지</th>
                      <th width="41%">제목</th>
                      <th class="hidden-xs" width="10%">작성자</th>
                      <th width="10%">작성일</th>
                      <th width="15%">희망가격</th>
                      <th width="10%">상태</th>
                    </tr>
                    <tr>
                      <td class="hidden-xs">1</td>
                      <td>
                        <h5 class="product-title font-alt">Accessories Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">man4</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">1994/02/02</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">10</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">10</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">10</h5>
                      </td>
                    </tr>
                    <tr>
                      <td class="hidden-xs">2</td>
                      <td>
                        <h5 class="product-title font-alt">Men’s Casual Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">man3</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">1994/02/02</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">20</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">10</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">10</h5>
                      </td>
                    </tr>
                  </tbody>
                </table>
               <div class="col-sm-12" style="text-align: center;">
                <div class="pagination font-alt"><a href="#"><i class="fa fa-angle-left"></i></a><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a></div>
              </div>
                    </div>
              <!-- 팜니다 카테고리 --> 
               <!--삽니다 카테고리 -->       
              <div class="tab-pane" id="buy">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs" width="7%">글번호</th>
                      <th width="48%">제목</th>
                      <th class="hidden-xs" width="10%">작성자</th>
                      <th width="10%">작성일</th>
                      <th width="15%">희망가격</th>
                      <th width="10%">상태</th>
                    </tr>
                    <tr>
                      <td class="hidden-xs">3</td>
                      <td>
                        <h5 class="product-title font-alt">Accessories Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">man2</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">1994/02/02</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">30</h5>
                      </td> 
                      <td>
                        <h5 class="product-title font-alt">30</h5>
                      </td>
                    </tr>
                    <tr>
                      <td class="hidden-xs">4</td>
                      <td>
                        <h5 class="product-title font-alt">Men’s Casual Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">man1</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">1994/02/02</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">40</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">30</h5>
                      </td>
                    </tr>
                  </tbody>
                </table>
              <div class="col-sm-12" style="text-align: center;">
                <div class="pagination font-alt"><a href="#"><i class="fa fa-angle-left"></i></a><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a></div>
              </div>
                    </div>
                                 	<!-- 삽니다 카테고리 --> 
                    <div class="tab-pane" id="read">
                    <p>주의사항</p>
                    </div>
                  </div>
                </div>
                </div>
                <!-- 카테고리 끝 -->
            </div>
          </div>
        </section>
      </div>
   <jsp:include page="../inc/Footer.jsp"/>
  </body>
</html>