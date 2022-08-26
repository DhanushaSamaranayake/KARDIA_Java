<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/chosen.min.css">

</head>
<body>

<div class="flex-shrink-0 without-left-menu">
    <div class="login-page__fixed-background"></div>
    <div class="login-page">
        <div class="login-page__right">
            <div class="container">
                <div class="row align-items-center login-page__right-row bg-white">
                    <div class="col-lg-8 offset-lg-2 col-md-8 offset-md-2">
                        <div class="card border-0 shadow-none">
                            <div class="card-body p-sm-5 p-3">
                                <div class="text-lg-left text-center">
                                    <h2 class="mt-4 mb-0 bold-font text-primary-color">KARDIA</h2>
                                    <p class="sub-text mt-0">Welcome Back. Please login to your
                                        account.</p>
                                </div>
                                <div id="profile-page-success-message-block"
                                     style="width: 100%;margin: auto;display: ${error != null ? "block" : "none"}">
                                    <div class="alert alert-danger" role="alert"
                                         id="profile-page-success-message">${error}</div>
                                </div>
                                <form method="POST" action="${pageContext.request.contextPath}/login" class="mt-md-4">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" name="username" class="form-control" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" name="password" value="12345678" class="form-control"/>
                                    </div>
                                    <input type="submit" value="Sign In"
                                           class="btn btn-primary w-100 mt-3 btn-foreground-white"/>
                                    <h3 style="text-align: center;">or</h3>
                                    <a href="/register" class="btn btn-primary w-100 mt-3 btn-foreground-white"
                                       role="button">Sign Up</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/chosen.jquery.min.js"></script>
<script src="resources/js/popper.min.js"></script>

</body>
</html>
