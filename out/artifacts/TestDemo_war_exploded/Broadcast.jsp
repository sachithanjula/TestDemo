<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.mobios.dbconnection.DBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.mobios.controllers.MyHttpRequest" %>
<%@ page import="com.mobios.models.*" %>

<%!

    public ButtonModel buttonModelCreator(int col, int row, String actionType, String actionBody, String color, String url) {

        ButtonModel buttonModel = null;

        buttonModel = new ButtonModel();

        buttonModel.setColumns(col);
        buttonModel.setRows(row);
        buttonModel.setSilent(true);
        buttonModel.setActionType(actionType);
        buttonModel.setActionBody(actionBody);
        buttonModel.setImage(url);
        buttonModel.setBgColor(color);

        return buttonModel;

    }

    public ButtonModel simpleButtonModelCreator(int col, int row, String actionType, String actionBody, String color, String url, String text) {

        ButtonModel buttonModel = new ButtonModel();

        buttonModel.setColumns(col);
        buttonModel.setRows(row);
        buttonModel.setSilent(false);
        buttonModel.setActionType(actionType);
        buttonModel.setActionBody(actionBody);
        buttonModel.setImage(url);
        buttonModel.setBgColor(color);
        buttonModel.setText(text);

        return buttonModel;

    }

    public void BrodCastNews(ContentModel contentModel) {

        System.out.println("BrodCastNews");

        String msgType = contentModel.getMsgType();

        List<ButtonModel> buttonModels = new ArrayList<>();
        List<ButtonModel> buttonModelsKb = new ArrayList<>();

        ResourceBundle resource = ResourceBundle.getBundle("config");
        String auth = resource.getString("authkey");


        BroadcastUsersModel broadcastUsersModel = new BroadcastUsersModel();
        BroadcastImageUsersModel broadcastImageUsersModel = new BroadcastImageUsersModel();
        BroadcastVideoUsersModel broadcastVideoUsersModel = new BroadcastVideoUsersModel();
        BroadcastFileUsersModel broadcastFileUsersModel = new BroadcastFileUsersModel();
        RichMedia richMedia = new RichMedia();
        keyBoardModel keyBoardModel = new keyBoardModel();
        SenderModel senderModel = new SenderModel();


        ButtonModel buttonModel1 = new ButtonModel();
        ButtonModel buttonModel2 = new ButtonModel();

        richMedia.setType("rich_media");

        richMedia.setBgColor("#FFFFFF");

        if (msgType.equals("txt"))
        {
            richMedia.setButtonsGroupColumns(6);
            richMedia.setButtonsGroupRows(6);

            buttonModel1.setColumns(6);
            buttonModel1.setRows(6);

            buttonModel1.setActionType("none");
            buttonModel1.setActionBody(contentModel.getLink());
            buttonModel1.setText("<b>" + contentModel.getContent() + "</b>");
            buttonModel1.setSilent(true);
            buttonModel1.setTextSize("medium");
            buttonModel1.setTextVAlign("middle");
            buttonModel1.setTextHAlign("left");

            buttonModels.add(buttonModel1);

            richMedia.setButtons(buttonModels);


            //
            ButtonModel buttonModels1 = buttonModelCreator(6, 1, "reply", "ndbnews", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png");

            buttonModelsKb.add(buttonModels1);

            keyBoardModel.setType("keyboard");
            keyBoardModel.setInputFieldState("hidden");
            keyBoardModel.setButtonModels(buttonModelsKb);


            senderModel.setName("TestDemo");

            broadcastUsersModel.setRich_media(richMedia);
            broadcastUsersModel.setKeyboard(keyBoardModel);
            broadcastUsersModel.setSender(senderModel);
            broadcastUsersModel.setMin_api_version(6);
            broadcastUsersModel.setType("rich_media");


            sendList(broadcastUsersModel, auth);
            //
        }

        else if (msgType.equals("imgntxt"))
        {

            richMedia.setButtonsGroupColumns(6);
            richMedia.setButtonsGroupRows(6);

            buttonModel1.setColumns(6);
            buttonModel1.setRows(5);
            buttonModel1.setActionType("open-url");
            buttonModel1.setActionBody(contentModel.getLink());
            buttonModel1.setSilent(true);
            buttonModel1.setImage(contentModel.getImagePath());


            buttonModel2.setColumns(6);
            buttonModel2.setRows(1);
            buttonModel2.setActionType("open-url");
            buttonModel2.setActionBody(contentModel.getLink());
            buttonModel2.setText("<b>" + contentModel.getContent() + "</b>");
            buttonModel2.setSilent(true);
            buttonModel2.setTextSize("medium");
            buttonModel2.setTextVAlign("middle");
            buttonModel2.setTextHAlign("left");

            buttonModels.add(buttonModel1);
            buttonModels.add(buttonModel2);

            richMedia.setButtons(buttonModels);

            //
            ButtonModel buttonModels1 = buttonModelCreator(6, 1, "reply", "ndbnews", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png");

            buttonModelsKb.add(buttonModels1);

            keyBoardModel.setType("keyboard");
            keyBoardModel.setInputFieldState("hidden");
            keyBoardModel.setButtonModels(buttonModelsKb);


            senderModel.setName("TestDemo");

            broadcastUsersModel.setRich_media(richMedia);
            broadcastUsersModel.setKeyboard(keyBoardModel);
            broadcastUsersModel.setSender(senderModel);
            broadcastUsersModel.setMin_api_version(6);
            broadcastUsersModel.setType("rich_media");


            sendList(broadcastUsersModel, auth);
            //
        }
        else if (msgType.equals("img"))
        {


            ButtonModel buttonModels1 = buttonModelCreator(6, 1, "reply", "ndbnews", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png");

            buttonModelsKb.add(buttonModels1);

            keyBoardModel.setType("keyboard");
            keyBoardModel.setInputFieldState("hidden");
            keyBoardModel.setButtonModels(buttonModelsKb);

            senderModel.setName("TestDemo");

            broadcastImageUsersModel.setThumbnail(contentModel.getImagePath());
            broadcastImageUsersModel.setMedia(contentModel.getImagePath());
            broadcastImageUsersModel.setKeyboard(keyBoardModel);
            broadcastImageUsersModel.setSender(senderModel);
            broadcastImageUsersModel.setMin_api_version(6);
            broadcastImageUsersModel.setType("picture");


            sendImageList(broadcastImageUsersModel, auth);


        }else if (msgType.equals("video"))
        {

            System.out.println("videoooooooooooo");


            ButtonModel buttonModels1 = buttonModelCreator(6, 1, "reply", "ndbnews", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png");

            buttonModelsKb.add(buttonModels1);

            keyBoardModel.setType("keyboard");
            keyBoardModel.setInputFieldState("hidden");
            keyBoardModel.setButtonModels(buttonModelsKb);

            senderModel.setName("TestDemo");

            broadcastVideoUsersModel.setThumbnail("https://icon-library.com/images/icon-for-video/icon-for-video-13.jpg");
            broadcastVideoUsersModel.setMedia(contentModel.getImagePath());
            broadcastVideoUsersModel.setKeyboard(keyBoardModel);
            broadcastVideoUsersModel.setSender(senderModel);
            broadcastVideoUsersModel.setDuration(contentModel.getDur());
            broadcastVideoUsersModel.setSize(contentModel.getSize());
            broadcastVideoUsersModel.setMin_api_version(6);
            broadcastVideoUsersModel.setType("video");


            System.out.println(broadcastImageUsersModel.toString());




            sendVideoList(broadcastVideoUsersModel, auth);


        }
        else if (msgType.equals("file"))
        {


            ButtonModel buttonModels1 = buttonModelCreator(6, 1, "reply", "ndbnews", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png");

            buttonModelsKb.add(buttonModels1);

            keyBoardModel.setType("keyboard");
            keyBoardModel.setInputFieldState("hidden");
            keyBoardModel.setButtonModels(buttonModelsKb);

            senderModel.setName("TestDemo");

            broadcastFileUsersModel.setMedia(contentModel.getImagePath());
            broadcastFileUsersModel.setKeyboard(keyBoardModel);
            broadcastFileUsersModel.setSender(senderModel);
            broadcastFileUsersModel.setFile_name(contentModel.getFile_name());
            broadcastFileUsersModel.setSize(contentModel.getSize());
            broadcastFileUsersModel.setMin_api_version(6);
            broadcastFileUsersModel.setType("file");


            System.out.println(broadcastImageUsersModel.toString());




            sendFileList(broadcastFileUsersModel, auth);


        }






    }


    public void sendList(BroadcastUsersModel broadcastUsersModel, String auth)
    {
        int loopCount = 0;
        int recordsCount = 0;
        int j = 0;

        List<String> userIds = new ArrayList<>();

        try
        {
            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT COUNT(id) FROM event_table WHERE subscription = 'true' ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                recordsCount = resultSet.getInt(1);
            }

            System.out.println(recordsCount);

            loopCount = (recordsCount / 300) + 1;
            System.out.println(loopCount);

            for (int i = 0; i < loopCount; i++)
            {

                System.out.println("j============= "+j);

                PreparedStatement preparedStatement1 = DBConnection.getDbCon().conn.prepareStatement("SELECT id, user_id FROM event_table WHERE subscription = 'true' LIMIT 300 OFFSET "+j);
                ResultSet resultSet1 = preparedStatement1.executeQuery();

                while (resultSet1.next())
                {
                    System.out.println(resultSet1.getString("id") + " = " + resultSet1.getString("user_id"));
                    //userIds.add(resultSet1.getString("user_id"));
                    System.out.println("j+++++"+j);
                    userIds.add(resultSet1.getString("user_id"));
                    j++;
                }

                System.out.println("LIST size"+ userIds.size());

                broadcastUsersModel.setBroadcast_list(userIds);

                String brodmsg = MyHttpRequest.broadCastService(broadcastUsersModel, auth);
                System.out.println(brodmsg);

            }

        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("event save error");
        }
    }

    public void sendImageList(BroadcastImageUsersModel broadcastUsersModel, String auth)
    {
        int loopCount = 0;
        int recordsCount = 0;
        int j = 0;

        List<String> userIds = new ArrayList<>();

        try
        {
            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT COUNT(id) FROM event_table WHERE subscription = 'true' ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                recordsCount = resultSet.getInt(1);
            }

            System.out.println(recordsCount);

            loopCount = (recordsCount / 300) + 1;
            System.out.println(loopCount);

            for (int i = 0; i < loopCount; i++)
            {

                System.out.println("j============= "+j);

                PreparedStatement preparedStatement1 = DBConnection.getDbCon().conn.prepareStatement("SELECT id, user_id FROM event_table WHERE subscription = 'true' LIMIT 300 OFFSET "+j);
                ResultSet resultSet1 = preparedStatement1.executeQuery();

                while (resultSet1.next())
                {
                    System.out.println(resultSet1.getString("id") + " = " + resultSet1.getString("user_id"));
                    //userIds.add(resultSet1.getString("user_id"));
                    System.out.println("j+++++"+j);
                    userIds.add(resultSet1.getString("user_id"));
                    j++;
                }

                System.out.println("LIST size"+ userIds.size());

                broadcastUsersModel.setBroadcast_list(userIds);

                String brodmsg = MyHttpRequest.broadCastImagesService(broadcastUsersModel, auth);
                System.out.println(brodmsg);

            }

        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("event save error");
        }
    }


    public void sendVideoList(BroadcastVideoUsersModel broadcastUsersModel, String auth)
    {
        int loopCount = 0;
        int recordsCount = 0;
        int j = 0;

        List<String> userIds = new ArrayList<>();

        try
        {
            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT COUNT(id) FROM event_table WHERE subscription = 'true' ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                recordsCount = resultSet.getInt(1);
            }

            System.out.println(recordsCount);

            loopCount = (recordsCount / 300) + 1;
            System.out.println(loopCount);

            for (int i = 0; i < loopCount; i++)
            {

                System.out.println("j============= "+j);

                PreparedStatement preparedStatement1 = DBConnection.getDbCon().conn.prepareStatement("SELECT id, user_id FROM event_table WHERE subscription = 'true' LIMIT 300 OFFSET "+j);
                ResultSet resultSet1 = preparedStatement1.executeQuery();

                while (resultSet1.next())
                {
                    System.out.println(resultSet1.getString("id") + " = " + resultSet1.getString("user_id"));
                    //userIds.add(resultSet1.getString("user_id"));
                    System.out.println("j+++++"+j);
                    userIds.add(resultSet1.getString("user_id"));
                    j++;
                }

                System.out.println("LIST size"+ userIds.size());

                broadcastUsersModel.setBroadcast_list(userIds);

                String brodmsg = MyHttpRequest.broadCastVideoService(broadcastUsersModel, auth);
                System.out.println(brodmsg);

            }

        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("event save error");
        }
    }



    public void sendFileList(BroadcastFileUsersModel broadcastUsersModel, String auth)
    {
        int loopCount = 0;
        int recordsCount = 0;
        int j = 0;

        List<String> userIds = new ArrayList<>();

        try
        {
            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT COUNT(id) FROM event_table WHERE subscription = 'true' ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                recordsCount = resultSet.getInt(1);
            }

            System.out.println(recordsCount);

            loopCount = (recordsCount / 300) + 1;
            System.out.println(loopCount);

            for (int i = 0; i < loopCount; i++)
            {

                System.out.println("j============= "+j);

                PreparedStatement preparedStatement1 = DBConnection.getDbCon().conn.prepareStatement("SELECT id, user_id FROM event_table WHERE subscription = 'true' LIMIT 300 OFFSET "+j);
                ResultSet resultSet1 = preparedStatement1.executeQuery();

                while (resultSet1.next())
                {
                    System.out.println(resultSet1.getString("id") + " = " + resultSet1.getString("user_id"));
                    //userIds.add(resultSet1.getString("user_id"));
                    System.out.println("j+++++"+j);
                    userIds.add(resultSet1.getString("user_id"));
                    j++;
                }

                System.out.println("LIST size"+ userIds.size());

                broadcastUsersModel.setBroadcast_list(userIds);

                String brodmsg = MyHttpRequest.broadCastFileService(broadcastUsersModel, auth);
                System.out.println(brodmsg);

            }

        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("event save error");
        }
    }

%>