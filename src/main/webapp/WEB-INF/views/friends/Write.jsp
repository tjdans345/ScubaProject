<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <title>Titan | Multipurpose HTML5 Template</title>
    <script type="text/javascript" src="../smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<!-- 	<script src="./editor.js"></script> -->
	<style type="text/css">
	#smart_editor2{
	width: 100%;
	}
	</style>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <jsp:include page="../inc/Top.jsp"/>
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <h4 class="font-alt mb-0">동료모집 글 작성</h4>
                <hr class="divider-w mt-10 mb-20">
                <form class="form" role="form">
                  <div class="form-group">
                  	<h5><b>제목</b></h5>
                    <input class="form-control input-lg" type="text" placeholder="제목을 입력하세요(메인 제목)"/>
                  </div>
                  <div class="form-group">
                  	<h5><b>인사말</b></h5>
                  <textarea class="form-control" rows="2" placeholder="인사말" style="resize: none;"></textarea>
                  </div>
                  <div class="form-group">
                  	<h5><b>신청방법</b></h5>
                  <textarea class="form-control" rows="2" placeholder="신청방법" style="resize: none;"></textarea>
                  </div>
                  <div class="form-group">
                  	<h5><b>여행 계획</b></h5>
                    <input class="form-control input-lg" type="text" placeholder="목적지"/>
                  <div class="input-group" style="float: left; width: 50%;">
                    <div class="input-group-addon">출발일</div>
                    <input class="form-control input-lg" id="date" type="date" name="date" placeholder="출발일"/>
                  </div>
                  <div class="input-group" style="float: left; width: 50%;">
                    <div class="input-group-addon">도착일</div>
                    <input class="form-control input-lg" id="date" type="date" name="date" placeholder="도착일"/>
                  </div>
                  </div>
                  <div class="form-group" style="clear: both; padding-top: 5px;">
                  	<h5><b>연락처</b></h5>
                    <input class="form-control input-lg" type="text" placeholder="휴대폰번호" style="width: 50%; float: left;"/>
                    <input class="form-control input-lg" type="text" placeholder="카카오톡" style="width: 50%; float: left;"/>
                  </div>
                  <div style="clear: both;">
                  <textarea class="form-control" rows="10" name="content" id="content" style="width:100%; min-width:260px; height:30em; display:none;"></textarea>
                  </div>
                  <div class="form-group">
                  	<h5><b>태그</b></h5>
                  <textarea class="form-control" rows="2" placeholder="태그" style="resize: none;"></textarea>
                  </div>
                  <div style="float: right;">
                  <button class="btn btn-border-d btn-round" type="button">글쓰기</button>
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
       $(document).ready(function() {
    		
    		var oEditors = [];
    		nhn.husky.EZCreator.createInIFrame({
    			oAppRef : oEditors,
    			elPlaceHolder : "content",
    			sSkinURI : "../smarteditor2/SmartEditor2Skin.html",
    			htParams : {
    				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
    				bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
    				bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
    				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
    				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
    				fOnBeforeUnload : function(){
    					//alert("완료!");
    				}
    			},
    			fCreator : "createSEditor2"
    		});
    		
    	});
       </script>
  </body>
</html>