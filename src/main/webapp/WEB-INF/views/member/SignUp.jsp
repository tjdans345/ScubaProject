<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<!-- 주소 넣기  -->
<!-- 폰번호 하나 뺴기 -->
<jsp:include page="../inc/Top.jsp"/>
</head>
<body>

<!-- 회원가입 폼 -->
	<section class="module" >
         <div class="container" align="center">
           <div class="row">
            <div class="col-sm-4 col-sm-offset-4" >
               <h4 class="font-alt">회원 가입</h4>
               <hr class="divider-w mb-10">
               <form class="form" action="${contextPath}/userjoin.mem" method="post" style="min-width: 245px;">
				  <div class="form-group">
                    <input class="form-control" id="id" type="text" name="id" placeholder="id"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="pwd" type="password" name="pwd" placeholder="password"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="pwd_c" type="password" name="pwd_c" placeholder="password_c"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="nickname" type="text" name="nickname" placeholder="NickName"/>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <input class="form-control" type="email" id="email" name="email" placeholder="Your Email" data-validation-required-message="Please enter your email address." required="required"/><span class="input-group-btn">
                        <button class="btn btn-g btn-round" id="subscription-form-submit" type="submit">Submit</button></span>
                    </div>    
                  </div> 
                  <div class="form-group" id="emailcheck" style="display: none;">
                    <input class="form-control" type="text" name="emailcheck" placeholder="인증번호"/>
                  </div>    
                  <div class="form-group" style="float: right;">
                    <button class="btn btn-round btn-b" type="submit">회원 가입</button>
                    <button class="btn btn-round btn-b" onclick="history.back()">취소</button>
                  </div>
               </form>
             </div>
           </div>
         </div>
       </section>
<!-- 회원가입 폼 -->
<jsp:include page="../inc/Footer.jsp"/>
</body>
</html>