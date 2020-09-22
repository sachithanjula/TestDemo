<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.lang3.RandomStringUtils" %>
<%@ page import="java.util.Date" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TestDemo</title>
    <!-- Global stylesheets -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


    <script src="global_assets/js/plugins/notifications/sweet_alert.min.js"></script>
    <script src="global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="global_assets/js/plugins/forms/styling/uniform.min.js"></script>
    <script src="global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
    <script src="global_assets/js/demo_pages/extra_sweetalert.js"></script>


    <link href="assets/css/loading.css" rel="stylesheet" type="text/css">

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet"
          type="text/css">
    <link href="global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
<%--    <link href="assets/css/theme.css" rel="stylesheet" type="text/css">--%>
    <link href="assets/css/layout.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/components.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/colors.min.css" rel="stylesheet" type="text/css">
    <link href="global_assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
    <!--        cropper styles-->
    <link rel="stylesheet" href="assets/css/cropper.css">
    <link rel="stylesheet" href="assets/css/main.css" >
    <link type="text/css" href="assets/css/trans.css" rel="stylesheet"/>
    <!--        cropper styles-->
    <!-- /global stylesheets -->
    <!-- Core JS files -->
    <script src="global_assets/js/main/jquery.min.js"></script>
    <script src="global_assets/js/main/bootstrap.bundle.min.js"></script>
    <script src="global_assets/js/plugins/loaders/blockui.min.js"></script>
    <!-- /core JS files -->
    <!-- Theme JS files -->
    <script src="assets/js/app.js"></script>
    <script src="global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="global_assets/js/plugins/forms/styling/uniform.min.js"></script>
    <script src="global_assets/js/plugins/forms/inputs/inputmask.js"></script>
    <script src="global_assets/js/plugins/forms/validation/validate.min.js"></script>
    <script src="global_assets/js/plugins/extensions/cookie.js"></script>
    <script src="global_assets/js/plugins/visualization/d3/d3.min.js"></script>
    <script src="global_assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
    <script src="global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
    <script src="global_assets/js/plugins/ui/moment/moment.min.js"></script>
    <script src="global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
    <script src="global_assets/js/plugins/notifications/jgrowl.min.js"></script>
    <script src="global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>
    <script src="global_assets/js/plugins/pagination/bs_pagination.min.js"></script>
    <script src="global_assets/js/plugins/forms/wizards/steps.min.js"></script>
    <script src="global_assets/js/plugins/forms/styling/switchery.min.js"></script>
    <script src="global_assets/js/plugins/uploaders/fileinput/plugins/purify.min.js"></script>
    <script src="global_assets/js/plugins/uploaders/fileinput/plugins/sortable.min.js"></script>
    <script src="global_assets/js/plugins/uploaders/fileinput/fileinput.min.js"></script>
    <script src="global_assets/js/plugins/uploaders/plupload/plupload.full.min.js"></script>
    <script src="global_assets/js/plugins/uploaders/plupload/plupload.queue.min.js"></script>
    <script src="global_assets/js/plugins/extensions/jquery_ui/interactions.min.js"></script>

    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>--%>

    <script src="global_assets/js/demo_pages/form_select2.js"></script>
    <script src="global_assets/js/demo_pages/uploader_bootstrap.js"></script>
    <script src="global_assets/js/demo_pages/uploader_plupload.js"></script>
    <script src="global_assets/js/demo_pages/dashboard.js"></script>
    <script src="global_assets/js/demo_pages/datatables_basic.js"></script>
    <script src="global_assets/js/demo_pages/widgets_stats.js"></script>
    <script src="global_assets/js/demo_pages/form_checkboxes_radios.js"></script>
    <script src="assets/js/form_wizard.js"></script>
    <script src="global_assets/js/demo_pages/charts/echarts/bars_tornados.js"></script>
    <script src="global_assets/js/demo_pages/charts/echarts/pies_donuts.js"></script>
    <script src="global_assets/js/demo_pages/charts/echarts/columns_waterfalls.js"></script>
    <script src="global_assets/js/demo_pages/components_pagination.js"></script>
    <script src="global_assets/js/demo_pages/picker_date.js"></script>
    <script src="assets/js/angular.min.js"></script>
    <!-- Theme JS files -->
    <script src="global_assets/js/demo_pages/uploader_plupload.js"></script>
    <script src="global_assets/js/demo_pages/form_inputs.js"></script>
    <script src="global_assets/js/demo_pages/form_input_groups.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">

    <script src="global_assets/js/plugins/ui/perfect_scrollbar.min.js"></script>
    <script src="global_assets/js/demo_pages/layout_fixed_sidebar_custom.js"></script>

    <script src="assets/js/cropper.js"></script>
    <script src="js/main.js"></script>
    <style>

        #btn_view, #btn_down {
            height: 20px;
            width: 20px;
        }

        /* view list button icon */
        .icon-file-text3, .icon-download7 {
            top: -8px;
            left: -8px;
            font-weight: 100;
            font-size: 1rem;
        }

        .icon-file-text3 {
            color: navy;
        }

        .icon-download7 {
            color: maroon;
        }

        #divPicIcons .btn-light {
            width: 90%;
            min-height: 76%;
        }

        #divPicIcons .form-check-label {
            height: 23%;
            width: 90%;
            text-align: center;
            margin-top: 5px;
            font-weight: semibold;
        }

        .msdbody {
            border: thin;
            border-radius: 5px;
            border-style: solid;
            border-color: grey;
            margin-left: -15px;
            margin-right: 20px;
        }

        .previewBtn {
            height: 20px;
            width: 100%;
            margin-bottom: 5px;
            padding: 0px;
        }

        /* single sms campName and senderName css */
        #campNameTag {
            margin-bottom: 20px;
            margin-top: 5px;
            margin-left: 6px
        }

        #senderNameTag {
            margin-bottom: 20px;
        }

        /* single sms campName and senderName css */

        #sinhalabtn {
            text-align: center;
            background-color: #00bcd4;
        }

        #tamilbtn {
            text-align: center;
            background-color: #00bcd4;
        }

        #englishbtn {
            text-align: center;
            background-color: #48fc28;
        }

        #sinhalabtns {
            text-align: center;
            background-color: #00bcd4;
        }

        #tamilbtns {
            text-align: center;
            background-color: #00bcd4;
        }

        #englishbtns {
            text-align: center;
            background-color: #48fc28;
        }

        #charCount, #charCountN {
            font-size: 11px;
            text-align: right;
            margin-right: 10px;
            margin-top: 10px;
        }

        #browserInsertButton {
            width: 83px;
            margin-left: 107px;
            height: 33px;
            margin-top: 5px;
            margin-bottom: 9px;
        }


    </style>

    <style>


        #btn_view, #btn_down {
            height: 20px;
            width: 20px;
        }

        #btn_views, #btn_downs {
            height: 20px;
            width: 20px;
        }


        /* view list button icon */
        .icon-file-text3, .icon-download7 {
            top: -8px;
            left: -8px;
            font-weight: 100;
            font-size: 1rem;
        }

        .icon-file-text3 {
            color: navy;
        }

        .icon-download7 {
            color: maroon;
        }

        #divPicIcons .btn-light {
            width: 90%;
            height: 76%;
        }

        /* icon labels for selecting message type(button)  */
        #divPicIcons .form-check-label {
            height: 23%;
            width: 90%;
            text-align: center;
            margin-top: 5px;
            font-weight: semibold;
        }

        /* icons for selecting message type(button) #btnImageButton, */
        #bsmst, #bsmsp {
            display: block;
            height: 100px;
            width: 90px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            z-index: 1;
        }

        #tsmsp, #tsmst, #ssmst, #ssmsp {
            display: block;
            height: 80%;
            width: 80%;
            display: block;
            margin: auto;
        }


    </style>

    <style>
        .image-previewer {
            height: 100px;
            width: 100px;
            display: flex;
            border-radius: 10px;
            border: 1px solid lightgrey;
        }

        .mar {
            margin: 5px;
        }
    </style>

