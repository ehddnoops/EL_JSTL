<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table, th, td{
  border-style : ${param.boardStyle};
  border-color : ${param.boardColor};
  border-width : 1px;
  font-size : ${param.fontSize};
  color : ${param.fontColor};
}
</style>
<meta charset="UTF-8">
<title>${param.title }</title>
</head>
<body>
<h2>${param.title }</h2>
<table>
  <thead>
    <tr>
      <th>번호</th>
      <th>링크 주소</th>
      <th>비고</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${ empty paramValues.link }">
        <c:redirect url="05_input_board_style.jsp" />
</c:if>
    <c:forEach var="link" items="${paramValues.link }">
      <tr>
      <td>${s.count }</td>
      <td><a href="${link}">${link }</a></td>
      <td>-</td>
      </tr>
    <%-- 
      퀴즈. EL 태그와 JSTL을 이용하여 위의 tbody 부분을 똑같이 구현
        - 만약 넘어온 테이블 데이터의 값이 null인경우 05_input_board_style.jsp 로 이동
        - 이동 방법 : <c:redirect url="05_input_board_style.jsp" />
        - 테이블 데이터가 있는 경우 jstl을 사용하여 테이블 데이터를 표로 출력
    --%>
    
    <br>
    </c:forEach>
    
  </tbody>
  
</table>
</body>
</html>

<%-- <tbody>
    <%
    String[] linkList = request.getParameterValues("link");
    for(int i =0; i< linkList.length; i++){
    %>
      <tr>
        <td><%= i +1 %></td>
        <td><%=linkList[i] %></td>
        <td>-</td>
      </tr>
    <%} %>
  </tbody> --%>