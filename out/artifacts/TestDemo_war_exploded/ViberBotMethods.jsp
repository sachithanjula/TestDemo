<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="com.mobios.models.TextMessageModel" %>
<%@ page import="com.mobios.models.SenderModel" %>
<%@ page import="com.mobios.controllers.MyHttpRequest" %>
<%@ page import="javax.swing.*" %>
<%@ page import="com.mobios.models.CustomTextMessageModel" %>
<%@ page import="com.mobios.models.keyBoardModel" %>
<%@ page import="com.mobios.models.ButtonModel" %>
<%@ page import="com.mobios.utils.MobileNoValidator" %>
<%@ page import="com.mobios.utils.OTPSend" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<%!

    private String readStringContent(HttpServletRequest req) throws IOException {
        InputStream is = req.getInputStream();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is));

        StringBuilder content = new StringBuilder();
        String line;

        while ((line = bufferedReader.readLine()) != null) {
            content.append(line);
        }

        return content.toString();
    }

    public void sendMessage(String requestContent, String text, String trackId)
    {
        System.out.println("send message");
        SubscribeModel subscribeModel = new Gson().fromJson(requestContent, SubscribeModel.class);
        TextMessageModel textMessageModel = new TextMessageModel();
        SenderModel senderModel =  new SenderModel();

        ResourceBundle resource = ResourceBundle.getBundle("config");
        String auth = resource.getString("authkey");

        System.out.println("type: " + subscribeModel.getEvent());

        String senderId = subscribeModel.getSender().getId();

        textMessageModel.setReceiver(senderId);
        textMessageModel.setMin_api_version(subscribeModel.getSender().getApi_version());

        senderModel.setName("TestDemo");

        textMessageModel.setSender(senderModel);
        textMessageModel.setType("text");
        textMessageModel.setText(text);
        textMessageModel.setTracking_data(trackId);

        String rep = MyHttpRequest.sendMessage(textMessageModel, auth);
        System.out.println(rep);

        System.out.println("senderId: " + senderId);
    }

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


    public boolean checkBtnName(String name) {
        String op1 = "one";
        String op2 = "two";
        String op3 = "three";
        String op4 = "four";

        String op5 = "correct";
        String op6 = "other";

        String vlink = "http";
        String web = "";

        if (name.length() > 4)
        {
            web = name.substring(0, 4);
        }




        if (op1.equals(name) || op2.equals(name) || op3.equals(name) || op4.equals(name) ||
                op5.equals(name) || op6.equals(name) || vlink.equals(web))
        {
            return false;
        }

        return true;
    }

    public void sendOTP(String requestContent)
    {
        System.out.println("sendOTP");
        Gson gson = new Gson();

        SubscribeModel subscribeModel = gson.fromJson(requestContent, SubscribeModel.class);
        String senderId = subscribeModel.getSender().getId();

        String userNumber = TableController.getUserNumber(senderId);

        sendMessage(requestContent, "Please enter OTP you received via SMS.", "sendotp");

        Random r = new Random(System.currentTimeMillis());
        int otp = 1000 + r.nextInt(2000);
        TableController.updateOTP(senderId, otp);

        String otpstr = String.valueOf(otp);

        OTPSend.sendSMS(userNumber, "Your OTP is "+otpstr+ " ");

    }

    public void validateOTP(String requestContent, int otp)
    {
        System.out.println("get message");
        Gson gson = new Gson();

        SubscribeModel subscribeModel = gson.fromJson(requestContent, SubscribeModel.class);
        String senderId = subscribeModel.getSender().getId();


        int correctOTP = TableController.validateOTP(senderId, otp);

        if (correctOTP == 1)
        {
            loadTestMenu(requestContent);
            //sendMessage(requestContent, "Enter your employee number.", "empnum");
        }
        else if (correctOTP == 2)
        {
            sendMessage(requestContent, "OTP do not match. Please retry.", "sendotp");
        }
        else
        {
            sendOTP(requestContent);
        }
    }

    public String setMobileNumber(String requestContent)
    {

        System.out.println("getMobileNumber");
        Gson gson = new Gson();

        SubscribeModel subscribeModel = gson.fromJson(requestContent, SubscribeModel.class);
        String senderId = subscribeModel.getSender().getId();

        ResourceBundle resource = ResourceBundle.getBundle("config");
        String auth = resource.getString("authkey");

        List<ButtonModel> buttonModels = new ArrayList<>();

        CustomTextMessageModel customTextMessageModel = null;
        SenderModel senderModel = null;
        keyBoardModel keyBoardModel = null;
        TextMessageModel textMessageModel = null;

        String mobile = subscribeModel.getMessage().getText();

        String validNumber = MobileNoValidator.getValidNumber(mobile);
        Boolean valid = MobileNoValidator.checkValidNumber(validNumber);

        System.out.println(mobile);

        System.out.println(valid);

        if (valid)
        {
            System.out.println("true");

            TableController.UpdateUserMobile(senderId, validNumber);

            customTextMessageModel = new CustomTextMessageModel();
            senderModel = new SenderModel();
            keyBoardModel = new keyBoardModel();
            ButtonModel buttonModel1 = null;
            ButtonModel buttonModel2 = null;

            senderModel.setName("TestDemo");


            buttonModel1 = simpleButtonModelCreator(3, 1, "reply", "correct", "#042557", "", "<font color=\"#ffffff\" size=\"20\">Correct</font>");
            buttonModel2 = simpleButtonModelCreator(3, 1, "reply", "other", "#042557", "", "<font color=\"#ffffff\" size=\"20\">Other</font>");
            customTextMessageModel.setText("Your number is "+ subscribeModel.getMessage().getText() +". Confirm number.");


            buttonModels.add(buttonModel1);
            buttonModels.add(buttonModel2);

            keyBoardModel.setType("keyboard");
            keyBoardModel.setInputFieldState("hidden");
            keyBoardModel.setButtonModels(buttonModels);

            customTextMessageModel.setReceiver(senderId);
            customTextMessageModel.setSenderModel(senderModel);
            customTextMessageModel.setType("text");
            customTextMessageModel.setMin_api_version(subscribeModel.getSender().getApi_version());
            customTextMessageModel.setKeyBoardModel(keyBoardModel);

            String subs = MyHttpRequest.subscribeService(customTextMessageModel, auth);
            System.out.println("validNumber: " + validNumber);

            return "correct";

        }
        else
            return "wrong";
    }

    public void richMediaLoadNews(String request, String type)
    {

        List<ContentModel> cont = TableController.contentResults(type);

        System.out.println("richMediaLoader");
        SubscribeModel subscribeModel = new Gson().fromJson(request, SubscribeModel.class);
        List<ButtonModel> buttonModels = new ArrayList<>();

        ResourceBundle resource = ResourceBundle.getBundle("config");
        String auth = resource.getString("authkey");

        System.out.println("type: " + subscribeModel.getEvent());

        String senderId = subscribeModel.getSender().getId();

        System.out.println("senderId: " + senderId);

        ReplyModel replyModel = new ReplyModel();
        RichMedia richMedia = new RichMedia();

        ButtonModel buttonModel1 = new ButtonModel();
        ButtonModel buttonModel2 = new ButtonModel();

        replyModel.setReceiver(senderId);
        replyModel.setType("rich_media");
        replyModel.setMin_api_version(subscribeModel.getSender().getApi_version());

        richMedia.setType("rich_media");
        richMedia.setButtonsGroupColumns(6);
        richMedia.setButtonsGroupRows(6);
        richMedia.setBgColor("#FFFFFF");

        buttonModel1.setColumns(6);
        buttonModel1.setRows(5);
        buttonModel1.setActionType("open-url");
        buttonModel1.setActionBody(cont.get(0).getLink());

        System.out.println(cont.get(0).getLink());

        buttonModel1.setSilent(true);
        buttonModel1.setImage(cont.get(0).getImagePath());

        System.out.println(cont.get(0).getImagePath());

        buttonModel2.setColumns(6);
        buttonModel2.setRows(1);
        buttonModel2.setActionType("open-url");
        buttonModel2.setActionBody(cont.get(0).getLink());
        buttonModel2.setText("<b>" + cont.get(0).getContent() + "</b>");

        System.out.println(cont.get(0).getContent());

        buttonModel2.setSilent(true);
        buttonModel2.setTextSize("medium");
        buttonModel2.setTextVAlign("middle");
        buttonModel2.setTextHAlign("left");

        buttonModels.add(buttonModel1);
        buttonModels.add(buttonModel2);

        richMedia.setButtons(buttonModels);

        replyModel.setRich_media(richMedia);

        String s = MyHttpRequest.replyService(replyModel, auth);
        System.out.println(s);


    }

    public void loadTestMenu(String request)
    {

        System.out.println("loadTestMenu");
        SubscribeModel subscribeModel = new Gson().fromJson(request, SubscribeModel.class);
        List<ButtonModel> buttonModels = new ArrayList<>();

        System.out.println("type: " + subscribeModel.getEvent());

        String senderId = subscribeModel.getSender().getId();

        System.out.println("senderId: " + senderId);

        ResourceBundle resource = ResourceBundle.getBundle("config");
        String auth = resource.getString("authkey");


        CustomTextMessageModel customTextMessageModel = new CustomTextMessageModel();
        SenderModel senderModel = new SenderModel();
        keyBoardModel keyBoardModel = new keyBoardModel();


        ButtonModel buttonModels1 = buttonModelCreator(4, 1, "none", "", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png");
        ButtonModel buttonModels2 = buttonModelCreator(2, 1, "reply", "moremenus", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/more.png");


        buttonModels.add(buttonModels1);
        buttonModels.add(buttonModels2);



        keyBoardModel.setType("keyboard");
        keyBoardModel.setInputFieldState("hidden");
        keyBoardModel.setButtonModels(buttonModels);


        customTextMessageModel.setReceiver(senderId);
        customTextMessageModel.setMin_api_version(subscribeModel.getSender().getApi_version());

        senderModel.setName("TestDemo");

        customTextMessageModel.setSenderModel(senderModel);

        customTextMessageModel.setKeyBoardModel(keyBoardModel);

        customTextMessageModel.setType("text");
        customTextMessageModel.setText("Thank you subscribe this service");

        String subs = MyHttpRequest.subscribeService(customTextMessageModel, auth);
        System.out.println("subs: " + subs);

    }

    public void loadMenu(String requestContent)
    {

        Gson gson = new Gson();
        System.out.println("loadMenu");
        SubscribeModel subscribeModel = gson.fromJson(requestContent, SubscribeModel.class);
        List<ButtonModel> buttonModels = new ArrayList<>();

        ResourceBundle resource = ResourceBundle.getBundle("config");
        String auth = resource.getString("authkey");

        System.out.println("type: " + subscribeModel.getEvent());

        String senderId = subscribeModel.getSender().getId();

        System.out.println("senderId: " + senderId);


        CustomTextMessageModel customTextMessageModel = new CustomTextMessageModel();
        SenderModel senderModel = new SenderModel();
        keyBoardModel keyBoardModel = new keyBoardModel();


        ButtonModel buttonModels1 = buttonModelCreator(2, 1, "reply", "balance", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/accountbalance.png");
        ButtonModel buttonModels2 = buttonModelCreator(2, 1, "reply", "credit", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/buycredits.png");
        ButtonModel buttonModels3 = buttonModelCreator(2, 1, "reply", "history", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/transactionhistory.png");
        ButtonModel buttonModels4 = buttonModelCreator(4, 1, "reply", "", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png");
        ButtonModel buttonModels5 = buttonModelCreator(2, 1, "reply", "hidemenu", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/more.png");


        buttonModels.add(buttonModels1);

        buttonModels.add(buttonModels2);
        buttonModels.add(buttonModels3);
        buttonModels.add(buttonModels4);
        buttonModels.add(buttonModels5);

        keyBoardModel.setType("keyboard");
        keyBoardModel.setInputFieldState("hidden");
        keyBoardModel.setButtonModels(buttonModels);


        customTextMessageModel.setReceiver(senderId);
        customTextMessageModel.setMin_api_version(subscribeModel.getSender().getApi_version());

        senderModel.setName(subscribeModel.getSender().getName());

        customTextMessageModel.setSenderModel(senderModel);

        customTextMessageModel.setKeyBoardModel(keyBoardModel);

        String subs = MyHttpRequest.subscribeService(customTextMessageModel, auth);
        System.out.println("subs: " + subs);
    }

    public void selectPaymentMethod(String requestContent)
    {

        Gson gson = new Gson();
        System.out.println("loadMenu");
        SubscribeModel subscribeModel = gson.fromJson(requestContent, SubscribeModel.class);
        List<ButtonModel> buttonModels = new ArrayList<>();

        ResourceBundle resource = ResourceBundle.getBundle("config");
        String auth = resource.getString("authkey");

        System.out.println("type: " + subscribeModel.getEvent());

        String senderId = subscribeModel.getSender().getId();

        System.out.println("senderId: " + senderId);


        CustomTextMessageModel customTextMessageModel = new CustomTextMessageModel();
        SenderModel senderModel = new SenderModel();
        keyBoardModel keyBoardModel = new keyBoardModel();


        ButtonModel buttonModel1 = simpleButtonModelCreator(3, 1, "reply", "creditc", "#042557", "", "<font color=\"#ffffff\" size=\"20\">Credit</font>");
        ButtonModel buttonModel2 = simpleButtonModelCreator(3, 1, "reply", "debitc", "#042557", "", "<font color=\"#ffffff\" size=\"20\">Debit</font>");

        buttonModels.add(buttonModel1);
        buttonModels.add(buttonModel2);

        keyBoardModel.setType("keyboard");
        keyBoardModel.setInputFieldState("hidden");
        keyBoardModel.setButtonModels(buttonModels);


        customTextMessageModel.setReceiver(senderId);
        customTextMessageModel.setMin_api_version(subscribeModel.getSender().getApi_version());

        senderModel.setName(subscribeModel.getSender().getName());

        customTextMessageModel.setSenderModel(senderModel);

        customTextMessageModel.setKeyBoardModel(keyBoardModel);

        String subs = MyHttpRequest.subscribeService(customTextMessageModel, auth);
        System.out.println("subs: " + subs);


    }

    public void moreMenus(String requestContent)
    {

        Gson gson = new Gson();
        System.out.println("loadMenu");
        SubscribeModel subscribeModel = gson.fromJson(requestContent, SubscribeModel.class);
        List<ButtonModel> buttonModels = new ArrayList<>();

        ResourceBundle resource = ResourceBundle.getBundle("config");
        String auth = resource.getString("authkey");

        System.out.println("type: " + subscribeModel.getEvent());

        String senderId = subscribeModel.getSender().getId();

        System.out.println("senderId: " + senderId);


        CustomTextMessageModel customTextMessageModel = new CustomTextMessageModel();
        SenderModel senderModel = new SenderModel();
        keyBoardModel keyBoardModel = new keyBoardModel();


        ButtonModel buttonModels1 = buttonModelCreator(4, 1, "none", "", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png");
        ButtonModel buttonModels2 = buttonModelCreator(2, 1, "reply", "moremenus", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/more.png");


        buttonModels.add(buttonModels1);
        buttonModels.add(buttonModels2);


        keyBoardModel.setType("keyboard");
        keyBoardModel.setInputFieldState("hidden");
        keyBoardModel.setButtonModels(buttonModels);


        customTextMessageModel.setReceiver(senderId);
        customTextMessageModel.setMin_api_version(subscribeModel.getSender().getApi_version());

        senderModel.setName(subscribeModel.getSender().getName());

        customTextMessageModel.setSenderModel(senderModel);

        customTextMessageModel.setKeyBoardModel(keyBoardModel);

        String subs = MyHttpRequest.subscribeService(customTextMessageModel, auth);
        System.out.println("subs: " + subs);
    }

    public boolean checkSpecialCharacters(String text)
    {
        Pattern pattern = Pattern.compile("[a-zA-Z0-9]*");

        Matcher matcher = pattern.matcher(text);

        if (!matcher.matches()) {
            return false;
        } else {
            return true;
        }
    }


%>