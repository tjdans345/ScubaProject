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
        <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <div class="post">
                  <div class="post-header font-alt">
                    <h1 class="post-title">메인 제목</h1>
                    <div class="post-meta"> 글쓴이  | 좋아요  | 등록 일자
                    </div>
                  </div>
                  <div class="post-entry">
                    <p>글 내용</p>
                    </div>
                </div>
                <div class="row">
               	  <button class="btn btn-border-d btn-round" type="submit" style="float: right; margin: 5px;">목록보기</button>
                  <button class="btn btn-border-d btn-round" type="submit" style="float: right; margin: 5px;">글 삭제</button>
                  <button class="btn btn-border-d btn-round" type="submit" style="float: right; margin: 5px;">글 수정</button>
                </div>
                <!-- 댓글 입력창 -->
                <div class="comment-form" style="margin-top: 0px;">
                  <h6 class="comment-form-title font-alt">댓글</h6>
                  <form method="post">
                    <div class="form-group">
                      <textarea class="form-control" id="comment" name="comment" rows="4" placeholder="댓글을 입력하세요" style="resize: none;"></textarea>
                    </div>
                    <button class="btn btn-border-d btn-round" type="submit" style="float: right;">댓글 등록</button>
                  </form>
                </div>
                <!-- 댓글 입력창 -->
                <div class="comments">
                  <div class="comment clearfix">
                    <div class="comment-avatar"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/ryanbattles/128.jpg" alt="avatar"/></div>
                    <div class="comment-content clearfix">
                      <div class="comment-author font-alt"><a href="#">John Doe</a></div>
                      <div class="comment-body">
                        <p style="margin-bottom: 5px;">The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                      </div>
                      <div class="comment-meta font-alt">Today, 14:55 - <a href="#">Reply</a>
                      </div>
                    </div>
                   
                  </div>
                  <div class="comment clearfix">
                    <div class="comment-avatar"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/pixeliris/128.jpg" alt="avatar"/></div>
                    <div class="comment-content clearfix">
                      <div class="comment-author font-alt"><a href="#">Andy</a></div>
                      <div class="comment-body">
                        <p style="margin-bottom: 5px;">The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>
                      </div>
                      <div class="comment-meta font-alt">Today, 14:59 - <a href="#">Reply</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        </div>
       <jsp:include page="../inc/Footer.jsp"/>
  </body>
</html>