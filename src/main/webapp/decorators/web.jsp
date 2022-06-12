<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Welcome website</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<c:url value = '/template/web/assets/favicon.ico'/>" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value = '/template/web/css/styles.css'/>" rel="stylesheet" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
           <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
         <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
         <script src="<c:url value = '/template/paging/jquery.twbsPagination.js'/>" type="text/javascript"></script>
    </head>
    <body>
        <%@include file = '/common/web/header.jsp' %>
        
        <dec:body/>
       	
        <%@include file = "/common/web/footer.jsp" %>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<c:url value = '/template/web/js/scripts.js'/>"></script>
    </body>
</html>