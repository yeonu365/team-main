<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:url value="/travelog/list" var="listUrl">
<c:if test="${not empty cri }">
	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
	<c:param name="amount" value="${cri.amount }"></c:param>
</c:if>
</c:url>
<c:url value="/travelog/insert" var="insertUrl">
<c:if test="${not empty cri }">
	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
	<c:param name="amount" value="${cri.amount }"></c:param>
</c:if>
</c:url>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">travelers</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="${listUrl }">목록보기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${insertUrl }">글쓰기</a>
      </li>
      
      
    </ul>
  </div>
</nav>