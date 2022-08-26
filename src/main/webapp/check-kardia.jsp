<%@include file="side-bar.jsp" %>

<div class="flex-shrink-0">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                <h5 class="font-weight-bold mt-1 mb-1">Check KARDIA</h5>
            </div>
        </div>
        <br/>
        <div class="col">
            <div class="row">
                <div class="col mb-3">
                    <div class="card">
                        <div class="card-body">
                            <!-- success -->
                            <div id="success-message-block" style="width: 100%;margin: auto;display: ${message != null ? "block" : "none"}">
                                <br/>
                                <div class="alert alert-success" role="alert" id="success-message-block-msg">${message}</div>
                            </div>

                            <!-- error -->
                            <div id="failed-message-block" style="width: 100%;margin: auto;display: ${error != null ? "block" : "none"}">
                                <br/>
                                <div class="alert alert-danger" role="alert" id="failed-message-block-msg">${error}</div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                                <div class="form-group">
                                                    <label>Age <sup>*</sup></label>
                                                    <input class="form-control mb-2" id="Age" name="Age" type="number"
                                                           placeholder="Age"/>

                                                    <span class="alert-danger" hidden id="AgeError">Required this field</span>
                                                </div>
                                        </div>
                                        <div class="col">
                                                <div class="form-group">
                                                    <label>Ejection Fraction <sup>*</sup></label>
                                                    <input class="form-control mb-2" id="EF" name="EF" type="number"
                                                           placeholder="Ejection Fraction"/>

                                                    <span class="alert-danger" hidden id="EFError">Required this field</span>
                                                </div>
                                        </div>
                                        <div class="col">
                                                <div class="form-group">
                                                    <label>Creatinine <sup>*</sup></label>
                                                    <input class="form-control mb-2" id="Creatinine" name="Creatinine" type="number"
                                                            placeholder="Creatinine" step="0.01"/>

                                                    <span class="alert-danger" hidden id="CreatinineError">Required this field</span>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="row">
                                    <div class="col d-flex justify-content-end">
                                        <div hidden disabled id="paypal-button-container"></div>
                                        <button class="btn btn-primary" id="predictionBtn" onclick="validate()">Prediction</button>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://www.paypal.com/sdk/js?client-id=AdIsu0jxBif-67wNoL0xXUutWY4dsoVU0FVUZDelmm6Dr2YX3Ok48AVjJWta89f9BrJd2be0lGoPBu1e&components=buttons"></script>
<script>




    function validate() {
        let error = false;
        const Age = document.getElementById("Age").value;
        const EF = document.getElementById("EF").value;
        const Creatinine = document.getElementById("Creatinine").value;

        if(Age === "") {
            document.getElementById("paypal-button-container").disable = true;
            document.getElementById("AgeError").hidden = false;
            error = true;
        }else {
            document.getElementById("AgeError").hidden = true;
        }

        if(EF === "") {
            document.getElementById("paypal-button-container").disable = true;
            document.getElementById("EFError").hidden = false;
            error = true;
        }else {
            document.getElementById("EFError").hidden = true;
        }

        if(Creatinine === "") {
            document.getElementById("paypal-button-container").disable = true;
            document.getElementById("CreatinineError").hidden = false;
            error = true;
        }else {
            document.getElementById("CreatinineError").hidden = true;
        }

        if(!error){
            document.getElementById("predictionBtn").hidden = true;
            document.getElementById("paypal-button-container").disable = false;
            document.getElementById("paypal-button-container").hidden = false;
        }
    }

    paypal.Buttons({
        style: {
            layout: 'vertical',
            color: 'blue',
            shape: 'rect',
            label: 'paypal'
        },

        createOrder: function (data, actions) {
            // This function sets up the details of the transaction, including the amount and line item details.
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: 10
                    }
                }]
            });
        },

        onApprove: function (data, actions) {
            // This function captures the funds from the transaction.
            return actions.order.capture().then(function (details) {
                console.log("ID ", details.id);
                const age = document.getElementById("Age").value;
                const ef = document.getElementById("EF").value;
                const creatinine = document.getElementById("Creatinine").value;
               const predictionInput = {
                    "Age": Number(age),
                    "EF": Number(ef),
                    "Creatinine": Number(creatinine)
                };
               console.log(predictionInput);
                const uri = "http://localhost:8080/api/check-kardia?Age=" + Number(age) + "&EF=" + Number(ef)
                    +"&Creatinine=" + Number(creatinine);
                const navigateUriSuccess = "http://localhost:8080/success";
                const navigateUriFailed = "http://localhost:8080/failed";
                // This function shows a transaction success message to your buyer.
                fetch(uri, {
                    method: "GET"
                }).then(response => {
                    console.log("INFO: " + JSON.stringify(response))
                    $.toaster({ message : "Prediction Success. We have send an email to you!" });
                    location.href = "/dashboard";
                    window.open(
                        navigateUriSuccess,
                        '_blank'
                    );
                }).catch(error => {
                    $.toaster({ message : "Failed to predict. Something went wrong!" });
                    location.href = "/dashboard";
                    window.open(
                        navigateUriFailed,
                        '_blank'
                    );
                })
            });
        }
    }).render('#paypal-button-container');
</script>
<%@include file="footer.jsp" %>