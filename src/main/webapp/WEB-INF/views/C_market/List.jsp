<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/Top.jsp"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <title>Titan | Multipurpose HTML5 Template</title>
    
    <script type="text/javascript">
    	$(document).ready(function() {
			
    		//글쓰기 페이지 이동
    		$(".wrt_btn").click(function() {
				location.href="${contextPath}/marketBoard/marketBoardWrite"
			});
    		
    		//상세글 보기위해 글 번호 전달
	    	$(".title_btn").click(function() {
				var num = $(this).data("num");
				location.href="${contextPath}/marketBoard/marketBoardView?num="+num;
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
            	<button class="btn btn-border-d btn-round wrt_btn">글쓰기</button>
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
                      <th width="10%">판매 상태</th>
                      <th width="41%">제목</th>
                      <th class="hidden-xs" width="8%">작성자</th>
                      <th width="12%">작성일</th>
                      <th width="12%">희망가격</th>
                      <th width="10%">상태</th>
                    </tr>
                    
                    <!-- 글 리스트 -->
                    <c:forEach var="list" items="${marketBoardList}">
                    <fmt:formatDate var="writeDate" value="${list.writedate}"/>
                    <c:if test="${list.marketcategory eq '팝니다' }">
                    <tr>
                      <td class="hidden-xs">${list.num}</td>
                      <td>
                      	<c:if test="${list.dealstatus == 0}">
                        <h5 class="product-title font-alt" style="color: blue;">판매중</h5>
                        </c:if>
                        <c:if test="${list.dealstatus == 1}">
                        <h5 class="product-title font-alt" style="color: red;">판매 완료</h5>
                        </c:if>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt"><a href="javascript:;" class="title_btn" data-num="${list.num}">${list.title}</a></h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.nickname}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${writeDate}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.price}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.productstatus}</h5>
                      </td>
                    </tr>
                    </c:if>
                    </c:forEach>
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
                      <th width="10%">판매 상태</th>
                      <th width="41%">제목</th>
                      <th class="hidden-xs" width="10%">작성자</th>
                      <th width="15%">작성일</th>
                      <th width="12%">희망가격</th>
                      <th width="17%">상태</th>
                    </tr>
                    <c:forEach var="list" items="${marketBoardList}">
                    <fmt:formatDate var="writeDate" value="${list.writedate}"/>
                    <c:if test="${list.marketcategory eq '삽니다' }">
                    <tr>
                      <td class="hidden-xs">${list.num}</td>
                      <td>
                      	<c:if test="${list.dealstatus == 0}">
                        <h5 class="product-title font-alt" style="color: blue;">구매중</h5>
                        </c:if>
                        <c:if test="${list.dealstatus == 1}">
                        <h5 class="product-title font-alt" style="color: red;">구매 완료</h5>
                        </c:if>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt"><a href="javascript:;" class="title_btn" data-num="${list.num}">${list.title}</a></h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.nickname}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${writeDate}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.price}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.productstatus}</h5>
                      </td>
                    </tr>
                    </c:if>
                    </c:forEach>
                  </tbody>
                </table>
              <div class="col-sm-12" style="text-align: center;">
                <div class="pagination font-alt"><a href="#"><i class="fa fa-angle-left"></i></a><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a></div>
              </div>
                    </div>
               <!-- 삽니다 카테고리 --> 
                    <div class="tab-pane" id="read" style="font-size: 100px;">
                    <p><b>단디 팔고 단디 사라</b></p>
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