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
				location.href="${contextPath}/jobSearchBoard/JobSearchWrite"
			});
			
			//상세글 보기위해 글 번호 전달
	    	$(".title_btn").click(function() {
				var num = $(this).data("num");
				location.href="${contextPath}/jobSearchBoard/jobSearchBoardView?num="+num;
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
                <h1 class="module-title font-alt" style="margin-bottom: 5%">구인 구직 게시판</h1>
                <select class="form-control" style="width: 25%; float: left;">
                  <option selected="selected">구인</option>
                  <option>구직</option>
                </select>
                <form role="form">
                  <div class="search-box" style="float: left; width: 75%;">
                    <input class="form-control" type="text" placeholder="Search..."/>
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
                </form>
              </div>
            </div>
            <div class="row" style="margin: 10px 0;">
            	<button class="btn btn-border-d btn-round wrt_btn" style="float: right;">글쓰기</button>
            </div>
            <div class="row" style="clear: both;">
          <!-- 카테고리 시작 -->
          <div class="col-sm-12">
            <div role="tabpanel">
                  <ul class="nav nav-tabs font-alt" role="tablist">
                    <li class="active"><a href="#support" data-toggle="tab"><i class="fa fa-fw">&#xf0ac;</i>구인</a></li>
                    <li><a href="#sales" data-toggle="tab"><i class="fa fa-fw">&#xf0c0;</i>구직</a></li>
                  </ul>
             <div class="tab-content">
             <!-- 구인 카테고리 -->   
               <div class="tab-pane active" id="support">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs" width="7%">글번호</th>
                      <th width="48%">제목</th>
                      <th class="hidden-xs" width="15%">작성자</th>
                      <th width="15%">작성일</th>
                      <th width="15%">조회</th>
                    </tr>
                    <!-- 글 리스트 -->
                    <c:forEach var="list" items="${jobSearchBoardList}">
                    <fmt:formatDate var="writeDate" value="${list.writedate}"/>
                    <c:if test="${list.jobcategory eq '구인' }">
                    <tr>
                      <td class="hidden-xs">${list.num}</td>
                      <td>
                        <h5 class="product-title font-alt"><a href="javascript:;" class="title_btn" data-num="${list.num}">${list.title}</a></h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">${list.nickname}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${writeDate}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.viewcount}</h5>
                      </td>
                    </tr>
                    </c:if>
                    </c:forEach>
                  </tbody>
                </table>
             	<!-- 구인 카테고리 --> 
                    </div>
               <!-- 구직 카테고리 -->       
              <div class="tab-pane" id="sales">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs" width="7%">글번호</th>
                      <th width="48%">제목</th>
                      <th class="hidden-xs" width="15%">작성자</th>
                      <th width="15%">작성일</th>
                      <th width="15%">조회</th>
                    </tr>
                    <c:forEach var="list" items="${jobSearchBoardList}">
                    <fmt:formatDate var="writeDate" value="${list.writedate}"/>
                    <c:if test="${list.jobcategory eq '구직' }">
                    <tr>
                      <td class="hidden-xs">${list.num}</td>
                      <td>
                         <h5 class="product-title font-alt"><a href="javascript:;" class="title_btn" data-num="${list.num}">${list.title}</a></h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">${list.nickname}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${writeDate}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.viewcount}</h5>
                      </td>
                    </tr>
                    </c:if>
                    </c:forEach>
                  </tbody>
                </table>
             	<!-- 구직 카테고리 --> 
                    </div>
                  </div>
                </div>
                </div>
                <!-- 카테고리 끝 -->
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