</head>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String messageType = "viber";


%>


<%! String messageType = "";
    String default_img_path = "assets/images/gray/";
    String selected_img_path = "assets/images/viber/";

    public String getFormatNumber(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("##,##0.00");
        return decimalFormat.format(number);
    }

%>

<%
    messageType = "" + request.getParameter("type");

    DateFormat dateFormat = new SimpleDateFormat("HH:mm a");
    Date date = new Date();

    String currentTime = dateFormat.format(date);
%>


<%

    String name = (String) session.getAttribute("user");

    name = "TestDemo";

    if (name == "" || name == null) {
        response.sendRedirect("index.jsp");
        return;
    } else {
        session.setAttribute("user", name);
    }


%>

<style>
    /* The device with borders */
    .smartphone {
        position: relative;
        width: 255px;
        height: 480px;
        margin: auto;
        border: 16px black solid;
        border-top-width: 60px;
        border-bottom-width: 60px;
        border-radius: 36px;
    }

    @media screen and (max-width: 430px) {
        .smartphone {
            width: 225px;
            height: 380px;
        }

    }

    /* The horizontal line on the top of the device */
    .smartphone:before {
        content: '';
        display: block;
        width: 60px;
        height: 5px;
        position: absolute;
        top: -30px;
        left: 50%;
        transform: translate(-50%, -50%);
        background: #333;
        border-radius: 10px;
    }

    /* The circle on the bottom of the device */
    .smartphone:after {
        content: '';
        display: block;
        width: 35px;
        height: 35px;
        position: absolute;
        left: 50%;
        bottom: -65px;
        transform: translate(-50%, -50%);
        background: #333;
        border-radius: 50%;
    }

    /* The screen (or content) of the device */
    .smartphone .content {
        width: 100%;
        height: 100%;
        background: white;
    }

    .phoneheader {
        background-color: lightgrey;
        width: 100%;
        height: 30px;
    }

    #btn_view, #btn_down {
        height: 20px;
        width: 20px;
    }

    /* view list button icon */
    .icon-file-text3, .icon-download7 {
        top: -8px;
        left: -8px;
        font-weight: 100;
        font-size: 1rem;
    }

    .icon-file-text3 {
        color: navy;
    }

    .icon-download7 {
        color: maroon;
    }

    #divPicIcons .btn-light {
        width: 90%;
        height: 76%;
    }

    /* icon labels for selecting message type(button)  */
    #divPicIcons .form-check-label {
        height: 23%;
        width: 90%;
        text-align: center;
        margin-top: 5px;
        font-weight: semibold;
    }

    /* icons for selecting message type(button) #btnImageButton, */
    #btnTextonly, #btnImageonly, #btnTextImage, #btnTextButton, #btnTextImageButton {
        display: block;
        height: 140px;
        width: 98px;
        display: block;
        margin-left: auto;
        margin-right: auto;
        z-index: 1;
    }

    .msdbody {
        border: thin;
        border-radius: 5px;
        border-style: solid;
        border-color: grey;
        margin-left: -15px;
        margin-right: 20px;
    }

    .previewBtn {
        height: 20px;
        width: 100%;
        margin-bottom: 5px;
        padding: 0px;
    }

    .messageTypeOption {
        text-align: center;
        width: 150px;
        padding: 5px;
        margin: 1.1px;
    }

    @media (min-width: 576px) {
        .media-chat-item {
            position: relative;
            width: auto;
            display: inline-block;
            color: #333;
            border-radius: 20px;
        }

        .media-chat-item:not([class*=bg-]) {
            background-color: #ADD8E6;
            border-color: #eee;
        }

        .media-chat-item:before {
            content: '';
            position: absolute;
            margin-left: 0;
            border-top: 5px solid transparent;
            border-right: 5px solid;
            border-right-color: inherit;
            border-bottom: 5px solid transparent;
        }

        .media-chat-item-reverse .media-chat-item:before {
            left: auto;
            border-right: 0;
            border-left: 5px solid;
            border-left-color: inherit;
        }

        .media-chat-item-reverse .media-chat-item {
            text-align: left;
            color: #fff;
        }

        .media-chat-item-reverse .media-chat-item:not([class*=bg-]) {
            background-color: #ADD8E6;
            border-color: #ADD8E6;
        }

        .media-chat-item-reverse .media-body {
            text-align: right;
        }

        .media-chat-inverse .media-chat-item {
            color: #fff;
        }

        .media-chat-inverse .media-chat-item:not([class*=bg-]) {
            background-color: #ADD8E6;
            border-color: #ADD8E6;
        }

        .media-chat-inverse .media-chat-item-reverse .media-chat-item {
            color: #333;
        }

        .media-chat-inverse .media-chat-item-reverse .media-chat-item:not([class*=bg-]) {
            background-color: #ADD8E6;
            border-color: #eee;
        }
    }


</style>


