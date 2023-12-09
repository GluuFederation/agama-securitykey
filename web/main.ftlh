<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${webCtx.contextPath}/servlet/favicon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        #logo {
            max-height: 3rem;
            margin: 0.5rem;
        }
    </style>
</head>
<body>
<script>
    window.onload = () => {
        document.getElementById("btnAlertClose").onclick = () => {
            document.getElementById("alertMessage").style.display = "none";
        }
    }
</script>
<div class="d-flex flex-column align-items-center justify-content-between min-vh-100 w-100">
    <header class="d-flex w-100 justify-content-between border-bottom">
        <img id="logo"
             src="https://gluu.org/wp-content/uploads/2021/02/janssen-project-transparent-630px-182px-300x86.png"/>
    </header>

    <div class="row col-sm-10 col-md-8 col-lg-6 my-5">
        <div class="border border-1 rounded p-5">
            <p class="fs-4 mb-5">Welcome to Agama SecurityKey</p>

            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="alertMessage"
                 style="display: ${success?string('none', 'block')}">
                <span id="alertContent">Invalid username!</span>
                <button id="btnAlertClose" type="button" class="btn-close" data-bs-dismiss="alert"
                        aria-label="Close"></button>
            </div>

            <form method="post" enctype="application/x-www-form-urlencoded">
                <div class="mb-3 row">
                    <label for="username" class="col-md-4 col-form-label">Enter your username</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="username" id="username"
                               placeHolder="username" value="${username!}" required autofocus>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 d-flex justify-content-end">
                        <input type="submit" class="btn btn-success px-4" value="Login" name="loginBtn">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <footer class="d-flex flex-column align-items-center w-100 pb-2">
        <hr class="w-100">
    </footer>
</div>
</body>
</html>
