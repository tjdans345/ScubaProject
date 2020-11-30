<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/Top.jsp"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <title>Titan | Multipurpose HTML5 Template</title>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    
      <div class="main">
        <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <div class="post" style="margin-bottom: 15px;">
                  <div class="post-header font-alt">
                    <h1 class="post-title">${viewList.title}</h1>
                    <div class="post-meta"> ${viewList.nickname}   | ${viewList.writedate}
                    </div>
                  </div>
                  <div class="post-entry">
                    <p>${viewList.content}</p>
                  </div>
                   <div class="row multi-columns-row">
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><i class="fa fa-fw">&#xf155;</i></div>
                  <h3 class="features-title font-alt">희망가격</h3>
                  <p><b>${viewList.price}</b></p>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-phone"></span></div>
                  <h3 class="features-title font-alt">연락처</h3>
                  <c:if test="${viewList.phone ne '' || viewList.phone ne null}">
                  <p><b>${viewList.phone}</b></p>
                  </c:if>
                  <c:if test="${viewList.phone eq '' || viewList.phone eq null}">
                  <p><b>연락처 정보가 없습니다.</b></p>
                  </c:if>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-search"></span></div>
                  <h3 class="features-title font-alt">물품상태</h3>
                  <p><b>${viewList.productstatus}</b></p>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><i class="fa fa-fw">&#xf06b;</i></div>
                  <h3 class="features-title font-alt">판매상태</h3>
                  <c:if test="${viewList.dealstatus == 0}">
                  <p><b>판매중</b></p>
                  </c:if>
                  <c:if test="${viewList.dealstatus == 1}">
                  <p><b>판매 완료</b></p>
                  </c:if>
                </div>
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
                  <h6 class="comment-form-title font-alt">댓글 달기</h6>
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