<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/Top.jsp" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <title>Titan | Multipurpose HTML5 Template</title>
    
    <script type="text/javascript">
    	$(document).ready(function() {
			
    		//글쓰기 페이지 이동
    		$(".wrt_btn").click(function() {
				location.href="${contextPath}/friendsBoard/friendsBoardWrite"
			});
    		
    		//상세글 보기위해 글 번호 전달
	    	$(".title_btn").click(function() {
				var num = $(this).data("num");
				location.href="${contextPath}/friendsBoard/friendsBoardView?num="+num;
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
                <h1 class="module-title font-alt" style="margin-bottom: 5%">동료 모집</h1>
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
              <button class="btn btn-border-d btn-round wrt_btn" style="float: right;">글쓰기</button>
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
                      <th width="10%">인원현황</th>
                    </tr>
                    <c:forEach var="list" items="${friendsBoardList}">
                    <fmt:formatDate var="writeDate" value="${list.writedate}"/>
                    <tr>
                      <td class="hidden-xs">${list.num}</td>
                      <td>
                        <h5 class="product-title font-alt"><a href="javascript:;" class="title_btn" data-num="${list.num}">${list.title}</a></h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">${list.nickname}</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">${writeDate}</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">${list.viewcount}</h5>
                      </td>
                      <td class="pr-remove">${list.nowcount}/${list.membercount}</td>
                    </tr>
                    </c:forEach>
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