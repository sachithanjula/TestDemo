<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Rupavahini</title>

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet"
          type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="assets/js/sweetalert2.all.min.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" type="text/css">

    <link href="global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/layout.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/components.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/colors.min.css" rel="stylesheet" type="text/css">
    <link href="global_assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->

    <!-- Core JS files -->
    <script src="global_assets/js/main/jquery.min.js"></script>
    <script src="global_assets/js/main/bootstrap.bundle.min.js"></script>
    <script src="global_assets/js/plugins/loaders/blockui.min.js"></script>
    <!-- /core JS files -->

    <!--        local style sheet-->
    <link href="assets/css/dashboardadmin.css" rel="stylesheet" type="text/css">
    <!--        local style sheet-->

    <!-- /theme JS files -->
    <script src="global_assets/js/plugins/ui/perfect_scrollbar.min.js"></script>
    <script src="global_assets/js/demo_pages/layout_fixed_sidebar_custom.js"></script>
    <!-- /theme JS files -->
</head>

<style>
    .icon {
        padding: 13px;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        border-radius: 50%;
        -moz-box-shadow: 0px 0px 2px #888;
        -webkit-box-shadow: 0px 0px 2px #888;

    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        /* display: none; <- Crashes Chrome on hover */
        -webkit-appearance: none;
        margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
    }

    input[type=number] {
        -moz-appearance: textfield; /* Firefox */
    }

    #newWhatsappMsg, #newViberMsg, #newSmsMsg, #newTelegramMsg {
        /*            width:100%;*/
        width: 120px;
        text-align: center;
    }
</style>

<%

    String name = (String) session.getAttribute("user");


    if (name == "" || name == null) {
        response.sendRedirect("index.jsp");
        return;
    } else {
        session.setAttribute("user", name);
    }


%>


<body>

<div class="navbar navbar-expand-md navbar-dark">
    <div class="navbar">
        <div class="logoHolder horizontalCenter" style=" margin-left: -20px;">
            <img src="pictures/hutch_mm.png" style="height: 20px">
        </div>
    </div>

    <div class="d-md-none">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
            <i class="icon-tree5"></i>
        </button>
        <button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
            <i class="icon-paragraph-justify3"></i>
        </button>
    </div>

    <div class="collapse navbar-collapse" id="navbar-mobile">

        <span class=" ml-md-3 mr-md-auto"></span>

        <ul class="navbar-nav">

            <li class="nav-item dropdown dropdown-user">
                <a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
                    <img src="global_assets/images/placeholders/box.jpg" class="rounded-circle mr-2" height="34" alt="">
                    <span><%=name.toUpperCase()%></span>
                </a>

                <div class="dropdown-menu dropdown-menu-right">
                    <a href="index.jsp?status=logout" class="dropdown-item"><i class="icon-switch2"></i> Logout</a>
                </div>
            </li>
        </ul>
    </div>
</div>
<!-- /main navbar -->


<!-- Page content -->
<div class="page-content">

    <!-- Main content -->
    <div class="content-wrapper">

        <!-- Page header -->
        <div class="page-header page-header-light">

            <div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
                <div class="d-flex">
                    <div class="breadcrumb">
                        <a href="" class="breadcrumb-item"><i class="icon-home2 mr-2"></i>Home</a>
                        <span class="breadcrumb-item active">Content</span>
                    </div>
                </div>


            </div>
        </div>
        <!-- /page header -->


        <!-- Content area -->
        <div class="content">


            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body bg-blue text-center card-img-top"
                                     style="background-size: contain; background-color: darkred;">


                                    <h6 class="font-weight-semibold mb-0">Add Promos Contents</h6>

                                </div>

                                <div class="card-body border-top-0">

                                    <form action="savecontroller.jsp" method = "POST" enctype="multipart/form-data">


                                        <div class="form-group row">
                                            <div class="col-sm-12">
                                                <label>Content</label>
                                                <input type="text" class="form-control" name="type" >
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-12">
                                                <label>Message Type</label>
                                                <select name="msgtype" class="form-control" >

                                                    <option selected value="imgntxt"> Imagewith Text</option>
                                                    <option  value="txt">Text</option>
                                                    <option  value="img">Image</option>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-12">
                                                <label>Image</label>
                                                <input type="file" class="form-control h-auto" name="file" >
                                            </div>
                                        </div>


                                        <div class="form-group row">
                                            <div class="col-sm-12">
                                                <label>Content</label>
                                                <input type="text" class="form-control" name="content" >
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-12">
                                                <label>Link</label>
                                                <input type="text" class="form-control" name="link" >
                                            </div>
                                        </div>





                                        <input type="hidden" value="save" name="action">
                                        <input type="hidden" value="1111" name="refi">

                                        <button class="btn btn-danger" type="submit">Create</button>

                                    </form>



                                </div>
                            </div>
                        </div>

                    </div>


                </div>
            </div>


        </div>
        <!-- /content area -->

        <!-- Footer -->
        <div class="navbar navbar-expand-lg navbar-light">
            <div class="text-center d-lg-none w-100">
                <button type="button" class="navbar-toggler dropdown-toggle" data-toggle="collapse"
                        data-target="#navbar-footer">
                    <i class="icon-unfold mr-2"></i>
                    Footer
                </button>
            </div>

            <div class="navbar-collapse collapse" id="navbar-footer">
                        <span class="navbar-text">
                            &copy; 2020 <a href="#" style="color: inherit;">Mobios Private Limited</a>
                        </span>




            </div>


        </div>
        <!-- /footer -->

    </div>
    <!-- /main content -->

</div>


<script src="assets/js/dashboardadmin.js"></script>
<!--        script of this page-->

<!-- Theme JS files -->
<script src="global_assets/js/plugins/visualization/d3/d3.min.js"></script>
<script src="global_assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
<script src="global_assets/js/plugins/forms/styling/switchery.min.js"></script>
<script src="global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
<script src="global_assets/js/plugins/ui/moment/moment.min.js"></script>
<script src="global_assets/js/plugins/pickers/daterangepicker.js"></script>

<script src="assets/js/app.js"></script>
<script src="global_assets/js/demo_pages/dashboard.js"></script>
<script src="global_assets/js/demo_pages/widgets_stats.js"></script>
<script src="global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>
<script src="global_assets/js/demo_pages/charts/echarts/columns_waterfalls.js"></script>
<!--        <script src="global_assets/js/demo_pages/charts/echarts/pies_donuts.js"></script>-->
<!-- /theme JS files -->

</body>

<%


    String saved = "" + request.getParameter("saved");
    System.out.println(name);


    if (saved.equals("yes")) {
%>
<script>
    Swal.fire('Successfully Save');
    setTimeout(function() {
        window.location.href = "https://viber.textware.lk/RupavahiniBot/CreateContent.jsp";
    }, 2000);

</script>
<%
    }
%>
</html>