<body ng-app="" class="sidebar-xs">


<!-- Main navbar -->
<div class="navbar navbar-expand-md navbar-dark">
    <div class="navbar">
        <div class="logoHolder horizontalCenter" style=" margin-left: -20px;">
            <img src="assets/images/md_logo.png" style="height: 56px; width: 35%">
        </div>
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

    <!-- Main sidebar -->
    <div class="sidebar sidebar-dark sidebar-main sidebar-expand-md sidebar-fixed">

        <!-- Sidebar mobile toggler -->
        <div class="sidebar-mobile-toggler text-center">


            <a href="#" class="sidebar-mobile-main-toggle">
                <i class="icon-arrow-left8"></i>
            </a>
            <div style="margin: 5px;margin-left: -15px;">


            </div>
            Navigation
            <a href="#" class="sidebar-mobile-expand">
                <i class="icon-screen-full"></i>
                <i class="icon-screen-normal"></i>
            </a>

        </div>
        <!-- /sidebar mobile toggler -->


        <!-- Sidebar content -->
        <div class="sidebar-content">

            <!-- User menu -->
            <div class="sidebar-user">
                <div class="card-body">
                    <div class="media">
                        <div class="mr-3">

                        </div>

                        <div class="media-body media-body-top" href="./userprofile.jsp"
                             style="text-decoration: none; color: inherit;">
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- /user menu -->


        <!-- Main navigation -->
        <div class="card card-sidebar-mobile">
            <ul class="nav nav-sidebar nav-sidebar-top" data-nav-type="accordion">

            </ul>
        </div>
        <!-- /main navigation -->

    </div>
    <!-- /sidebar content -->

</div>
<!-- /main sidebar -->


