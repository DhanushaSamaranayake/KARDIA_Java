<%@include file="side-bar.jsp" %>

<div class="flex-shrink-0">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                <h5 class="font-weight-bold mt-1 mb-1">Home</h5>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col">
                <div class="card">
                    <div class="card-body p-2">
                        <div class="table-responsive border-0 p-0 shadow-none">
                            <table class="table table-borderless">
                                <thead>
                                <tr>
                                    <th class="width: 20%">Date Time</th>
                                    <th class="width: 10%">Age</th>
                                    <th class="width: 20%">Ejection Fraction</th>
                                    <th class="width: 20%">Creatinine</th>
                                    <th class="width: 20%">Prediction</th>
                                    <th class="width: 10%">Has a risk ?</th>
                                </tr>
                                </thead>
                                <tbody>
                                <jsp:useBean id="predictions" scope="request" type="java.util.List"/>
                                <c:forEach items="${predictions}" var="item">
                                    <tr>
                                        <td><span class="responsive-mobile-heading">Date Time</span>${item.date}</td>
                                        <td><span class="responsive-mobile-heading">Age</span>${item.age}</td>
                                        <td><span class="responsive-mobile-heading">Ejection Fraction</span>${item.ejectionFraction}</td>
                                        <td><span class="responsive-mobile-heading">Creatinine</span>${item.creatinine}</td>
                                        <td><span class="responsive-mobile-heading">Prediction</span>${item.predictedScore}</td>
                                        <td><span class="responsive-mobile-heading">Has a risk</span>${item.hasRisk}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>