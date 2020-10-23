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
              <div class="col-sm-8">
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
              <div class="row mt-70" style="padding: 0 15px;">
                <ul class="nav nav-tabs font-alt" role="tablist">
                  <li class="active"><a href="#description" data-toggle="tab"><span class="icon-tools-2"></span>인사말</a></li>
                  <li><a href="#data-sheet" data-toggle="tab"><span class="icon-tools-2"></span>모집 정보</a></li>
                  <li><a href="#call" data-toggle="tab"><span class="icon-tools-2"></span>신청 / 문의</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
					<p>인사말</p>
                  </div>
                  <div class="tab-pane" id="data-sheet">
                    <table class="table table-striped ds-table table-responsive">
                      <tbody>
                        <tr>
                          <th width="20%">목적지</th>
                          <td>요기 ?</td>
                          <th>휴대폰</th>
                          <td>01012341234</td>
                        </tr>
                        <tr>
                          <th>출발일</th>
                          <td>지금?</td>
                          <th><img src="../assets/images/kakaoIcon.png" width="19px" alt="kakaoIcon"></th>
                          <td>KaKaOId</td>
                        </tr>
                        <tr>
                          <th>도착일</th>
                          <td>내일</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane" id="call">
					<p>신청 방법</p>
                  </div>
                </div>
              </div>
                <div class="row" style="padding: 0 15px;">
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
              <div class="col-sm-4 col-md-3 col-md-offset-1 sidebar">
                <div class="widget">
                  <h5 class="widget-title font-alt">현재 인원</h5>
                  <ul class="widget-posts" style="margin-left: -13px;">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../assets/images/rp-1.jpg" alt="Post Thumbnail" style="margin-left:15px; width:60%; border-radius: 100%;"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title" style="margin-top: 7px;"><a href="#">김태훈</a></div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../assets/images/rp-2.jpg" alt="Post Thumbnail" style="margin-left:15px; width:60%; border-radius: 100%;"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title" style="margin-top: 7px;"><a href="#">엄성문</a></div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../assets/images/rp-3.jpg" alt="Post Thumbnail" style="margin-left:15px; width:60%; border-radius: 100%;"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title" style="margin-top: 7px;"><a href="#">김태훈</a></div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="../assets/images/rp-4.jpg" alt="Post Thumbnail" style="margin-left:15px; width:60%; border-radius: 100%;"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title" style="margin-top: 7px;"><a href="#">엄성문</a></div>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="widget">
                  <h5 class="widget-title font-alt">해쉬 태그(검색 용도)</h5>
                  <div class="tags font-serif"><a href="#" rel="tag">Blog</a><a href="#" rel="tag">Photo</a><a href="#" rel="tag">Video</a><a href="#" rel="tag">Image</a><a href="#" rel="tag">Minimal</a><a href="#" rel="tag">Post</a><a href="#" rel="tag">Theme</a><a href="#" rel="tag">Ideas</a><a href="#" rel="tag">Tags</a><a href="#" rel="tag">Bootstrap</a><a href="#" rel="tag">Popular</a><a href="#" rel="tag">English</a>
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