<!-- Main content -->
<div class="content-wrapper">

    <!-- Page header -->
    <div class="page-header page-header-light">

        <div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
            <div class="d-flex">
                <div class="breadcrumb">
                    <a href="index.html" class="breadcrumb-item"><i class="icon-home2 mr-2"></i> Home</a>
                    <a href="form_inputs.html" class="breadcrumb-item">Send Messages
                    </a>
                </div>
            </div>

        </div>
    </div>
    <!-- /page header -->

    <!-- Content area -->
    <div class="content">

        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header header-elements-inline" id="heading">
                        <h6 class="card-title" style="color:white; font-size:16px;">Viber Message</h6>
                        <i style="color:white;" id="messageIcon"></i>
                    </div>

                    <form action="savecontroller.jsp" method="POST">

                        <fieldset id="messageContent">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="card mx-auto" style="width:85.5%;">
                                        <div class="card-body">
                                            <div class="row" col-12>
                                                <div class="col-md-8 col-sm-12 col-xs-12">
                                                    <div class="card">
                                                        <div class="card-body">


                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label><b>Campaign Id</b></label>
                                                                    <input type="text" class="form-control" name="type">
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label>Message Type</label>
                                                                    <select name="msgtype" class="form-control"
                                                                            id="msgtype">

                                                                        <option selected value="imgntxt"> Image with
                                                                            Text
                                                                        </option>
                                                                        <option value="txt">Text</option>
                                                                        <option value="img">Image</option>
                                                                        <option value="video">Video</option>
                                                                        <option value="file">File</option>

                                                                    </select>
                                                                </div>
                                                            </div>


                                                            <div class="form-group" id="bodyDiv">

                                                                <label class="col-form-label">Message: <span
                                                                        class="text-danger">*</span></label>


                                                                <textarea rows="3" cols="3" class="form-control"
                                                                          maxlength="201"
                                                                          placeholder="Your Message Text"
                                                                          ng-model="msg" id="messageText"
                                                                          name="content"></textarea>
                                                                <span style="color: red" id="gropspan"></span>

                                                            </div>


                                                            <div class="form-group row" id="linkdiv">
                                                                <div class="col-sm-12">
                                                                    <label>Link</label>
                                                                    <input type="text" class="form-control" name="link">
                                                                </div>
                                                            </div>

                                                            <div id="imageDiv" style="margin-top: -15px;">
                                                                <label class="col-form-label">Upload
                                                                    Image:</label>

                                                                <div class="row">

                                                                    <div class="col-md-12">
                                                                        <!-- <h3>Demo:</h3> -->
                                                                        <div id="imgcon" class="img-container"
                                                                             style="background: white;">
                                                                            <img src="https://viber.textware.lk/image-icon-13.png"
                                                                                 alt=" ">
                                                                        </div>

                                                                        <div class="row" id="actions">
                                                                            <div class="col-md-12 docs-buttons"
                                                                                 style="text-align: center;">
                                                                                <div class="btn-group mar">
                                                                                    <button type="button"
                                                                                            class="btn btn-primary"
                                                                                            data-method="zoom"
                                                                                            data-option="0.1"
                                                                                            title="Zoom In">
                                                                                                    <span class="docs-tooltip"
                                                                                                          data-toggle="tooltip"
                                                                                                          title="Zoom In">
                                                                                                        <span class="fa fa-search-plus"></span>
                                                                                                    </span>
                                                                                    </button>
                                                                                    <button type="button"
                                                                                            class="btn btn-primary"
                                                                                            data-method="zoom"
                                                                                            data-option="-0.1"
                                                                                            title="Zoom Out">
                                                                                                    <span class="docs-tooltip"
                                                                                                          data-toggle="tooltip"
                                                                                                          title="Zoom Out">
                                                                                                        <span class="fa fa-search-minus"></span>
                                                                                                    </span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="btn-group mar">
                                                                                    <button type="button"
                                                                                            class="btn btn-primary"
                                                                                            data-method="rotate"
                                                                                            data-option="-45"
                                                                                            title="Rotate Left">
                                                                                                    <span class="docs-tooltip"
                                                                                                          data-toggle="tooltip"
                                                                                                          title="Rotate (-45)">
                                                                                                        <span class="fa fa-undo-alt"></span>
                                                                                                    </span>
                                                                                    </button>
                                                                                    <button type="button"
                                                                                            class="btn btn-primary"
                                                                                            data-method="rotate"
                                                                                            data-option="45"
                                                                                            title="Rotate Right">
                                                                                                    <span class="docs-tooltip"
                                                                                                          data-toggle="tooltip"
                                                                                                          title="Rotate (45)">
                                                                                                        <span class="fa fa-redo-alt"></span>
                                                                                                    </span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="btn-group mar">
                                                                                    <button type="button"
                                                                                            class="btn btn-primary"
                                                                                            data-method="scaleX"
                                                                                            data-option="-1"
                                                                                            title="Flip Horizontal">
                                                                                                    <span class="docs-tooltip"
                                                                                                          data-toggle="tooltip"
                                                                                                          title="Scale X (-1)">
                                                                                                        <span class="fa fa-arrows-alt-h"></span>
                                                                                                    </span>
                                                                                    </button>
                                                                                    <button type="button"
                                                                                            class="btn btn-primary"
                                                                                            data-method="scaleY"
                                                                                            data-option="-1"
                                                                                            title="Flip Vertical">
                                                                                                    <span class="docs-tooltip"
                                                                                                          data-toggle="tooltip"
                                                                                                          title="Scale Y (-1)">
                                                                                                        <span class="fa fa-arrows-alt-v"></span>
                                                                                                    </span>
                                                                                    </button>
                                                                                </div>

                                                                                <div class="btn-group mar">
                                                                                    <button type="button"
                                                                                            class="btn btn-primary"
                                                                                            data-method="crop"
                                                                                            title="Crop">
                                                                                                    <span class="docs-tooltip"
                                                                                                          data-toggle="tooltip"
                                                                                                          title="Crop">
                                                                                                        <span class="fa fa-check"></span>
                                                                                                    </span>
                                                                                    </button>
                                                                                    <button type="button"
                                                                                            class="btn btn-primary"
                                                                                            data-method="clear"
                                                                                            title="Clear">
                                                                                                    <span class="docs-tooltip"
                                                                                                          data-toggle="tooltip"
                                                                                                          title="Clear">
                                                                                                        <span class="fa fa-times"></span>
                                                                                                    </span>
                                                                                    </button>
                                                                                </div>

                                                                                <div class="btn-group mar">

                                                                                    <label class="btn btn-primary btn-upload"
                                                                                           for="inputImage"
                                                                                           title="Upload image file">
                                                                                        <input type="file"
                                                                                               class="sr-only"
                                                                                               id="inputImage"
                                                                                               name="file"
                                                                                               accept="image/*">
                                                                                        <span class="docs-tooltip"
                                                                                              data-toggle="tooltip"
                                                                                              title="Choose Image File">Select Image
                                                                                                    </span>
                                                                                    </label>

                                                                                </div>

                                                                            </div><!-- /.docs-buttons -->
                                                                            <div class="col-md-12 docs-toggles"
                                                                                 style="text-align: center">
                                                                                <!-- <h3>Toggles:</h3> -->
                                                                                <a class="btn btn-success btn-block"
                                                                                   data-toggle="tooltip"
                                                                                   onclick="uploadImage()"
                                                                                   style="color: white;"> Upload
                                                                                    Image</a>
                                                                                <label id="resultImgUpload"></label>
                                                                            </div><!-- /.docs-toggles -->

                                                                            <input type="hidden" value="save" name="action">
                                                                            <input type="hidden" value="1111" id="imgtagform" name="refid">
                                                                            <input type="hidden" value="" id="vidtag" name="vidtag">
                                                                            <input type="hidden" value="" id="duration" name="dur">
                                                                            <input type="hidden" value="" id="vsize" name="vsize">

                                                                            <input type="hidden" value="" id="fileTag" name="fileTag">
                                                                            <input type="hidden" value="" id="fileSize" name="fileSize">
                                                                            <input type="hidden" value="" id="fileName" name="fileName">


                                                                        </div>
                                                                    </div>

                                                                </div>

                                                            </div>

                                                            <div id="fileformDiv" style="text-align: center">

                                                                <div id="vidPreview" style="text-align: center">
                                                                    <video width="400" controls>
                                                                        <source src="mov_bbb.mp4" class="vid" id="video_here">
                                                                        Your browser does not support HTML5 video.
                                                                    </video>
                                                                </div>


                                                                <input id="fileform"
                                                                                         type="file" name="fileName"
                                                                                         accept="video/mp4"
                                                                                         class="form-control-uniform"
                                                                                         data-fouc>
                                                                <br>
                                                                <span style="color: #0b3251" >* Max video file size 26 MB and Max duration 180 seconds. Only MP4 and H264 are supported.</span>

                                                                <div class="col-md-12 docs-toggles"
                                                                     style="text-align: center">
                                                                    <!-- <h3>Toggles:</h3> -->
                                                                    <button class="btn btn-success btn-block"
                                                                       data-toggle="tooltip"
                                                                       id="btnFileSubmit"

                                                                       style="color: white;"> Upload
                                                                        Video</button>

                                                                </div>
                                                            </div>


                                                            <div id="fileDiv" style="text-align: center">

                                                                <div id="filePreview" style="text-align: center">

                                                                </div>


                                                                <input id="fileonly"
                                                                       type="file" name="fileName"
                                                                       class="form-control-uniform"
                                                                       data-fouc>
                                                                <br>
                                                                <span style="color: #0b3251" >* Max file size 50MB.</span>

                                                                <div class="col-md-12 docs-toggles"
                                                                     style="text-align: center">
                                                                    <!-- <h3>Toggles:</h3> -->
                                                                    <Button class="btn btn-success btn-block"
                                                                       data-toggle="tooltip"
                                                                       id="btnFileOnlySubmit"

                                                                       style="color: white;"> Upload
                                                                        File</Button>

                                                                </div>
                                                            </div>

                                                            <div style="text-align: center">
                                                                <button style="right: 0" class="btn btn-danger">SEND
                                                                </button>

                                                            </div>


                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-4 col-sm-12 col-xs-12">

                                                    <div class="smartphone">

                                                        <div style="height: 9.5%; background-color: lightgray;
                                                                         display: -webkit-flex;
                                                                         display: flex;
                                                                         -webkit-flex-wrap: wrap;
                                                                         flex-wrap: wrap;
                                                                         -webkit-align-content: center;
                                                                         align-content: center;" id='phoneHeader'>
                                                                <span id="lableSendId"
                                                                      style="margin-left: 10px; "></span>
                                                        </div>


                                                        <div style="height: 90%; max-width: 100%; padding: 10px; overflow-y: auto;">
                                                            <li class="media media-chat-item-reverse">
                                                                <div class="media-chat-item"
                                                                     style="width: 100%; height:100%;">

                                                                    <div id="angmsgtxt"
                                                                         style="color: black; max-height: 100%;">
                                                                        {{msg}}
                                                                    </div>

                                                                    <div class="docs-preview clearfix">
                                                                        <div id="preimg"
                                                                             class="img-preview preview-md"></div>
                                                                    </div>
                                                                    <div id="vidPre1">
                                                                        <video width="150" controls>
                                                                            <source src="mov_bbb.mp4" id="video_here1" >
                                                                            Your browser does not support HTML5 video.
                                                                        </video>
                                                                    </div>

                                                                    <div id="filePrev">
                                                                       <img width="120px" src="assets/images/fileicon.png">
                                                                    </div>

                                                                    <input type="button"
                                                                           class="btn bg-primary-400 previewBtn"
                                                                           value={{buttonText}}
                                                                           src={{buttonURl}} id="btnMsg"
                                                                           style="margin-top: 10px;">
                                                                    <div class="font-size-sm"
                                                                         style="text-align: right; color: white;"><%=currentTime%>
                                                                    </div>

                                                                </div>

                                                            </li>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </fieldset>

                    </form>

                </div>
            </div>
        </div>
        <div id="modal_default" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-teal-300" style="background: #8f5db7">
                        <h3 class="modal-title">View Number List</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;
                        </button>
                    </div>

                    <div class="modal-body" style="text-align: center">
                        <div class="row" style="text-align: center">
                            <div class="col-md-4"><label style="font-size: 15px">Total Numbers</label><br><label
                                    id="modtotal" style="font-size: 15px">100</label></div>
                            <div class="col-md-4"><label style="font-size: 15px">Duplicate Numbers</label><br><label
                                    id="moddup" style="font-size: 15px">5</label></div>
                            <div class="col-md-4"><label style="font-size: 15px">Wrong Numbers</label><br><label
                                    id="modwrong" style="font-size: 15px">6</label></div>

                        </div>
                        <div class="row">
                            <table class="col-md-6" style="margin: auto;">
                                <tr style="width: 100%;">
                                    <td width="10%">
                                        <img
                                                src="assets/images/mobitel.png"
                                                style="width: 18px;"></td>
                                    <td width="60%">Mobitel</td>
                                    <td id="mobitelmod" width="30%"
                                        style="text-align: right;">500
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"><img
                                            src="assets/images/dialog.png"
                                            style="width: 18px;"></td>
                                    <td width="60%">Dialog</td>
                                    <td id="dialogmod" width="30%"
                                        style="text-align: right;">500
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"><img
                                            src="assets/images/airtel.png"
                                            style="width: 18px;"></td>
                                    <td width="60%">Airtel</td>
                                    <td id="airtelmod" width="30%"
                                        style="text-align: right;">500
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"><img src="assets/images/hut.png"
                                                         style="width: 15px;"></td>
                                    <td width="60%">Hutch</td>
                                    <td id="hutchmod" width="30%"
                                        style="text-align: right;">500
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"><img
                                            src="assets/images/letter-o-icon-png-8.png"
                                            style="width: 15px;"></td>
                                    <td width="60%">Other</td>
                                    <td id="othermod" width="30%"
                                        style="text-align: right;">500
                                    </td>
                                </tr>
                            </table>


                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-link" data-dismiss="modal">Close
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /content area -->

    <!-- Footer -->
    <div class="navbar navbar-expand-lg navbar-light fixed-bottom">
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
<!-- /page content -->


