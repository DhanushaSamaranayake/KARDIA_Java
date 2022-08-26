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

<div>
    <nav class="sidebar">
        <div class="sidebar-header">
            <p class="sidebar-header__text m-0">KARDIA</p>
        </div>

        <ul class="sidebar-list">
            <li class="sidebar-list__item" id="option1">
                <a class="sidebar-list__item-link" href="/dashboard">
                    <span class="sidebar-list__item-link--icon"><i class="fas fa-home fa-lg"></i></span>
                    <span class="sidebar-list__item-link--text">Home</span>
                </a>
            </li>
            <li class="sidebar-list__item" id="option2">
                <a class="sidebar-list__item-link" href="/check-kardia">
                    <span class="sidebar-list__item-link--icon"><i class="fas fa-home fa-lg"></i></span>
                    <span class="sidebar-list__item-link--text">Check KARDIA</span>
                </a>
            </li>
            <li class="sidebar-list__item" id="option3">
                <a class="sidebar-list__item-link" href="/user-profile">
                    <span class="sidebar-list__item-link--icon"><i class="fas fa-home fa-lg"></i></span>
                    <span class="sidebar-list__item-link--text">User Profile</span>
                </a>
            </li>
            <li class="sidebar-list__item">
                <a class="sidebar-list__item-link" href="/logout">
                    <span class="sidebar-list__item-link--icon"><i class="fas fa-home fa-lg"></i></span>
                    <span class="sidebar-list__item-link--text">Sign Out</span>
                </a>
            </li>
        </ul>

        <div class="sidebar-footer">
            <div class="row no-gutters">
                <div class="col-sm-8">
                    <div class="sidebar__account d-sm-block d-none">
                        <div class="sidebar__account-item">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>