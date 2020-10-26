<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/Top.jsp" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <title>Titan | Multipurpose HTML5 Template</title>
<%--     <script type="text/javascript" src="${contextPath}/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script> --%>
    <script type="text/javascript" src = "${path}/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<!-- 	<script src="./editor.js"></script> -->
	<style type="text/css">
	#smart_editor2{
	width: 100%;
	}
	</style>
	<script type="text/javascript">
	
	$(document).ready(function(){
		var id = "${id}";
		if(id == "") {
			alert("로그인 후 이용해주시기 바랍니다.");
			location.href="${contextPath}/login.mem";
		} else {
		$("#wrbtn").click(function() {
			alert("호우");
			$("#wform").attr("action", "${contextPath}/writeinsert.free");
			$("#wform").submit();
		});
		}
	});
	</script>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <h4 class="font-alt mb-0">자유 게시판 글 작성</h4>
                <hr class="divider-w mt-10 mb-20">
                <form id="wform" class="form" role="form" method="post" action="">
                  <div class="form-group">
                  	<h5><b>제목</b></h5>
                    <input class="form-control input-lg" type="text" name="title" placeholder="제목을 입력하세요(메인 제목)"/>
                  </div>
                  <div>
                  <textarea class="form-control" rows="10" name="freecontent" id="content" style="width:100%; min-width:260px; height:30em; display:none;"></textarea>
                  </div>
                  <div style="float: right;">
                  <button id="wrbtn" class="btn btn-border-d btn-round" type="button">글쓰기</button>
                  <button class="btn btn-border-d btn-round" type="button">돌아가기</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
        </div>
       <jsp:include page="../inc/Footer.jsp"/>
       <script type="text/javascript">
       CKEDITOR.replace("freecontent", {
    		filebrowserUploadUrl :"/imageUpload.do"
    	   // filebrowserImageUploadUrl: 'MacaronicsServlet?command=ckeditor_upload'	
    	});
       
//        $(document).ready(function() {
//     		var oEditors = [];
//     		nhn.husky.EZCreator.createInIFrame({
//     			oAppRef : oEditors,
//     			elPlaceHolder : "content",
//     			sSkinURI : "${contextPath}/smarteditor2/SmartEditor2Skin.html",
//     			htParams : {
//     				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
//     				bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
//     				bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
//     				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
//     				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
//     				fOnBeforeUnload : function(){
//     					//alert("완료!");
//     				}
//     			},
//     			fCreator : "createSEditor2"
//     		});
    		
//     	});
       </script>
  </body>
</html>