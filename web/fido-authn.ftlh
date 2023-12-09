<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${webCtx.contextPath}/servlet/favicon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="${webCtx.contextPath}/auth/fido2/js/base64js.js">
    </script>
    <script src="${webCtx.contextPath}/auth/fido2/js/base64url.js">
    </script>
    <script src="${webCtx.contextPath}/auth/fido2/js/webauthn.js">
    </script>
    <style>
        #logo {
            max-height: 3rem;
            margin: 0.5rem;
        }
    </style>
</head>
<body>
<script>
    function setStatus(statusText) {
        document.getElementById("status").textContent = statusText
    }

    function setError(msg) {
        document.getElementById("alertContent").textContent = msg
        document.getElementById("alertMessage").style.display = "block"
    }

    function startAssertion() {
        let request = ${assertion?no_esc}

        webauthn.getAssertion(request)
            .then(data => {
                setStatus("Please wait...");
                document.getElementById("tokenResponse").value = JSON.stringify(webauthn.responseToObject(data))
                document.forms[0].submit()
            })
            .catch(err => {
                let name = err.name
                setStatus("")
                let message = ""

                if (name === "NotAllowedError") {
                    //Credential not recognized.
                    message = "Please use a fido credential already associated to your account"
                } else if (name === "AbortError") {
                    message = "Operation was cancelled"
                } else {
                    message = "An error occurred"

                    if (err.message) {
                        console.log(err.message)
                    } else if (err.messages) {
                        console.log(err.messages)
                    }
                }
                console.log(name)
                setError(message)
                document.getElementById("retry").style.display = "block"
            })
    }
</script>
<div class="d-flex flex-column align-items-center justify-content-between min-vh-100 w-100">
    <header class="d-flex w-100 justify-content-between border-bottom">
        <img id="logo"
             src="https://gluu.org/wp-content/uploads/2021/02/janssen-project-transparent-630px-182px-300x86.png"/>
    </header>

    <div class="row col-sm-10 col-md-8 col-lg-6 my-5">
        <div class="border border-1 rounded p-5 mb-3">
            <p class="fs-4 mb-5">Insert and activate your security key</p>
            <div align="center" class="mb-5">
                <img class="pe-5" src="${webCtx.contextPath}/img/step_ver.png">
            </div>
            <div align="center" class="link-secondary mb-3" id="status"></div>
            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="alertMessage"
                 style="display: none">
                <span id="alertContent"></span>
            </div>
            <div align="center">
                <a href="javascript:startAssertion()" class="btn btn-success px-4">Use security key</a>
            </div>
            <form method="post" enctype="application/x-www-form-urlencoded">
                <input type="hidden" id="tokenResponse" name="tokenResponse">
            </form>
        </div>
    </div>
    <footer class="d-flex flex-column align-items-center w-100 pb-2">
        <hr class="w-100">
    </footer>
</div>
</body>
</html>

