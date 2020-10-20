<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 회사 정보  -->
</head>
<body>
<jsp:include page="../inc/Top.jsp"/>
<!-- 질문 -->
        <section class="module" style="padding: 70px 0;">
          <div class="container">
            <div class="row mb-60" style="margin-bottom: 0% !important;">
              <div class="col-sm-8 col-sm-offset-2">
               <h4 class="font-alt mb-0">고객센터</h4>
                <hr class="divider-w mt-10 mb-20">
                <form role="form" style="padding-bottom: 20px;">
                  <div class="search-box">
                    <input class="form-control" type="text" placeholder="질문검색"/>
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
                </form>
                <div class="row">
                    <div class="tab-pane" id="list">
                      <div class="panel-group" id="accordion" style="padding: 0 15px;">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a data-toggle="collapse" data-parent="#accordion" href="#list1">자주 묻는 질문1</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="list1">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#list2">자주 묻는 질문2</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="list2">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                <div role="tabpanel">
                  <ul class="nav nav-tabs font-alt" role="tablist">
<!--                   카테고리 -->
                    <li class="active"><a href="#question" data-toggle="tab"><span class="icon-tools-2"></span>1대1문의</a></li>
                    <li><a href="#member" data-toggle="tab"><span class="icon-tools-2"></span>회원</a></li>
                    <li><a href="#shop" data-toggle="tab"><span class="icon-tools-2"></span>샾 관련</a></li>
                    <li><a href="#divingsite" data-toggle="tab"><span class="icon-tools-2"></span>다이빙 사이트</a></li>
<!--                     카테고리 -->
                  </ul>
                  <div class="tab-content">
<!--                   1대1문의 -->
                    <div class="tab-pane active" id="question">
                      <div class="panel-group" id="accordion">
                      	<button class="btn btn-block btn-round btn-b">1대1 문의하기</button>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a data-toggle="collapse" data-parent="#accordion" href="#question1">question Question 1<font color="red">대기중</font></a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="question1">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#question2">question Question 2<font color="blue">답변완료</font></a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="question2">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                              <hr>
                              <p>답변</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
<!--                     1대1문의 -->
<!--                     회원 -->
                    <div class="tab-pane" id="member">
                      <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a data-toggle="collapse" data-parent="#accordion" href="#member1">member Question 1</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="member1">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#member2">member Question 2</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="member2">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
<!--                     회원 -->
<!-- 						샾 -->
                    <div class="tab-pane" id="shop">
                      <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a data-toggle="collapse" data-parent="#accordion" href="#shop1">shop Question 1</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="shop1">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#shop2">shop Question 2</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="shop2">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
<!--                     샾 -->
<!-- 					다이빙사이트 -->
                    <div class="tab-pane" id="divingsite">
                      <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a data-toggle="collapse" data-parent="#accordion" href="#divingsite1">divingsite Question 1</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="divingsite1">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#divingsite2">divingsite Question 2</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="divingsite2">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
<!--                     다이빙사이트 -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
<!-- 질문 -->
<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>