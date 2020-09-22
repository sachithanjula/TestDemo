<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mobios.models.ContentModel" %>
<%@ page import="com.mobios.controllers.TableController" %>
<%@include file="Broadcast.jsp" %>
<%

    System.out.println("save block");



    String msgType = "" + request.getParameter("msgtype");
    System.out.println("msgType: "+msgType);

    String content = "" + request.getParameter("content");
    System.out.println("content: "+content);

    String link = "" + request.getParameter("link");
    System.out.println("link: "+link);
    String refid = "" + request.getParameter("refid");

    String vidtag = "" + request.getParameter("vidtag");
    String dur = "" + request.getParameter("dur");
    String vsize = "" + request.getParameter("vsize");


    String fileName = "" + request.getParameter("fileName");
    String fileSize = "" + request.getParameter("fileSize");
    String fileTag = "" + request.getParameter("fileTag");
    System.out.println("refid: "+refid);

    String imgPath = "";
    String filePath = "";



    // refid number

    String fieldName = "";


    ContentModel contentModel = null;

    if (msgType.equals("txt"))
    {
        contentModel = new ContentModel();

        contentModel.setContent(content);
        contentModel.setMsgType(msgType);
        contentModel.setType("N/A");
        contentModel.setImagePath("");
        contentModel.setLink("");
    }

    else if (msgType.equals("img"))
    {
        contentModel = new ContentModel();

        imgPath = TableController.getImagePath(refid);

        contentModel.setImagePath(imgPath);
        contentModel.setMsgType(msgType);
        contentModel.setType("N/A");
        contentModel.setContent("");
        contentModel.setLink("");
    }

    else if (msgType.equals("imgntxt"))
    {
        contentModel = new ContentModel();

        imgPath = TableController.getImagePath(refid);

        contentModel.setContent(content);
        contentModel.setMsgType(msgType);
        contentModel.setImagePath(imgPath);
        contentModel.setType("N/A");
        contentModel.setLink(link);

    }else if(msgType.equals("video")){

        contentModel = new ContentModel();

        imgPath = TableController.getImagePath(vidtag);

        contentModel.setDur(dur);
        contentModel.setSize(vsize);

        contentModel.setMsgType(msgType);
        contentModel.setImagePath(imgPath);
        contentModel.setType("N/A");
        contentModel.setLink("");
        contentModel.setContent("");


    }else if(msgType.equals("file")){

        contentModel = new ContentModel();

        filePath = TableController.getImagePath(fileTag);

        contentModel.setSize(fileSize);
        contentModel.setFile_name(fileName);

        contentModel.setMsgType(msgType);
        contentModel.setImagePath(filePath);
        contentModel.setType("N/A");
        contentModel.setLink("");
        contentModel.setContent("");


    }

    if (TableController.insertContent(contentModel, msgType) > 0) {

        BrodCastNews(contentModel);
        response.sendRedirect("composeMessage.jsp?saved=yes");

    }

%>