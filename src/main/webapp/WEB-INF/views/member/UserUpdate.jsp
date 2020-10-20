<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<!-- 주소 넣기 / 휴대폰 하나 빼기 -->
<jsp:include page="../inc/Top.jsp"/>
</head>
<body>
<!-- 회원정보 수정 폼 -->
	<section class="module">
         <div class="container" align="center">
           <div class="row">
             <div class="col-sm-6 col-sm-offset-3">
               <h4 class="font-alt">회원 정보 수정</h4>
               <hr class="divider-w mb-10">
               <form class="form" >
               	  <div class="form-group" style="margin: 25px 0 ;">
               		<img src="../assets/images/rp-1.jpg" alt="Post Thumbnail" style="width: 200px; border-radius: 100%;"/>
                  </div>
				  <div class="form-group">
                    <input class="form-control" id="E-mail" type="text" name="email" placeholder="id" readonly="readonly"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="username" type="text" name="username" placeholder="Password"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="password" type="password" name="password" placeholder="Password_Check"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="Name" type="text" name="NickName" placeholder="NickName"/>
                  </div>
                  <div class="form-group">
                    <div class="form-group">
                      <input class="form-control" readonly="readonly" type="email" id="semail" name="semail" placeholder="Your Email" data-validation-required-message="Please enter your email address." required="required"/>
                    </div>    
                  </div>  
                  <div class="form-group" style="float: right;">
                    <button class="btn btn-round btn-b">정보 수정</button>
                    <button class="btn btn-round btn-b">취소</button>
                  </div>
               </form>
             </div>
           </div>
         </div>
       </section>
<!-- 회원정보 수정 폼 -->
<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>