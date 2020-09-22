<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>TestDemo</title>

  <!-- Global stylesheets -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet"
        type="text/css">
  <link href="global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
  <link href="assets/css/layout.min.css" rel="stylesheet" type="text/css">
  <link href="assets/css/components.min.css" rel="stylesheet" type="text/css">
  <link href="assets/css/colors.min.css" rel="stylesheet" type="text/css">
  <link href="" rel="stylesheet" type="text/css">
  <!-- /global stylesheets -->

  <!-- Core JS files -->
  <script src="global_assets/js/main/jquery.min.js"></script>
  <script src="global_assets/js/main/bootstrap.bundle.min.js"></script>
  <script src="global_assets/js/plugins/loaders/blockui.min.js"></script>

  <script src="global_assets/js/plugins/notifications/jgrowl.min.js"></script>
  <script src="global_assets/js/plugins/notifications/noty.min.js"></script>
  <script src="global_assets/js/demo_pages/extra_jgrowl_noty.js"></script>
  <!-- /core JS files -->

  <!-- Theme JS files -->
  <script src="assets/js/app.js"></script>

  <script src="global_assets/js/plugins/notifications/jgrowl.min.js"></script>
  <script src="global_assets/js/plugins/notifications/noty.min.js"></script>

  <script src="global_assets/js/demo_pages/extra_jgrowl_noty.js"></script>

</head>


<%
  String statusLogin = (String) request.getParameter("status");

  if (statusLogin != null) {
    if (statusLogin.equals("logout")) {
      session.removeAttribute("userData");
      session.invalidate();
    }
  }

%>

<script>

  $(document).ready(function () {
    <%if (statusLogin != null && statusLogin.equals("failed")) {
    %>
    new Noty({
      layout: 'bottomCenter',
      text: 'User Name or Password Error',
      type: 'error'
    }).show();

    <%}else if(statusLogin != null && statusLogin.equals("servererror")){

        %>

    new Noty({
      layout: 'bottomCenter',
      text: 'Server Error Please Come Back later',
      type: 'error'
    }).show();
    <%
    }%>
    window.history.replaceState(null, null, window.location.pathname);
  });


</script>


<body>

<button type="button" class="btn btn-light" id="noty_solid_login_failed" style="display: none;">Login failed<i
        class="icon-play3 ml-2"></i></button>
<!-- Page content -->
<div class="page-content">

  <!-- Main content -->
  <div class="content-wrapper">

    <!-- Content area -->
    <div class="content d-flex justify-content-center align-items-center">

      <!-- Login form -->
      <form action="LoginController.jsp" class="login-form" method="post">
        <div class="card mb-0">
          <div class="card-body">

            <div class="text-center mb-3">
              <img width="90%%" src="assets/images/mydemologo1.png">
              <%--<img src="global_assets/images/logomobi.png" style="height: 10vh;">--%>

              <h5 class="mb-0">Login to your account</h5>
              <span class="d-block text-muted">Enter your credentials below</span>
            </div>


            <div class="form-group form-group-feedback form-group-feedback-left">
              <input type="text" class="form-control" name="username" placeholder="Username">
              <div class="form-control-feedback">
                <i class="icon-user text-muted"></i>
              </div>
            </div>

            <div class="form-group form-group-feedback form-group-feedback-left">
              <input type="password" class="form-control" name="password" placeholder="Password">
              <div class="form-control-feedback">
                <i class="icon-lock2 text-muted"></i>
              </div>
            </div>

            <input type="hidden" name="action" value="login">

            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-block">Sign in <i
                      class="icon-circle-right2 ml-2"></i></button>
            </div>


          </div>
        </div>

      </form>
      <!-- /login form -->


    </div>
    <!-- /content area -->


  </div>
  <!-- /main content -->

</div>
<!-- /page content -->

<script>
  document.addEventListener('DOMContentLoaded', function () {
    NotyJgrowl.init();
  });


</script>
</body>


</html>
