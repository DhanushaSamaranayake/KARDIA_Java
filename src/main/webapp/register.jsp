<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

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

<section class="register d-flex">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-box mr-auto ml-auto register-card">
                    <div class="title p-4">
                        <h4>Registration Form</h4>
                    </div>
                    <div class="pd-20 mb-30">
                        <%--@elvariable id="regForm" type="java"--%>
                        <form:form method="POST" modelAttribute="regForm" action="/register" class="needs-validation">
                            <div class="modal-body">

                                        <spring:bind path="firstName">
                                            <div class="form-group">
                                                <label>First name <sup>*</sup></label>
                                                <form:input class="form-control mb-3" type="text" placeholder="First name"
                                                            path="firstName"/>
                                                <form:errors cssClass="alert-danger" path="firstName"/>
                                            </div>
                                        </spring:bind>


                                        <spring:bind path="lastName">
                                            <div class="form-group">
                                                <label>Last name <sup>*</sup></label>
                                                <form:input class="form-control mb-3" type="text" placeholder="Last name"
                                                            path="lastName"/>
                                                <form:errors cssClass="alert-danger" path="lastName"/>
                                            </div>
                                        </spring:bind>

                                        <spring:bind path="email">
                                            <div class="form-group">
                                                <label>Email<sup>*</sup></label>
                                                <form:input class="form-control mb-3" type="email" placeholder="Email"
                                                            path="email"/>
                                                <form:errors cssClass="alert-danger" path="email"/>
                                            </div>
                                        </spring:bind>

                                        <spring:bind path="password">
                                            <div class="form-group">
                                                <label>Password<sup>*</sup></label>
                                                <form:input class="form-control mb-3" type="password" placeholder="Password"
                                                            path="password"/>
                                                <form:errors cssClass="alert-danger" path="password"/>
                                            </div>
                                        </spring:bind>

                                        <spring:bind path="passwordConfirm">
                                            <div class="form-group">
                                                <label>Confirm Password<sup>*</sup></label>
                                                <form:input class="form-control mb-3" type="password"
                                                            placeholder="Confirm Password"
                                                            path="passwordConfirm"/>
                                                <form:errors cssClass="alert-danger" path="passwordConfirm"/>
                                            </div>
                                        </spring:bind>

                                        <spring:bind path="contactNumber">
                                            <div class="form-group">
                                                <label>Contact Number <sup>*</sup></label>
                                                <form:input class="form-control mb-3" name="contactNumber"
                                                            placeholder="+94xxxxxxxxx" type="text" path="contactNumber"
                                                            pattern="\d{9}"
                                                />
                                                <form:errors cssClass="alert-danger" path="contactNumber"/>
                                            </div>
                                        </spring:bind>
                                        <spring:bind path="address">
                                            <div class="form-group">
                                                <label>Address <sup>*</sup></label>
                                                <form:textarea class="form-control mb-3" name="address" cols="30" rows=""
                                                               path="address" placeholder="Address"/>
                                                <form:errors cssClass="alert-danger" path="address"/>
                                            </div>
                                        </spring:bind>
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary modal-footer__save-btn">Sign Up</button>
                            </div>

                            <div id="profile-page-success-message-block"
                                 style="width: 100%;margin: auto;display: ${message != null ? "block" : "none"}">
                                <br/>
                                <div class="alert alert-success" role="alert"
                                     id="profile-page-success-message">${message}</div>
                                <br/>
                            </div>

                        </form:form>

                        <div class="input-group text-center mt-4">
                            <a class="w-100" href="/login">Back to Login</a>
                        </div>
                    <br/>
                    <br/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/chosen.jquery.min.js"></script>
<script src="resources/js/popper.min.js"></script>
</body>
</html>