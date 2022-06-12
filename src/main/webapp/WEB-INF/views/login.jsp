<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Watch Web Login</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/template/admin/css/sb-admin-2.min.css'/>" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">
        <div class="col-xl-6 col-lg-6 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="col-lg-12">
                    <div class="p-lg-5">
                        <c:if test="${param.incorrectAccount != null}">
                            <div class="alert alert-danger" role="alert">
                                   Username or password is incorrect
                            </div>
                        </c:if>
                        <c:if test="${param.accessDenied != null}">
                            <div class="alert alert-danger" role="alert">
                                Let's login with admin account
                            </div>
                        </c:if>
                        <form class="user" action = "j_spring_security_check" method="POST" id="LoginForm">
                            <div class="text-center">
                                <h4 class="h4 text-gray-900 mb-4"> Login </h4>
                            </div>
                            <div class="form-group">
                                <input type="text" value="" name="j_username" class="form-control form-control-user" id="username" placeholder="Enter username">
                            </div>
                            <div class="form-group">
                                <input type="password" value="" name="j_password" class="form-control form-control-user" id="password" placeholder="Enter Password">
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-checkbox small">
                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                    <label class="custom-control-label" for="customCheck">Remember
                                        Me</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-user btn-block">Login</button>
                            <a href="#" class="btn btn-google btn-user btn-block">
                                <i class="fab fa-google fa-fw"></i> Login with Google
                            </a>
                            <a href="#" class="btn btn-facebook btn-user btn-block">
                                <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                            </a>
                        </form>
                        <br>
                        <div class="text-center">
                            <a class="small" href="#">Forgot Password?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="#">Create an Account!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<c:url value='/template/admin/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value='/template/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value='/template/admin/js/sb-admin-2.min.js'/>"></script>
</body>
</html>