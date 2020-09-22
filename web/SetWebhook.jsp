<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.mobios.controllers.TableController" %>
<%@ page import="com.mobios.models.*" %>
<%@include file="ViberBotMethods.jsp"%>


<%

    try
    {
        System.out.println("setwebHook TestDemo");
        String reqMethod = request.getMethod();

        String requestContent = null;

        Gson gson = null;
        EventModel eventModel = null;
        StatusModel statusModel = null;
        SubscribeModel subscribeModel = null;

        String text = "";
        String name = "";
        String type = "";
        String event = "";
        String mobileNoValid = "";
        String trackID = "";

        if (reqMethod.equals("POST"))
        {

            System.out.println("POST");

            requestContent = readStringContent(request);
            System.out.println(requestContent);

            gson = new Gson();
            MainEvent mainEvent = gson.fromJson(requestContent, MainEvent.class);
            event = mainEvent.getEvent();
            System.out.println("event: "+event);

            if (event.equals("unsubscribed"))
            {
                statusModel = gson.fromJson(requestContent, StatusModel.class);
                TableController.userUnsubscribe(statusModel);
            }

            if (event.equals("conversation_started"))
            {
                eventModel = gson.fromJson(requestContent, EventModel.class);
                name = eventModel.getUser().getName();
            }

            if (event.equals("message"))
            {
                subscribeModel = gson.fromJson(requestContent, SubscribeModel.class);
                text = subscribeModel.getMessage().getText();
                type = subscribeModel.getMessage().getType();
                trackID = subscribeModel.getMessage().getTracking_data();
                System.out.println("trackId: "+trackID);
                System.out.println("type: "+type);
            }

            if (event.equals("delivered") || mainEvent.getEvent().equals("seen"))
            {

                System.out.println("delivered or seen");

                statusModel = gson.fromJson(requestContent, StatusModel.class);
                System.out.println("ID: " + statusModel.getUser_id());

                String subscribe = TableController.subscribe(statusModel.getUser_id());
                System.out.println("subscribe: "+subscribe);


            }
            // ======================================== With track ID ====================================== //

            if (event.equals("message") && trackID != null)
            {
                if (trackID.equals("reg"))
                {
                    try
                    {
                        String firstTwo = text.substring(0, 2);
                        Long.parseLong(text);
                        if ((text.length() == 10 || (text.length() == 11 && firstTwo.equals("94"))) && checkSpecialCharacters(text))
                        {
                            mobileNoValid = setMobileNumber(requestContent);
                            System.out.println("mobileNoValid: "+mobileNoValid);

                            if (mobileNoValid.equals("wrong"))
                            {
                                sendMessage(requestContent, "Incorrect number!!!\nPlease Enter your phone number to continue this service!!!", "reg");
                            }
                        }
                    }
                    catch (NumberFormatException e)
                    {
                        sendMessage(requestContent, "Incorrect number!!!\nPlease Enter your phone number to continue this service!!!", "reg");
                    }
                }
                else if (trackID.equals("sendotp"))
                {
                    try
                    {
                        Integer.parseInt(text);
                        if (text.trim().length() <= 4 && checkSpecialCharacters(text))
                        {
                            int userOtp = Integer.parseInt(text);
                            validateOTP(requestContent, userOtp);
                        }
                        else
                        {
                            sendMessage(requestContent, "OTP do not match. Please retry.", "sendotp");
                        }

                    }
                    catch (NumberFormatException e)
                    {
                        sendMessage(requestContent, "OTP do not match. Please retry.", "sendotp");
                    }
                }

                else if (trackID.equals("credit"))
                {
                    try
                    {
                        Integer.parseInt(text);
                        selectPaymentMethod(requestContent);

                    }
                    catch (NumberFormatException e)
                    {
                        sendMessage(requestContent, "Enter correct amount", "credit");
                    }
                }

            }


            // ======================================== With track ID ====================================== //

            else if (event.equals("message") && text.equals("ndb"))
            {
                sendMessage(requestContent, "Please Enter your phone number to continue this service!!!", "reg");
            }

            else if (event.equals("message") && text.equals("other"))
            {
                sendMessage(requestContent, "Change number. Please enter your mobile number to continue.", "reg");
            }
            else if (event.equals("message") && text.equals("correct"))
            {
                System.out.println("correct");
                sendOTP(requestContent);
            }

            else if (event.equals("message") && text.equals("moremenus"))
            {

                System.out.println("moremenus");

                loadMenu(requestContent);


            }

            else if (event.equals("message") && text.equals("hidemenu"))
            {

                System.out.println("moremenus");

                moreMenus(requestContent);


            }

            else if (event.equals("message") && text.equals("balance"))
            {

                System.out.println("balance");

                sendMessage(requestContent, "Your balance is Rs.1000.00", "balance");
                moreMenus(requestContent);


            }

            else if (event.equals("message") && text.equals("credit"))
            {

                System.out.println("credit");

                sendMessage(requestContent, "Enter amount", "credit");


            }

            else if (event.equals("message") && (text.equals("creditc") || text.equals("debitc")))
            {

                System.out.println("pay method");

                sendMessage(requestContent, "Payment Success!", "payend");
                moreMenus(requestContent);


            }
            else if (event.equals("message") && text.equals("history"))
            {

                System.out.println(" history");

                sendMessage(requestContent, "1. Paid for Abans.\n2. Paid for PICKME\n3. Paid for SINGER", "history");
                moreMenus(requestContent);


            }



            else if (event.equals("conversation_started") && eventModel.getSubscribed().equals("false"))
            {
                System.out.println("sub: " + eventModel.getSubscribed());
                System.out.println("con started");
                ConStartModel conStartModel = gson.fromJson(requestContent, ConStartModel.class);

                ResourceBundle resource = ResourceBundle.getBundle("config");
                String auth = resource.getString("authkey");

                System.out.println("type: " + conStartModel.getEvent());

                String id = conStartModel.getUser().getId();

                System.out.println("TestDemo conversation_started");
                System.out.println("subscribe=================================" + conStartModel.getSubscribed());


                //save to DB
                int save = TableController.saveEvent(conStartModel);

                System.out.println(save);

                List<ButtonModel> buttonModels = new ArrayList<>();

                SampleMsgModel sampleMsgModel = new SampleMsgModel();
                SenderModel senderModel = new SenderModel();
                keyBoardModel keyBoardModel = new keyBoardModel();

//                ButtonModel buttonModel1 = buttonModelCreator(4, 2, "none", " ", "#ffffff", "http://viber.textware.lk/viberastro/neth/news.png");
//                ButtonModel buttonModel2 = buttonModelCreator(2, 2, "reply", "slm", "#ffffff", "http://viber.textware.lk/viberastro/neth/nethreg.png");

                ButtonModel buttonModel1 = simpleButtonModelCreator(4, 1, "none", "", "#ffffff", "http://viber.textware.lk/viberastro/testdemo/mydemologo1.png", "");
                ButtonModel buttonModel2 = simpleButtonModelCreator(2, 1, "reply", "ndb", "#042557", "", "<font color=\"#ffffff\" size=\"25\">Register</font>");


                buttonModels.add(buttonModel1);
                buttonModels.add(buttonModel2);
                keyBoardModel.setType("keyboard");
                keyBoardModel.setInputFieldState("hidden");
                keyBoardModel.setButtonModels(buttonModels);

                senderModel.setName("TestDemo");

                sampleMsgModel.setReceiver(id);
                sampleMsgModel.setApiVersion(conStartModel.getUser().getApi_version());
                sampleMsgModel.setType("text");

                if (name == null)
                {
                    sampleMsgModel.setText("Welcome user . Please subscribe us!");
                }
                else
                {
                    sampleMsgModel.setText("Welcome " + name + " . Please subscribe us!");
                }

                sampleMsgModel.setKeyBoardModel(keyBoardModel);
                sampleMsgModel.setSenderModel(senderModel);

                MyHttpRequest.sendRequest(sampleMsgModel, auth);
            }


       }
    }
    catch (Exception e)
    {
        System.out.println("webhook exception TestDemo");
        System.out.println(e);

    }


%>