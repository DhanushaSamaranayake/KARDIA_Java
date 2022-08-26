<%@include file="side-bar.jsp" %>

<div class="flex-shrink-0">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                <h5 class="font-weight-bold mt-1 mb-1">User Profile</h5>
            </div>
        </div>
        <br/>
        <div class="col">
            <div class="row">
                <div class="col mb-3">
                    <div class="card">
                        <div class="card-body">

                            <div id="profile-page-success-message-block" style="width: 100%;margin: auto;display: ${message != null ? "block" : "none"}">
                                <br/>
                                <div class="alert alert-success" role="alert" id="profile-page-success-message">${message}</div>
                            </div>

                            <%--@elvariable id="userProfile" type="java"--%>
                            <div class="e-profile">
                                <div class="row">
                                    <div class="col-12 col-sm-auto mb-3">
                                        <div class="mx-auto" style="width: 140px;">
                                            <img src="${(userProfile.profileUri != null && userProfile.profileUri != "")
                                     ? userProfile.profileUri : "resources/images/default-profile-icon.png"}" class="d-flex justify-content-center align-items-center rounded"
                                                 style="height: 140px; width: 140px; background-color: rgb(233, 236, 239);"
                                                alt="profile-photo"
                                            />
                                        </div>
                                    </div>
                                    <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                        <div class="text-center text-sm-left mb-2 mb-sm-0">
                                            <h4 class="pt-sm-2 pb-1 mb-5 text-nowrap">${userProfile.firstName} ${userProfile.lastName}</h4>
                                            <form method="POST" action="/change-profile-picture" enctype="multipart/form-data">
                                                <div class="d-flex mt-2">
                                                    <input class="btn btn-sm btn-primary mr-3" name="file" type="file"
                                                           value="Select Photo" onchange="checkFile(this)" role="button">
                                                    <input class="btn btn-sm btn-primary" id="uploadBtn" value="Upload" disabled type="submit" role="button" />
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content pt-3">
                                    <div class="tab-pane active">
                                        <form:form method="POST" modelAttribute="userProfile" action="/user-profile"
                                                   class="needs-validation">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <spring:bind path="firstName">
                                                                <div class="form-group">
                                                                    <label>First name <sup>*</sup></label>
                                                                    <form:input class="form-control mb-2" type="text"
                                                                                placeholder="First name"
                                                                                path="firstName"/>

                                                                    <form:errors cssClass="alert-danger"
                                                                                 path="firstName"/>
                                                                </div>
                                                            </spring:bind>
                                                        </div>
                                                        <div class="col">
                                                            <spring:bind path="lastName">
                                                                <div class="form-group">
                                                                    <label>Last name <sup>*</sup></label>
                                                                    <form:input class="form-control mb-2" type="text"
                                                                                placeholder="Last name"
                                                                                path="lastName"/>

                                                                    <form:errors cssClass="alert-danger"
                                                                                 path="lastName"/>
                                                                </div>
                                                            </spring:bind>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <spring:bind path="email">
                                                                <div class="form-group">
                                                                    <label>Email<sup>*</sup></label>
                                                                    <form:input class="form-control mb-2" type="email"
                                                                                value="${userProfile.email}"
                                                                                placeholder="Email" path="email"
                                                                                readonly="true"/>
                                                                    <form:errors cssClass="alert-danger" path="email"/>
                                                                </div>
                                                            </spring:bind>
                                                        </div>
                                                        <div class="col">
                                                            <spring:bind path="contactNumber">
                                                                <div class="form-group">
                                                                    <label>Contact number <sup>*</sup></label>
                                                                    <form:input class="form-control mb-2 "
                                                                                name="contactNumber"
                                                                                placeholder="+94xxxxxxxxx" type="text"
                                                                                path="contactNumber"/>
                                                                    <form:errors cssClass="alert-danger"
                                                                                 path="contactNumber"
                                                                                 pattern="\d{9}"
                                                                    />
                                                                </div>
                                                            </spring:bind>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <spring:bind path="address">
                                                                <div class="form-group">
                                                                    <label>Address <sup>*</sup></label>
                                                                    <form:textarea class="form-control mb-3"
                                                                                   name="address" cols="30" rows=""
                                                                                   path="address"/>
                                                                    <form:errors cssClass="alert-danger"
                                                                                 path="address"/>
                                                                </div>
                                                            </spring:bind>
                                                        </div>
                                                        <div class="col"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Save Changes</button>
                                                </div>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>