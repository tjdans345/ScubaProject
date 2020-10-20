<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리조트 등록</title>
<script type="text/javascript" src="../smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<!-- 주소 위치 추가할것 -->
<jsp:include page="../inc/Top.jsp"/>
</head>
<body>

        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <h4 class="font-alt mb-0">리조트 등록</h4>
                <hr class="divider-w mt-10 mb-20">
                <form class="form" role="form">
                  <div class="form-group">
                  	<h5><b>리조트 이름</b></h5>
                    <input class="form-control input-lg" type="text" placeholder="리조트 이름"/>
                  </div>
                  <div class="form-group">
                  	<h5><b>연락처 등록</b></h5>
                    <input class="form-control" type="text" placeholder="연락처" style="float: left; width: 49%; margin-right: 1%;"/>
                    <input class="form-control" type="text" placeholder="카카오톡아이디" style="width: 50%;"/>
                  </div>
                  <div class="form-group">
                  	<h5><b>홈페이지 주소</b></h5>
                    <input class="form-control input-sm" type="text" placeholder="홈페이지 주소"/>
                  </div>
                  <div class="form-group">
                  <h5><b>한줄소개</b></h5>
                  <textarea class="form-control" rows="3" placeholder="한줄소개" style="resize: none;"></textarea>
                  </div>
                  <div class="form-group">
                  <textarea class="form-control" rows="10" name="content" id="content" style="width:100%; min-width:260px; height:30em; display:none;"></textarea>
               	  </div>
               	  <div class="form-group">
               	  <h5><b>태그</b></h5>
                  <textarea class="form-control" rows="2" placeholder="태그" style="resize: none;"></textarea>
                  </div>
                  <div class="form-group">
                  	<div class="row multi-columns-row" style="margin-bottom: 15px;">
	                  <div class="col-sm-6 col-md-6 col-lg-6">
	                    <div class="form-group">
	                      <h3 class="alt-features-title font-alt">이미지 등록</h3>
	                      <input class="form-control custom-file-input" type="file" placeholder="이미지 업로드"/>
	                      <input class="form-control custom-file-input" type="file" placeholder="이미지 업로드"/>
	                      <input class="form-control custom-file-input" type="file" placeholder="이미지 업로드"/>
	                    </div>
	                  </div>
                  	  <div class="col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                          <h4 class="alt-features-title font-alt">미리보기</h4>
						  <img src="../assets/images/post-2.jpg" alt="Title 1">	                        
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row" style="text-align: center;">
                  <button class="btn btn-border-d btn-round">등록하기</button>&nbsp;
                  <button class="btn btn-border-d btn-round">취소하기</button>&nbsp;
                  <button class="btn btn-border-d btn-round">목록으로</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
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