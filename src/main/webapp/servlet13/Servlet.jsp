<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet.jsp</title>
</head>
<body>
	<fieldset>
		<legend>서블릿 사용하기</legend>
		<h2>서블릿으로 요청 보내기</h2>
		<!--URL은 디렉토리구조와 상관없다 -->
		<ul>
			
			<li><a href="<c:url value="/Basic/get.kosmo"/>">GET방식</a></li>
			<li>POST방식
				<form method="post" action="<c:url value="/Basic/post.kosmo"/>">
					아이디 : <input type="text" name="username"/>
					비밀번호 : <input type="password" name="password"/>
					<input type="submit" value="로그인"/>
				</form>		
			</li>	
			<li>
				<h4>GET/POST에 상관없이 요청받기(하나의 컨트롤러로 GET/POST방식 둘다 처리)</h4>
				<a href='<c:url value="/Basic/both.kosmo" />'>GET으로 보내기</a>
				<form action="<c:url value="/Basic/both.kosmo" />" method="post">
					<input type="submit" value="POST방식으로 보내기"/>
				</form>
			</li>
			<li>
				<h4>하나의 컨트롤러로 여러 요청 처리하기(파라미터로 구분)</h4>
				<!-- ?이하는 url-pattern에 해당하지 않음 -->
				<a href="<c:url value="/Basic/multi.kosmo?crud=create"/>">입력요청</a>
				<a href="<c:url value="/Basic/multi.kosmo?crud=read"/>">조회요청</a>
				<a href="<c:url value="/Basic/multi.kosmo?crud=update"/>">수정요청</a>
				<a href="<c:url value="/Basic/multi.kosmo?crud=delete"/>">삭제요청</a>			
			</li>	
			<li>
				<h4>링크 메뉴 클릭->GET요청->FirstController(입력폼으로 포워드)->입력폼에서는 submit클릭->POST요청->SecondController(FirstController로 포워드(405에러))</h4>
				<a href="<c:url value="/Basic/first.kosmo"/>">링크 메뉴</a>
			
			</li>
		</ul>
	</fieldset>
	<fieldset>
		<legend>리퀘스트 영역에 저장된 데이타</legend>
		<ul>
			<li>get.kosmo 요청시 : ${method_get}</li>
			<li>post.kosmo 요청시 : ${method_post }</li>
			<li>both.kosmo 요청시 : ${method_both }</li>
			<li>multi.kosmo 요청시 : ${crudMessage }</li>
		</ul>
	
	</fieldset>
	
	
	
</body>
</html>