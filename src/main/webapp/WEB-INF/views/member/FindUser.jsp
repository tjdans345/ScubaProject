<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
    
<script type="text/javascript">
$(document).ready(function() {
	//비밀번호 찾기 클릭 시
	$(".te").click(function() {
		$(".idf").hide();
		$(".passf").show();
	});
	
	//ID찾기 클릭 시
	$(".te2").click(function() {
		$(".idf").show();
		$(".passf").hide();
	});
});
</script>
<jsp:include page="../inc/Top.jsp"/>
</head>
<body>
<!-- 회원 정보 찾기 -->
        <section class="module" style="padding: 110px 0;">
          <div class="container" align="center">
            <div class="row">
              <div class="col-sm-4 col-sm-offset-4 idf" style="min-width: 397px;">
                <h4 class="font-alt">아이디 찾기</h4>
                <hr class="divider-w mb-10">
                <form class="form">
                  <div class="form-group">
                    <input class="form-control" id="username" type="text" name="username" placeholder="name"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="password" type="email" name="password" placeholder="email"/>
                  </div>
                  <div class="form-group">
                    <button class="btn btn-block btn-round btn-b" type="button">아이디 찾기</button>
                    <a style="float: left;" class="te" href="javascript:;" title="비밀번호 찾기">비밀번호 잃어버리셨나요 ??</a>
                  </div>
                </form>
              </div>
              <div class="col-sm-4 col-sm-offset-4 passf" style="min-width: 397px; display: none;">
                <h4 class="font-alt">비밀번호 찾기</h4>
                <hr class="divider-w mb-10">
                <form class="form">
                  <div class="form-group">
                    <input class="form-control" id="E-mail" type="text" name="email" placeholder="id"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="password" type="email" name="password" placeholder="email"/>
                  </div>
                  <div class="form-group">
                    <button class="btn btn-block btn-round btn-b">비밀번호 찾기</button>
                    <a style="float: left;" class="te2" href="javascript:;" title="ID 찾기">아이디를 잃어버리셨나요 ??</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
<!-- 회원 정보 찾기 -->
<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>