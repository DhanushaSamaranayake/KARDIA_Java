<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/chosen.jquery.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/jquery.toaster.js"></script>
<script>
    function checkFile(event) {
        if(event.files.length>0) {
            document.getElementById("uploadBtn").disabled = false;
            document.getElementById("selected-file-name").innerText = event.files[0].name;
        } else {
            document.getElementById("uploadBtn").disabled = true
            document.getElementById("selected-file-name").innerText = "Choose file";
        }
    }
</script>
</body>
</html>