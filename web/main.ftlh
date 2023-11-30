<#import "commons.ftlh" as com>
<@com.main>
    <script>
        window.onload = () => {
            document.getElementById("btnAlertClose").onclick = () => {
                document.getElementById("alertMessage").style.display = "none";
            }
        }
    </script>

    <div class="border border-1 rounded p-5">
        <p class="fs-4 mb-5">Welcome to Agama SecurityKey</p>

        <div class="alert alert-danger alert-dismissible fade show" role="alert" id="alertMessage" style="display: ${success?string('none', 'block')}">
            <span id="alertContent">Invalid username!</span>
            <button id="btnAlertClose" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
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

</@com.main>
