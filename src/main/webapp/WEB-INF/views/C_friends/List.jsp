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
	    	$(document).on("click", ".title_btn", function() {
				var num = $(this).data("num");
				location.href="${contextPath}/friendsBoard/friendsBoardView?num="+num;
			});
    		
	    	//리스트 뿌려주는 메소드
	    	function list(num, title, nickname, writedate,viewcount, membercount, nowcount) {
	    		
	    		//timestamp 포맷
	    		const timestamp = writedate;
	    		var date = new Date(timestamp);
	    		var year = date.getFullYear();
	    		var month = (date.getMonth()+1);
	    		var day = date.getDate();
	    		var writeDate = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2));
				
	    		var str = "";
				str += "<tr>";
				str += "<td class='hidden-xs'>"+num+"</td>";
				str += "<td>"
				str += "<h5 class='product-title font-alt'><a href='javascript:;' class='title_btn' data-num='"+num+"'>"+title+"</a></h5>";
				str += "</td>"
				str += "<td class='hidden-xs'>"
				str += "<h5 class='product-title font-alt'>"+nickname+"</h5>";
				str += "</td>";
				str += "<td class='hidden-xs'>";
				str += "<h5 class='product-title font-alt'>"+writeDate+"</h5>";
				str += "</td>";
				str += "<td>";
				str += "<h5 class='product-title font-alt'>"+viewcount+"</h5>";
				str += "</td>";
				str += "<td class='pr-remove'>"+nowcount+"/"+membercount+"</td>"
				return str;
			}
    		
	    	//정렬 Ajax
	    	$(document).on("change", "#sort", function() {
				var sort = $("#sort > option:selected").val();
				
				$.ajax({
					url : "${contextPath}/friendsBoard/SortList",
					type : "post",
					data : {"sort":sort},
					success : function(data) {
						var str = "";
						$("#Ltbody").empty();
						$.each(data, function(i) {
							var num = data[i].num;
							var title = data[i].title;
							var nickname = data[i].nickname;
							var writedate = data[i].writedate;
							var viewcount = data[i].viewcount;
							var membercount = data[i].membercount;
							var nowcount = data[i].nowcount;
							
							//list 뿌려주는 메소드 호출
							str += list(num, title, nickname, writedate, viewcount, membercount, nowcount);
						});
						$("#Ltbody").append(str);
					},
					error : function() {
						alert("통신 실패");
					}
				});
				
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
                <select class="form-control" id="sort" style="width: 100px; float: left;">
                  <option selected="selected" value="writedate">등록순</option>
                  <option value="viewcount">조회순</option>
                </select>
              <button class="btn btn-border-d btn-round wrt_btn" style="float: right;">글쓰기</button>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                    <tr>
                      <th class="hidden-xs" width="10%">글번호</th>
                      <th width="50%">제목</th>
                      <th class="hidden-xs" width="10%">작성자</th>
                      <th class="hidden-xs" width="10%">작성일</th>
                      <th width="10%">조회</th>
                      <th width="10%">인원현황</th>
                    </tr>
                    <tbody id="Ltbody">
                    <c:forEach var="list" items="${friendsBoardList}">
                    <fmt:formatDate var="writeDate" pattern="yyyy-MM-dd" value="${list.writedate}"/>
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