</body>


<script type="text/javascript">
    $('#preimg').show();

    var selectedMessageType = '';
    var groupnamevalid = false;

    var selectedMessageCategory = "<%=messageType%>";
    var defaultPath = "<%=default_img_path%>";
    var selectedCategaryPath = "<%=selected_img_path%>";


    var si = false;
    var en = false;
    var ta = false;


    function setTheSideBarTopMargin() {

        var topNavBarHeight = document.getElementsByClassName('navbar navbar-expand-md navbar-dark fixed-top')[0].offsetHeight;
        document.getElementsByClassName("page-content")[0].style.marginTop = topNavBarHeight - 1 + "px";
    }


    function sidebarExpandButton(linkBtn) {
        var child = linkBtn.getElementsByTagName('i')[0];
        if (child.style.marginLeft === "") {
            console.log(" margin left should added");
            child.style.marginLeft = "17px";
        } else {
            console.log("margin left should removed");
            child.style.marginLeft = "";
        }
    }

    //validation
    var minLength = 3;
    var maxLength = 25;
    var maxLengths = 50;
    $('#messageText').on('keydown keyup change', function () {
        console.log($('#msgtype').val());

        if ($('#msgtype').val() == 'imgntxt') {
            imageOnly();
            maxLength = 25;
        } else if ($('#msgtype').val() == 'txt') {

            maxLength = 200;
        }

        var char = $(this).val();


        var charLength = $(this).val().length;
        if (charLength < minLength) {

            $('#gropspan').text('use at least 3 characters');
        } else if (charLength > maxLength) {

            $('#gropspan').text('Maximum character length is ' + maxLength + '');
            $(this).val(char.substring(0, maxLength));
        } else {

            $('#gropspan').text('');
        }
    });


    $(document).ready(function () {


        $('#imgtagform').val('id' + (new Date()).getTime());
        $('#vidtag').val('vid' + (new Date()).getTime());
        $('#fileTag').val('file' + (new Date()).getTime());
        imageOnly();

        $('#bodyDiv').show();
        $('#linkdiv').show();
        $('#fileformDiv').hide();
        $('#imageDiv').show();
        $('#vidPre1').hide();
        $('#fileDiv').hide();
        $('#filePrev').hide();


        $('#msgtype').on('change', function () {

            if(this.value == 'txt'){
                $('#bodyDiv').show();
                $('#linkdiv').hide();
                $('#fileformDiv').hide();
                $('#imageDiv').hide();
                $('#vidPre1').hide();
                $('#preimg').hide();
                $('#fileDiv').hide();

             }else if(this.value == 'img'){

                $('#bodyDiv').hide();
                $('#linkdiv').hide();
                $('#fileformDiv').hide();
                $('#imageDiv').show();
                $('#angmsgtxt').hide();
                $('#vidPre1').hide();
                $('#preimg').show();
                $('#fileDiv').hide();

            }else if(this.value == 'video'){
                $('#bodyDiv').hide();
                $('#linkdiv').hide();
                $('#fileformDiv').show();
                $('#imageDiv').hide();
                $('#angmsgtxt').hide();
                $('#preimg').hide();
                $('#vidPre1').show();
                $('#fileDiv').hide();

            }else if(this.value == 'imgntxt'){

                $('#bodyDiv').show();
                $('#linkdiv').show();
                $('#fileformDiv').hide();
                $('#imageDiv').show();
                $('#vidPre1').hide();
                $('#preimg').show();
                $('#fileDiv').hide();

            }else if(this.value == 'file'){

                $('#bodyDiv').hide();
                $('#linkdiv').hide();
                $('#fileformDiv').hide();
                $('#imageDiv').hide();
                $('#vidPre1').hide();
                $('#preimg').hide();
                $('#fileDiv').show();

            }


        })


        var text = " https://bro.ws/x1x1x";
        var word = "You have got a Viber message. Click on the link to view the message. https://bro.ws/x1x1x";
        $('#fallbackmsg').val(word);
        $("#fallbackmsg").keyup(function () {
            $(this).val(this.value.replace(text, "") + text);
        });


        $('#frmSendMessage').bind('submit', function (e) {
            e.preventDefault();
        });


        $('#messageText').keypress(function () {
            console.log('asdasd')
            $('#angmsgtxt').css('display', '');
        });

        $('#groupidform').keypress(function () {
            console.log('asdasd')
            $('#result').html('');
        });


        if (selectedMessageCategory === "sms") {
            //alert("sms");
            $("#phoneHeader").css("background-color", "orange");
            $("#lableSendId").css("color", "white");
            $("#heading").css("background-color", "orange");
            $("#messageIcon").addClass('far fa-envelope fa-2x');
        }
        if (selectedMessageCategory === "viber") {
            //alert("viber");
            $("#phoneHeader").css("background-color", "#8f5db7");
            $("#lableSendId").css("color", "white");
            $("#heading").css("background-color", "#8F5DB7");
            $("#messageIcon").addClass('fab fa-viber fa-2x');
        }
        if (selectedMessageCategory === "whatsapp") {
            //alert("whatsapp");
            $("#heading").css("background-color", "green");
            $("#messageIcon").addClass('fab fa-whatsapp fa-2x');
        }
        if (selectedMessageCategory === "telegram") {
            //alert("telegram");
            $("#heading").css("background-color", "navy");
            $("#messageIcon").addClass('fab fa-telegram-plane fa-2x');
        }

        /* Set default icons of select message types icons to grey*/

        /* ----- */

        $("#btnMsg").prop("hidden", true);
        $("#imagePreview").prop("hidden", true);

        var campaignName = $("#campaignName").val();
        $("#campName").text(campaignName);

        $("#messageText").on("keyup", function () {
            //alert("hhhhhhhhhh");
            var max = this.getAttribute("maxlength");
            //alert(max);
            var len = $(this).val().length;

            if (len >= max) {
                $('#charCount').text("You Have Reached Maximum Charactor Limit..!");
            } else {
                var charcount = (max - len);
                $("#charCount").text(charcount + " Charactors Out of " + max + " Remaining ..!");
            }
        });

        $("#fallbackmsg").on("keyup", function () {
            //alert("hhhhhhhhhh");
            var max = this.getAttribute("maxlength");
            //alert(max);
            var len = $(this).val().length;

            if (len >= max) {
                $('#charCount1').text("You Have Reached Maximum Charactor Limit..!");
            } else {
                var charcount = (max - len);
                $("#charCount1").text(charcount + " Charactors Out of " + max + " Remaining ..!");
            }
        });


        //////

    });


    /* Select message type */
    function selectMessageType(id) {
        $('#messageText').val('');
        $('#btnTextform').val('');
        $('#btnurlform').val('');
        // $('#fallbackmsg').val('');
        $('#angmsgtxt').hide();
        $('#fileformDiv').hide();

        $('#btnMsg').val('');

        $('#preimg').empty();
        $('#campaignselecterror').hide();
        selectedMessageType = 'btnTextImageButton';
        var icon = "";

        /*  Default icon names for diffrent types*/
        var type1 = "text.png";
        var type2 = "image.png";
        var type3 = "text_button.png";
        var type4 = "image_text.png";
        var type5 = "image_button.png";
        var type6 = "image_text_button.png";

        /* Set default icons of select message types icons back to to grey*/
        document.getElementById("btnTextonly").src = defaultPath + 'text.png';
        document.getElementById("btnImageonly").src = defaultPath + 'image.png';
        document.getElementById("btnTextButton").src = defaultPath + 'text_button.png';
        document.getElementById("btnTextImage").src = defaultPath + 'image_text.png';
        document.getElementById("btnTextImageButton").src = defaultPath + 'image_text_button.png';
        /* ----- */

        /* Select icon of selected type and change color */
        switch (selectedMessageType) {
            case "btnTextonly":

                $('#preimg').hide();
                icon = type1;
                break;
            case "btnImageonly":

//                $('.img-container').empty();
//                $('.img-container').attr('src','https://embec2017.org/wp-content/uploads/2017/07/image-icon.jpg');
                $('#preimg').show();
                icon = type2;
                break;
            case "btnTextButton":
                $('#preimg').hide();
                icon = type3;
                break;
            case "btnTextImage":
                $('#preimg').show();
                icon = type4;
                break;
            case "btnTextImageButton":

//                $('.img-container').empty();
//                $('.img-container').attr('src','https://embec2017.org/wp-content/uploads/2017/07/image-icon.jpg');

                $('#preimg').show();
                icon = type6;
                break;
            default:
                icon = "";
        }

        if (selectedMessageCategory === "sms") {
            alert("sms");
            //btn.style.backgroundColor = "#ffcc80 ";
        }
        if (selectedMessageCategory === "viber") {
            //btn.style.backgroundColor = "#b39ddb";
            document.getElementById(selectedMessageType).src = selectedCategaryPath + icon;
        }
        if (selectedMessageCategory === "whatsapp") {
            alert("sms");
            //btn.style.backgroundColor = "#66bb6a";
        }
        if (selectedMessageCategory === "telegram") {
            alert("sms");
            //btn.style.backgroundColor = "#5c6bc0 ";
        }

        /* --------- */

        checkSelectedMessageType(selectedMessageType);
    }

    /* ------------  */

    /* Function to change context based on selected message type */
    function checkSelectedMessageType(type) {

        //text only message
        if (selectedMessageType === "btnTextonly") {
            $("#imageDiv").prop("hidden", true);
            $("#btnDiv1").prop("hidden", true);
            $("#btnDiv2").prop("hidden", true);
            $("#bodyDiv").prop("hidden", false);
            $("#btnMsg").prop("hidden", true);
            $("#imagePreview").prop("hidden", true);
            $('#messageTypeHolder').val(type);
        }
        //Image only message
        if (selectedMessageType === "btnImageonly") {
            $("#imageDiv").prop("hidden", false);
            $("#btnDiv1").prop("hidden", true);
            $("#btnDiv2").prop("hidden", true);
            $("#bodyDiv").prop("hidden", true);
            $("#btnMsg").prop("hidden", true);
            $("#imagePreview").prop("hidden", false);
            $('#messageTypeHolder').val(type);
            imageOnly();
        }
        //Text and Image Only Message
        if (selectedMessageType === "btnTextImage") {
            typeofratio = '';
            console.log(typeofratio)
            $("#imageDiv").prop("hidden", false);
            $("#btnDiv1").prop("hidden", true);
            $("#btnDiv2").prop("hidden", true);
            $("#bodyDiv").prop("hidden", false);
            $("#btnMsg").prop("hidden", true);
            $("#imagePreview").prop("hidden", false);
            $('#messageTypeHolder').val(type);
        }
        //Text and Button Message
        if (selectedMessageType === "btnTextButton") {
            $("#imageDiv").prop("hidden", true);
            $("#btnDiv1").prop("hidden", false);
            $("#btnDiv2").prop("hidden", false);
            $("#bodyDiv").prop("hidden", false);
            $("#btnMsg").prop("hidden", false);
            $("#imagePreview").prop("hidden", true);
            $('#messageTypeHolder').val(type);
        }

        //Text , Image and Button Message
        if (selectedMessageType === "btnTextImageButton") {
            typeofratio = '1';
            console.log(typeofratio)
            $("#imageDiv").prop("hidden", false);
            $("#btnDiv1").prop("hidden", false);
            $("#btnDiv2").prop("hidden", false);
            $("#bodyDiv").prop("hidden", false);
            $("#btnMsg").prop("hidden", false);
            $("#imagePreview").prop("hidden", false);
            $('#messageTypeHolder').val(type);
            imageBtnLink();
        }
    }


    /* -------- */

    function imageOnly() {

        $('imgcon').empty();

        var container = document.getElementById("imgcon");
        container.innerHTML = '<img src="https://viber.textware.lk/TestDemo/image-icon-13.png" alt=" ">';


        var Cropper = window.Cropper;
        var URL = window.URL || window.webkitURL;
        var image = container.getElementsByTagName('img').item(0);
        var download = document.getElementById('download');
        var actions = document.getElementById('actions');
        var dataX = document.getElementById('dataX');
        var dataY = document.getElementById('dataY');
        var dataHeight = document.getElementById('dataHeight');
        var dataWidth = document.getElementById('dataWidth');
        var dataRotate = document.getElementById('dataRotate');
        var dataScaleX = document.getElementById('dataScaleX');
        var dataScaleY = document.getElementById('dataScaleY');
        var options = {
            preview: '.img-preview',
            ready: function (e) {
                console.log(e.type);
            },
            cropstart: function (e) {
                console.log(e.type, e.detail.action);
            },
            cropmove: function (e) {
                console.log(e.type, e.detail.action);
            },
            cropend: function (e) {
                console.log(e.type, e.detail.action);
            },
            crop: function (e) {
                var data = e.detail;

                console.log(e.type);
                dataX.value = Math.round(data.x);
                dataY.value = Math.round(data.y);
                dataHeight.value = Math.round(data.height);
                dataWidth.value = Math.round(data.width);
                dataRotate.value = typeof data.rotate !== 'undefined' ? data.rotate : '';
                dataScaleX.value = typeof data.scaleX !== 'undefined' ? data.scaleX : '';
                dataScaleY.value = typeof data.scaleY !== 'undefined' ? data.scaleY : '';
            },
            zoom: function (e) {
                console.log(e.type, e.detail.ratio);
            }
        };

        var imgin = document.getElementById('inputImage');
        check(image, options, actions, download, URL, Cropper, imgin);
    }

    function imageBtnLink() {


        $('imgcon').empty();

        var container = document.getElementById("imgcon");
        container.innerHTML = '<img src="https://viber.textware.lk/TestDemo/image-icon-13.png" alt="default">';


        var Cropper = window.Cropper;
        var URL = window.URL || window.webkitURL;


        var image = container.getElementsByTagName('img').item(0);
        var download = document.getElementById('download');
        var actions = document.getElementById('actions');
        var dataX = document.getElementById('dataX');
        var dataY = document.getElementById('dataY');
        var dataHeight = document.getElementById('dataHeight');
        var dataWidth = document.getElementById('dataWidth');
        var dataRotate = document.getElementById('dataRotate');
        var dataScaleX = document.getElementById('dataScaleX');
        var dataScaleY = document.getElementById('dataScaleY');
        var options = {
            aspectRatio: 1 / 1,
            preview: '.img-preview',
            ready: function (e) {
                console.log(e.type);
            },
            cropstart: function (e) {
                console.log(e.type, e.detail.action);
            },
            cropmove: function (e) {
                console.log(e.type, e.detail.action);
            },
            cropend: function (e) {
                console.log(e.type, e.detail.action);
            },
            crop: function (e) {
                var data = e.detail;

                console.log(e.type);
                dataX.value = Math.round(data.x);
                dataY.value = Math.round(data.y);
                dataHeight.value = Math.round(data.height);
                dataWidth.value = Math.round(data.width);
                dataRotate.value = typeof data.rotate !== 'undefined' ? data.rotate : '';
                dataScaleX.value = typeof data.scaleX !== 'undefined' ? data.scaleX : '';
                dataScaleY.value = typeof data.scaleY !== 'undefined' ? data.scaleY : '';
            },
            zoom: function (e) {
                console.log(e.type, e.detail.ratio);
            }
        };

        var imgin = document.getElementById('inputImage');
        check(image, options, actions, download, URL, Cropper, imgin);
    }


    var vsize='';
    $(document).ready(function () {

        $('#vidPreview').hide();

        //
        var myVideos = [];
        window.URL = window.URL || window.webkitURL;
        document.getElementById('fileform').onchange = setFileInfo;
        function setFileInfo() {
            var files = this.files;
            myVideos.push(files[0]);
            var video = document.createElement('video');
            video.preload = 'metadata';

            video.onloadedmetadata = function () {
                window.URL.revokeObjectURL(video.src);
                var duration = video.duration;
                myVideos[myVideos.length - 1].duration = duration;
                updateInfos();
            }

            video.src = URL.createObjectURL(files[0]);
            vsize= files[0];

        }
        function updateInfos() {

            var dur;

            for (var i = 0; i < myVideos.length; i++) {
                dur = myVideos[i].duration;
            }

            if (dur > 180) {
                Swal.fire('Max Video Duration is 180 seconds');
                $("#btnFileSubmit").prop("disabled", true);

            }else{
                $('#vidPreview').show();
                $('#preimg').hide();
                $('#vidPre1').show();
                $('#duration').val(Math.trunc(dur));
                $('#vsize').val(vsize.size);

                $("#btnFileSubmit").prop("disabled", false);
            }



        }
        //

        $("#btnFileSubmit").click(function (event) {


            //stop submit the form, we will post it manually.
            event.preventDefault();


            if ($('#fileanyform').val() == '') {
                swal({
                    title: 'Please Select File',
                    type: 'error',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-danger',
                    cancelButtonClass: 'btn btn-light'
                });

            } else {


                var data = new FormData();
                data.append('video', $('#fileform')[0].files[0]);
                data.append('vidTag', $('#vidtag').val());
                //disabled the submit button
                $("#btnFileSubmit").prop("disabled", true);

                swal({
                    title: 'Uploading...!',
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-primary',
                    cancelButtonClass: 'btn btn-light',
                    onOpen: () => {
                    swal.showLoading();
                $('.swal2-actions').html('<div class="spinner-box"><div class="circle-border" style=" background: linear-gradient(0deg, rgba(37,211,102,0.1) 33%, rgb(37,211,102) 100%);"><div class="circle-core"></div> </div> </div>');

                ///
                $.ajax({
                    type: "POST",
                    enctype: 'multipart/form-data',
                    url: "/TestDemo/VideoUploader",
                    data: data,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (data) {

                        // $('#result').html('<b style="color: #ff8600"> File Uploaded</b>');
                        $("#btnFileSubmit").prop("disabled", false);
                        swal.hideLoading();
                        swal({
                            title: 'Uploaded!',
                            text: 'Upload Successfully.',
                            type: 'success',
                            buttonsStyling: false,
                            confirmButtonClass: 'btn btn-primary',
                            cancelButtonClass: 'btn btn-light'
                        });
                    },
                    error: function (e) {
                        swal.hideLoading();
                        swal({
                            title: 'Upload Failed',
                            type: 'error',
                            buttonsStyling: false,
                            confirmButtonClass: 'btn btn-danger',
                            cancelButtonClass: 'btn btn-light'
                        });

                        // $('#result').html('<b style="color: red"> File Upload Failed</b>');
                        $("#btnFileSubmit").prop("disabled", false);

                    }
                });
                //
            }
            });
                //

            }

        });



        document.getElementById('fileonly').onchange = setFileOnlyInfo;

        function setFileOnlyInfo(){
            var files = this.files;
            console.log(files[0].size);

            if(50000000>files[0].size){
               console.log('done')
                $('#fileName').val(files[0].name);
               console.log(files[0].name)
                $('#fileSize').val(files[0].size);
               $('#filePrev').show();

                $("#btnFileOnlySubmit").prop("disabled", false);

            }else{
                Swal.fire('Max File Size is 50MB');
                $('#filePrev').hide();

                $("#btnFileOnlySubmit").prop("disabled", true);

            }
        }


        $("#btnFileOnlySubmit").click(function (event) {


            //stop submit the form, we will post it manually.
            event.preventDefault();


            if ($('#fileanyform').val() == '') {
                swal({
                    title: 'Please Select File',
                    type: 'error',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-danger',
                    cancelButtonClass: 'btn btn-light'
                });

            } else {


                var data = new FormData();
                data.append('fileAny', $('#fileonly')[0].files[0]);
                data.append('fileTag', $('#fileTag').val());
                //disabled the submit button
                $("#btnFileOnlySubmit").prop("disabled", true);

                swal({
                    title: 'Uploading...!',
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-primary',
                    cancelButtonClass: 'btn btn-light',
                    onOpen: () => {
                    swal.showLoading();
                $('.swal2-actions').html('<div class="spinner-box"><div class="circle-border" style=" background: linear-gradient(0deg, rgba(37,211,102,0.1) 33%, rgb(37,211,102) 100%);"><div class="circle-core"></div> </div> </div>');

                ///
                $.ajax({
                    type: "POST",
                    enctype: 'multipart/form-data',
                    url: "/TestDemo/FileAnyUploader",
                    data: data,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (data) {

                        // $('#result').html('<b style="color: #ff8600"> File Uploaded</b>');
                        $("#btnFileOnlySubmit").prop("disabled", false);
                        swal.hideLoading();
                        swal({
                            title: 'Uploaded!',
                            text: 'Upload Successfully.',
                            type: 'success',
                            buttonsStyling: false,
                            confirmButtonClass: 'btn btn-primary',
                            cancelButtonClass: 'btn btn-light'
                        });
                    },
                    error: function (e) {
                        swal.hideLoading();
                        swal({
                            title: 'Upload Failed',
                            type: 'error',
                            buttonsStyling: false,
                            confirmButtonClass: 'btn btn-danger',
                            cancelButtonClass: 'btn btn-light'
                        });

                        // $('#result').html('<b style="color: red"> File Upload Failed</b>');
                        $("#btnFileOnlySubmit").prop("disabled", false);

                    }
                });
                //
            }
            });
                //

            }

        });


        $(document).on("change", "#fileform", function(evt) {
            var $source = $('#video_here');
            $source[0].src = URL.createObjectURL(this.files[0]);
            $source.parent()[0].load();

            var $source = $('#video_here1');
            $source[0].src = URL.createObjectURL(this.files[0]);
            $source.parent()[0].load();
        });

    });


</script>


<%


    String saved = "" + request.getParameter("saved");
    System.out.println(name);


    if (saved.equals("yes")) {
%>
<script>


    swal({
        title: 'Message Submitted!',
        text: '',
        type: 'success',
        buttonsStyling: false,
        confirmButtonClass: 'btn btn-primary',
        cancelButtonClass: 'btn btn-light'
    });


    setTimeout(function () {
        window.location.href = "https://viber.textware.lk/TestDemo/composeMessage.jsp";
    }, 2000);

</script>
<%
    }
%>

</html>
