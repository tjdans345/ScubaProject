<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function() {
	 	    
			
			$(".wrt_btn").click(function() {
				location.href="${contextPath}/reviewBoard/reviewBoardWrite";
			});
		
			$(document).on("click", ".view_btn", function() {
				var num = $(this).data("num");
				location.href="${contextPath}/reviewBoard/reviewBoardView?num="+num;
			});	
			
			//검색 기능
	    	$(".sbutton").click(function() {
	    		var search = $(".search").val();
	    		$("#sform").attr("action", "${contextPath}/reviewBoard/reviewBoardList");
				$("#sform").submit();
			});
			
	    	//리스트 뿌려주는 메소드
	    	function list(num, title, nickname, writedate, likecount, thumbnail, communityname, introduction) {
	    		//timestamp 포맷
	    		const timestamp = writedate;
	    		var date = new Date(timestamp);
	    		var year = date.getFullYear();
	    		var month = (date.getMonth()+1);
	    		var day = date.getDate();
	    		var writeDate = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2));
	    		
				var str = "";
				str += "<div class='col-sm-6 col-md-4 col-lg-4'>";
				str += "<div class='post'>";
				str += "<div class='post-thumbnail'>";
				if(thumbnail == "baseImage.jpg") {
					str += "<a href='javascript:;' class='view_btn' data-num='"+num+"'>";
					str += "<img src='${contextPath}/resources/images/"+communityname+"/Thumbnail/"+thumbnail+"' alt='Blog-post Thumbnail' style='width: 244px; height: 150px;'/>";
					str += "</a>";
				} else {
					str += "<a href='javascript:;' class='view_btn' data-num='"+num+"'>";
					str += "<img src='${contextPath}/resources/images/"+communityname+"/Thumbnail/"+num+"/"+thumbnail+"' alt='Blog-post Thumbnail' style='width: 244px; height: 150px;'/>";
					str += "</a>";
				}
				str += "</div>";
				str += "<div class='post-title'>";
				str += "<h2 class='post-title'>";
				str += "<a href='javascript:;' class='view_btn' data-num='"+num+"'>"+title+"</a>";
				str += "</h2>";
				str += "<div class='post-meta'>"+nickname+" | "+likecount+" | "+writedate+"</div>";
				str += "</div>";
				str += "<div class='post-entry'>";
				str += "<p>"+introduction+"</p>";
				str += "</div>";
				str += "</div>";
				str += "</div>";
				return str;
			}
	    	
	    	//페이징 리스트
	    	function paging(data) {
	    		var pstr = "";
	    		if(data.blockfirst != 1) {
	    			pstr += "<a href='${contextPath}/reviewBoard/reviewBoardList?nowpage="+data.blockfirst-1+"&search="+data.search+"&sort="+data.sort+"&consort="+data.consort+"'"+"><i class='fa fa-angle-left page' data-num='"+(data.blockfirst-1)+"'></i></a>";
	    		}
	    		for(var i= data.blockfirst; i<=data.blocklast; i++) {
	    			if(data.nowpage == i) {
	    				pstr += "<a class='active page pagenum' href='${contextPath}/reviewBoard/reviewBoardList?nowpage="+i+"&search="+data.search+"&sort="+data.sort+"&consort="+data.consort+"'"+" style='background: #cdebfa;' data-now='"+data.nowpage+"' data-num='"+i+"'>"+i+"</a> "; 
	    			} else {
	    				pstr += "<a class='active page pagenum' href='${contextPath}/reviewBoard/reviewBoardList?nowpage="+i+"&search="+data.search+"&sort="+data.sort+"&consort="+data.consort+"'"+ "data-now='"+data.nowpage+"' data-num='"+i+"'>"+i+"</a> "; 
	    			}
	    				
	    		}
				if(data.blocklast != data.totalpage) {
					pstr += "<a href='${contextPath}/reviewBoard/reviewBoardList?nowpage="+data.nowpage+"&search="+data.search+"&sort="+data.sort+"&consort="+data.consort+"'>"+"<i class='fa fa-angle-right page' data-num='"+(data.blocklast+1)+"'></i></a>";
				}
				
				//메소드로 빼버릴까 ;;;
				$("#navpage").empty();
				var navstr = "Page : " + data.nowpage+"/"+data.totalpage;
				$("#navpage").append(navstr);
				return pstr;
			}
	    	
	    	//정렬 Ajax
	    	$(document).on("change", ".sort", function() {
	    		$("#Ltbody").empty();
				var sort = $("#sort > option:selected").val();
				var consort = $("#consort > option:selected").val();
				var page = $(".pagenum").data("now");
				var search = "${map.search}";
				
				$.ajax({
					url : "${contextPath}/reviewBoard/SortList",
					type : "post",
					data : {"sort":sort,
						   	"nowpage":1, //page변수로 사용해도 됨 운영방법 논의하고 추후 변경
						   	"search":search,
						   	"consort":consort
					       },
					success : function(data) {
						//pushState 사용할지 협의 하기
						history.replaceState("", "", "${contextPath}/reviewBoard/reviewBoardList?search="+data.search+"&sort="+data.sort+"&consort="+data.consort);
						var str = "";
						var pstr = "";
						$("#Ltbody").empty();
						$("#pagelist").empty();
						$.each(data.list, function(i) {
							var num = data.list[i].num;
							var title = data.list[i].title;
							var nickname = data.list[i].nickname;
							var writedate = data.list[i].writedate;
							var likecount = data.list[i].likecount;
							var thumbnail = data.list[i].thumbnail;
							var communityname = data.list[i].communityname;
							var introduction = data.list[i].introduction;
							//list 뿌려주는 메소드 호출
							str += list(num, title, nickname, writedate, likecount, thumbnail, communityname, introduction);
						});
						pstr = paging(data);
						$("#pagelist").append(pstr);
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
<body>
	<!-- 게시판 이미지 글 출력 -->
	<section class="module">
		<div class="container">
		<!-- 리스트 -->
			<div class="row multi-columns-row post-columns">
				<div class="col-sm-8" style="width: 73%; margin-top: 2%;">
				<h1 class="module-title font-alt" style="margin-bottom: 30px;">후기 게시판</h1>
                <!-- 검색 -->
                <form role="form" id="sform" style="text-align:-webkit-center;">
                  <div class="search-box" style="width: 40%;">
                    <input class="form-control search" name="search" type="text" placeholder="Search..."/>
                    <button class="search-btn sbutton" type="button"><i class="fa fa-search sbutton"></i></button>
                  </div>
                </form>
                <!-- 검색 -->
                <div class="row" style="margin: 15px;">
                <select class="form-control sort" id="consort" name="consort" style="width: 85px; float: left;">
                  <option selected="selected" disabled="disabled" >국적</option>
                  <option value="대한민국">한국</option>
                  <option>달</option>
                </select>
                <select class="form-control sort" id="sort" name="sort" style="width: 85px; float: left;">
               	  <c:choose>
               	  	<c:when test="${map.sort == 'writedate'}">
               	  		<option value="writedate" selected="selected">등록순</option>
                 	 	<option value="likecount">좋아요순</option>
                  		<option value="viewcount">조회순</option>
               	  	</c:when>
               	  	<c:when test="${map.sort == 'likecount'}">
               	  		<option value="writedate">등록순</option>
                 	 	<option value="likecount" selected="selected">좋아요순</option>
                  		<option value="viewcount">조회순</option>
               	  	</c:when>
               	  	<c:when test="${map.sort == 'viewcount'}">
               	  		<option value="writedate">등록순</option>
                 	 	<option value="likecount">좋아요순</option>
                  		<option value="viewcount" selected="selected">조회순</option>
               	  	</c:when>
               	  	<c:otherwise>
               	  		<option value="writedate" selected="selected">등록순</option>
		                <option value="likecount">좋아요순</option>
		                <option value="viewcount">조회순</option>
               	  	</c:otherwise> 
               	  </c:choose>
                </select>
              <button class="btn btn-border-d btn-round wrt_btn" style="float: right;">글쓰기</button>
                </div>
                <div id="navpage" style="margin-left: 2%">Page : ${map.nowpage}/${map.totalpage}</div>
                
                	<div id="Ltbody">
                	<!-- 게시글 리스트 출력 -->
                	<c:forEach var="list" items="${map.reviewBoardList}">
                	<fmt:formatDate var="writeDate" pattern="yyyy-MM-dd" value="${list.writedate}"/>
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
							  <c:choose>
							  	<c:when test="${list.thumbnail eq 'baseImage.jpg'}">
							  	<a href="javascript:;" class="view_btn" data-num="${list.num}">
								<img src="${contextPath}/resources/images/${list.communityname}/Thumbnail/${list.thumbnail}" alt="Blog-post Thumbnail" style="width: 244px; height: 150px;"/>
								</a>
							  	</c:when>
							  	<c:otherwise> 
							  	<a href="javascript:;" class="view_btn" data-num="${list.num}">
								<img src="${contextPath}/resources/images/${list.communityname}/Thumbnail/${list.num}/${list.thumbnail}" alt="Blog-post Thumbnail"  style="width: 244px; height: 150px;"/>
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
				</div>
				
				
				<!-- 우측 네비바 -->
				<div class="col-sm-4 col-md-3 col-md-offset-1 sidebar"
					style="margin-left: 2%; width: 25%; margin-top:16%; min-width: 292px;">
					<div class="widget">
						<h5 class="widget-title font-alt">인기 글</h5>
						<ul class="icon-list">
						 <c:forEach var="bestlist" items="${bestList}">
							<li><a href="javascript:;" class="view_btn" data-num="${bestlist.num}">${bestlist.title}</a></li>
						</c:forEach>
						</ul>
					</div>
					<div class="widget">
						<h5 class="widget-title font-alt">최근 본 글</h5>
						<ul class="widget-posts">
					 	 <c:forEach var="recentlyList" items="${latelycontent}">
					 	 	<c:if test="${recentlyList != null }">
							<li class="clearfix">
								<div class="widget-posts-image">
									<c:if test="${recentlyList.thumbnail != 'baseImage.jpg' }">
								   	<a href="javascript:;" class="view_btn" data-num="${recentlyList.num}"><img src="${contextPath}/resources/images/review/Thumbnail/${recentlyList.num}/${recentlyList.thumbnail}" alt="Post Thumbnail" /></a>
								   </c:if>
									<c:if test="${recentlyList.thumbnail == 'baseImage.jpg' }">
								   	<a href="javascript:;" class="view_btn" data-num="${recentlyList.num}"><img src="${contextPath}/resources/images/review/Thumbnail/${recentlyList.thumbnail}" alt="Post Thumbnail" /></a>
								   </c:if>
								</div>
								<div class="widget-posts-body">
									<div class="widget-posts-title">
										<a href="javascript:;" class="view_btn" data-num="${recentlyList.num}">${recentlyList.title}</a>
									</div>
									<div class="widget-posts-meta">${recentlyList.nickname}</div>
								</div>
							</li>
							</c:if>
							<c:if test="${recentlyList == null || recentlyList == ''}">
								<p>최근 본 글이 없습니다.</p>
							</c:if>
						 </c:forEach>	
						</ul>
					</div>
				</div>
				<!-- 사이드 바 -->
				
			<!-- 페이징 -->
			</div>
              <div class="col-sm-12" style="text-align: center;">
                <div class="pagination font-alt" id="pagelist">
                <c:if test="${map.blockfirst!=1}">
                <a href="${contextPath}/reviewBoard/reviewBoardList?nowpage=${map.blockfirst-1}&search=${map.search}&sort=${map.sort}&consort=${map.consort}"><i class="fa fa-angle-left page" data-num="${map.blockfirst-1}"></i></a>
                </c:if>
                <c:forEach begin="${map.blockfirst}" end="${map.blocklast}" var="i">
                <c:if test="${map.nowpage == i }">
                <a class="active page pagenum" style="background: #cdebfa;" href="${contextPath}/reviewBoard/reviewBoardList?nowpage=${i}&search=${map.search}&sort=${map.sort}&consort=${map.consort}" data-now="${map.nowpage}" data-num="${i}">${i}</a>
                </c:if>
                <c:if test="${map.nowpage != i }">
                <a class="active page pagenum" href="${contextPath}/reviewBoard/reviewBoardList?nowpage=${i}&search=${map.search}&sort=${map.sort}&consort=${map.consort}" data-now="${map.nowpage}" data-num="${i}">${i}</a>
                </c:if>
                </c:forEach>
                <c:if test="${map.blocklast != map.totalpage}">
                <a href="${contextPath}/reviewBoard/reviewBoardList?nowpage=${map.blocklast+1}&search=${map.search}&sort=${map.sort}&consort=${map.consort}"><i class="fa fa-angle-right page" data-num="${map.blocklast+1}"></i></a>
                </c:if>
                </div>
              </div>
             <!-- 페이징 -->
             
		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="../inc/Footer.jsp" />
	<!-- 푸터 -->
</body>
</html>