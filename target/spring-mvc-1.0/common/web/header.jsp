<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@page import="com.vanhieu.util.SecurityUtils" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="#!">My project</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <security:authorize access="isAnonymous()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/login"/>">Login</a>
                    </li>
                </security:authorize>
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hi, <%=SecurityUtils.getPrinciple().getUsername()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/logout"/>">, Logout</a>
                    </li>
                </security:authorize>
            </ul>
        </div>
    </div>
</nav>