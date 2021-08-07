<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:url value="/travelog/list" var="listUrl">
<c:if test="${not empty cri }">
	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
	<c:param name="amount" value="${cri.amount }"></c:param>
	<c:param name="keyword" value="${cri.keyword }"></c:param>
	<c:param name="type" value="${cri.type }"></c:param>
</c:if>
</c:url>
<c:url value="/travelog/insert" var="insertUrl">
<c:if test="${not empty cri }">
	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
	<c:param name="amount" value="${cri.amount }"></c:param>
	<c:param name="keyword" value="${cri.keyword }"></c:param>
	<c:param name="type" value="${cri.type }"></c:param>
</c:if>
</c:url>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="${appRoot }/travelog/list">travelers</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="${listUrl }">여행기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${insertUrl }">나의 여행기</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="${appRoot }/secure/all">[all]</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${appRoot }/secure/member">[member only]</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${appRoot }/secure/admin">[admin only]</a>
      </li>
      
    </ul>
  </div>
  <form action="${appRoot }/logout" method="post">
  	<input type="submit" class="btn btn-outline-secondary" value="로그아웃">
  </form>

 &nbsp &nbsp<form action="${listUrl }" method="get" class="form-inline">
  	<select name="type" class="form-control mr-sm-2">
  		<option value="TCAW" ${cri.type == "TCAW" ? 'selected' : '' }>전체검색</option>
  		<option value="T" ${cri.type == "T" ? 'selected' : '' }>제목</option>
  		<option value="C" ${cri.type == "C" ? 'selected' : '' }>도시명</option>
  		<option value="A" ${cri.type == "A" ? 'selected' : '' }>회사명</option>
  		<option value="W" ${cri.type == "W" ? 'selected' : '' }>작성자</option>
  	</select>
    <input name="keyword" value="${cri.keyword }" type="search" class="form-control mr-sm-2" placeholder="검색어 입력" aria-label="Search">
    
    <input type="hidden" name="pageNum" value="1">
    <input type="hidden" name="amount" value="${cri.amount }">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
  </form>
</nav>