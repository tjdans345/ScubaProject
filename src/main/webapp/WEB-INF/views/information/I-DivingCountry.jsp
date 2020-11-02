<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/Top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function CountryChange() {
	var CountryName = $("#CountryNameCategory option:selected").val();
	$.ajax({
		url:'getCityList.info',
		type:'POST',
		data : {CountryName : CountryName},
		success : function (data) {
			$('#CityNameCategory').empty();
			for(var i = 0 ; i < data.length ; i ++){
				var tag = '<option value="'+data[i]+'">'+data[i]+'</option>';
				$('#CityNameCategory').append(tag);
			}
			$('<option selected="selected" disabled="disabled">지역선택</option>').prependTo('#CityNameCategory');
			$('#CountryNameup').empty();
			var tag = '<input class="form-control input-sm" type="text" value="'+CountryName+'" name="CountryName" id="CountryName" readonly="readonly">'
			$('#CountryNameup').append(tag);
		}
	});
	$.ajax({
		url:'getCountryPointinfo.info',
		type:'POST',
		data:{CountryName:CountryName},
		success : function(data) {
			$('#preView').empty();
			var img = document.createElement("img");
			img.setAttribute("src",data[0].url+data[1].CountryImage);
			document.querySelector("div#preView").appendChild(img);
			$('#CountryName').empty();
			$('#CountryName').append(data[1].CountryName);
			console.log(data)
			setTimeout(function () {
				var widthsize = $('#preView>img').width();
				var heightsize = $('#preView>img').height();
				for(var i = 1 ; i < data.length ; i++){
					var Xpoint = data[i].CityXpoint * widthsize;
					var Ypoint = data[i].CityYpoint * heightsize;
					var img = document.createElement("img");
					img.setAttribute("src","${contextPath}/resources/assets/images/scubaFlag.png");
					img.setAttribute("class","pointChecker");
					img.setAttribute("cursor","pointer");
					img.setAttribute("title",data[i].CityName+"\n수온 :"+data[i].AveTemper+"\n시즌 : "+data[i].Season);
					img.setAttribute("onclick","location.href='${contextPath}/DivingCity.info?CityName="+data[i].CityName+"'");
					img.style.position="absolute";
					img.style.width="15px";
					img.style.height="15px";
					img.style.left = Xpoint+8 + "px";
					img.style.top = Ypoint-7 + "px";
					document.getElementById('preView').appendChild(img);
				}
			},100);
			
			$(window).resize(function() {
			$('.pointChecker').remove();
			var widthsize = $('#preView>img').width();
			var heightsize = $('#preView>img').height();
			for(var i = 1 ; i < data.length ; i++){
				var Xpoint = data[i].CityXpoint * widthsize;
				var Ypoint = data[i].CityYpoint * heightsize;
				var img = document.createElement("img");
				img.setAttribute("src","${contextPath}/resources/assets/images/scubaFlag.png");
				img.setAttribute("class","pointChecker");
				img.setAttribute("cursor","pointer");
				img.setAttribute("title",data[i].CityName+"\n수온 :"+data[i].AveTemper+"\n시즌 : "+data[i].Season);
				img.style.position="absolute";
				img.style.width="15px";
				img.style.height="15px";
				img.style.left = Xpoint+8 + "px";
				img.style.top = Ypoint-7 + "px";
				document.getElementById('preView').appendChild(img);
			}
			});
		}
	});
}
function CityChange() {
	var CityName = $("#CityNameCategory option:selected").val();
	console.log(CityName);
	location.href="${contextPath}/DivingCity.info?CityName="+CityName;
}
</script>
</head>
<body>
		<section class="module">
	      <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
              <h2 class="module-title font-alt" style="margin-bottom: 20px" id="CountryName">국가를 선택해 주세요</h2>
            </div>
          </div>
          <div class="container">
<!--           이미지 -->
            <div class="row">
            <div class="col-sm-3 mb-sm-20" style="margin-bottom: 15px;">
                <select class="form-control" id="CountryNameCategory" onchange="CountryChange()" style="width: 100px; float: left;">
                  <option selected="selected" disabled="disabled">국가선택</option>
				  <c:forEach items="${CountryList}" var="CountryName">
				  <c:choose>
				  <c:when test="${nowCountryName eq CountryName}">
				  <option value="${CountryName}" selected="selected">${CountryName}</option>
				  <script type="text/javascript">
				  CountryChange();
				  </script>
				  </c:when>
				  <c:otherwise>
				  <option value="${CountryName}">${CountryName}</option>
				  </c:otherwise>
				  </c:choose>	
				  </c:forEach>
                </select>
                <select class="form-control" id="CityNameCategory" style="width: 100px;" onchange="CityChange()">
                  <option selected="selected" disabled="disabled">지역선택</option>
                </select>
                <a href="${contextPath}/EnterCountry.info">나라 등록 o</a>
                <a href="${contextPath}/EnterCity.info">지역 등록 o</a>
                <a href="${contextPath}/FishList.info">어류 리스트</a>
              </div>
              <div class="col-sm-12" id="preView">
				<h2>카테고리를 선택해 주세요</h2>
              </div>
            </div>
<!--             이미지 -->
<!-- 추천지역 -->
            <div class="row multi-columns-row post-columns" style="margin-top: 25px;">
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post">
                  <div class="post-thumbnail"><a href="#"><img src="${contextPath}/resources/assets/images/post-1.jpg" alt="Blog-post Thumbnail"/></a></div>
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="#">지역 1</a></h2>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post">
                  <div class="post-thumbnail"><a href="#"><img src="${contextPath}/resources/assets/images/post-2.jpg" alt="Blog-post Thumbnail"/></a></div>
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="#">지역 2</a></h2>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post">
                  <div class="post-thumbnail"><a href="#"><img src="${contextPath}/resources/assets/images/post-3.jpg" alt="Blog-post Thumbnail"/></a></div>
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="#">지역 3</a></h2>
                  </div>
                </div>
              </div>
            </div>
<!-- 추천지역 -->
<!-- 			메인 설명 -->
            <div class="row multi-columns-row" style="margin-top: 20px;">
              <div class="col-sm-18 col-md-12 col-lg-12">
              </div>
            </div>
<!--             메인 설명 -->
          </div>
        </section>
<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>