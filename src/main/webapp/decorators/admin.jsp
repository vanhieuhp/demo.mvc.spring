<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Admin home</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    <link href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="<c:url value='/template/admin/css/sb-admin-2.min.css' />" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    <script type="text/javascript"  src="<c:url value='https://cdn.ckeditor.com/4.7.0/standard/ckeditor.js'/>"></script>

<%--    <sweet alert/>--%>
    <link href="<c:url value='/template/sweetalert/sweetalert2.min.css' />" rel="stylesheet">
    <script type="text/javascript"  src="<c:url value='/template/sweetalert/sweetalert2.min.js' />"></script>
</head>
<body id="page-top">
<div id="wrapper">
    <%--     <!-- Sidebar -->--%>
    <%@include file="/common/admin/menu.jsp"%>
    <div id="content-wrapper" class="d-flex flex-column">
        <%--          <!-- Main Content -->--%>
        <div id="contentBody">
            <%--            <!-- header -->--%>
            <%@include file="/common/admin/header.jsp"%>
            <%--            body--%>
            <dec:body/>
        </div>
        <%@include file="/common/admin/footer.jsp"%>
    </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<%--<script src="<c:url value = '/template/admin/vendor/jquery/jquery.js'/>"></script>--%>
<script src="<c:url value='/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value='/template/admin/vendor/jquery-easing/jquery.easing.min.js' />"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value='/template/admin/js/sb-admin-2.min.js'/>"></script>

<!-- Page level plugins -->
<script src="<c:url value='/template/admin/vendor/chart.js/Chart.min.js'/>"></script>

<!-- Page level custom scripts -->
<script src="<c:url value='/template/admin/js/demo/chart-area-demo.js'/>"></script>
<script src="<c:url value='/template/admin/js/demo/chart-pie-demo.js'/>"></script>
<script src="<c:url  value='/template/paging/jquery.twbsPagination.js'/>" type="text/javascript"></script>

</body>
</html>