<%@page import="edu.web.jstl01.ContactVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
  <%--
    <c:forEach var="" begin="" end=""></c:forEach> 태그
    - 자바의 for문, for-each 문의 형태
    - 배열, 컬렉션, 맵 등에 저장되어 있는 값을 순차적으로 처리
    - 기본 형태
    <c:forEach var="변수" items="아이템" begin="시작값" end="끝값" step="증가값">
      ${변수}
    </c:forEach>
    
    items = array, collection. map 형태의 데이터를 저장
    주의) Iterator, Enumeration, Map의 경우 데이터 저장 순서와 읽는 순서가 일치
        하지 않을 수 있기 때문에, begin, end, step 속성을 잘 사용하지 않음
  --%>
  <h2>1부터 100까지의 홀수의 합</h2>
  <c:set var="sum" value="0"/>
  <c:forEach var="i" begin="1" end="100" step="2">
    <c:set var="sum" value="${sum+i }"/>
  </c:forEach>  
  <p>합 : ${sum }</p>
  
  
  <h2>구구단</h2>
  <c:forEach var="i" begin="2" end="9" step="1">
    <c:forEach var="j" begin="1" end="9" step="1">
      ${i } * ${j } = ${i*j }<br>
    </c:forEach>
    <br>
  </c:forEach>
      <%
          String[] sports = {"야구", "축구", "스쿼시", "테니스" };
          request.setAttribute("sports", sports);
      %>
      
      <h2>배열에서 데이터 출력</h2>
      <c:forEach var="s" items="${sports }" varStatus="status">
            현재 인덱스 값 : ${status.index }<br>
            문자열 값 : ${s }<br>
            루프 실행 횟수 : ${status.count }<br>
       begin 값 : ${status.begin }<br>
       end 값 : ${status.end }<br>
       step 값 : ${status.step }<br>
             </c:forEach>
  <%
  ArrayList<ContactVO> list = new ArrayList<>();
  ContactVO vo = null;
  
  for(int i = 0; i<5; i++){
   String name = "학생 : " + (i + 1);
   String phone = "010-1111-111" + (i+1);
   String email = "test" + (i+1) +"@test.com";
   vo = new ContactVO(name,phone,email);
   list.add(vo);
  }
  request.setAttribute("list", list);
  %>
  
  <c:forEach var="vo" items="${list }">
    <p>이름 : ${vo.name }</p>
    <p>번호 : ${vo.phone }</p>
    <p>이메일 : ${vo.email }</p>
  </c:forEach>
  
  
</body>
</html>