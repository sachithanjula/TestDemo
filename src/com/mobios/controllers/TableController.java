package com.mobios.controllers;

import com.mobios.dbconnection.DBConnection;
import com.mobios.models.ConStartModel;
import com.mobios.models.ContentModel;
import com.mobios.models.StatusModel;
import com.mobios.models.UserLoginModel;

import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TableController {

    public static int userLogin(UserLoginModel userLoginModel)
    {
        int uid = 0;

        Date date = new Date();

        try
        {
            PreparedStatement getUsername = DBConnection.getDbCon().conn.prepareStatement("SELECT * FROM userdetails WHERE username = '" + userLoginModel.getUsername() + "'");

            ResultSet resultSet = getUsername.executeQuery();

            while (resultSet.next()) {
                if (resultSet.getString("username").equals(userLoginModel.getUsername()) && resultSet.getString("password").equals(userLoginModel.getPassword()))
                {
                    uid = resultSet.getInt("id");
                    System.out.println(uid);
                }
            }

            return uid;

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println("login error");
        }

        return uid;

    }


    public static String subscribe(String id)
    {
        System.out.println("subscribe");
        System.out.println(id);

        String sub = "";

        try
        {
            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT subscription FROM event_table WHERE user_id ='"+id+"'");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next())
            {
                sub = resultSet.getString("subscription");
            }

            return sub;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println("ID error");
        }

        return "false";
    }







    public static int saveEvent(ConStartModel conStartModel) {
        System.out.println("saveEvent");

        String userId = "";
        int evt;
        int usrdata;


        Date date = new Date();

        try {

            PreparedStatement searchId = DBConnection.getDbCon().conn.prepareStatement("SELECT user_id FROM event_table WHERE user_id = '" + conStartModel.getUser().getId() + "'");

            ResultSet resultSet = searchId.executeQuery();

            while (resultSet.next()) {
                userId = resultSet.getString("user_id");
                System.out.println("userID: " + userId);
            }

            if (userId.equals(conStartModel.getUser().getId()) && conStartModel.getSubscribed().equals("false")) {
                PreparedStatement updtEvent = DBConnection.getDbCon().conn.prepareStatement("UPDATE event_table SET subscription = 'true' WHERE user_id = '" + userId + "'");
                updtEvent.executeUpdate();
            } else {
                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("INSERT INTO event_table(event, timestamp, chat_hostname, user_id, message_token, subscription, time) VALUES (?, ?, ?, ?, ?, ?, ?)");

                preparedStatement.setObject(1, conStartModel.getEvent());
                preparedStatement.setObject(2, conStartModel.getTimestamp());
                preparedStatement.setObject(3, conStartModel.getChat_hostname());
                preparedStatement.setObject(4, conStartModel.getUser().getId());
                preparedStatement.setObject(5, conStartModel.getMessage_token());
                preparedStatement.setObject(6, "true");
                preparedStatement.setObject(7, date);

                evt = preparedStatement.executeUpdate();
                System.out.println("eventsave: " + evt);

                PreparedStatement pstuser = DBConnection.getDbCon().conn.prepareStatement("INSERT INTO users(user_id, name, language, country, api_version, date) VALUES (?, ?, ?, ?, ?, ?)");
                pstuser.setObject(1, conStartModel.getUser().getId());
                pstuser.setObject(2, conStartModel.getUser().getName());
                pstuser.setObject(3, conStartModel.getUser().getLanguage());
                pstuser.setObject(4, conStartModel.getUser().getCountry());
                pstuser.setObject(5, conStartModel.getUser().getApi_version());
                pstuser.setObject(6, date);

                usrdata = pstuser.executeUpdate();
                System.out.println("userdatasave: " + usrdata);

                return 1;
            }


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("event save error");
        }

        return 0;
    }

    public static int userUnsubscribe(StatusModel statusModel) {
        System.out.println("unsubscribe");

        try {

            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("UPDATE event_table SET subscription = 'false' WHERE user_id = '" + statusModel.getUser_id() + "'");
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = DBConnection.getDbCon().conn.prepareStatement("UPDATE users SET attempt = 0 WHERE user_id = '"+statusModel.getUser_id()+"'");
            preparedStatement1.executeUpdate();

            return 1;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public static int UpdateUserMobile(String userID, String mobile) {
        System.out.println("UpdateUserMobile");

        try {

            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("UPDATE users SET msisdn = '" + mobile + "' WHERE user_id = '" + userID + "'");
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = DBConnection.getDbCon().conn.prepareStatement("UPDATE event_table SET msisdn = '" + mobile + "' WHERE user_id = '" + userID + "'");
            preparedStatement1.executeUpdate();

            return 1;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;

    }

    public static String getUserNumber(String userID) {
        System.out.println("getUserNumber");

        String msisdn = "";

        try {
            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT msisdn FROM users WHERE user_id = '" + userID + "'");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                msisdn = resultSet.getString("msisdn");
                System.out.println(msisdn);
            }

            return msisdn;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "otp send fail";
    }

    public static int updateOTP(String userID, int otp) {
        System.out.println("updateOTP");

        try {

            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("UPDATE users SET otp = '" + otp + "' WHERE user_id = '" + userID + "'");
            preparedStatement.executeUpdate();

            return 1;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;

    }

    public static int validateOTP(String userID, int otp) {
        System.out.println("validateOTP");
        System.out.println("otp: "+otp);
        int otpres = 0;
        int attm = 0;

        try {
            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT otp FROM users WHERE user_id = '" + userID + "' AND otp = '" + otp + "'");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                otpres = resultSet.getInt("otp");
                System.out.println(otpres);
            }

            if (otpres == otp )
            {
                System.out.println("first");
                return 1;
            }
            else
            {
                System.out.println("else");
                PreparedStatement preparedStatement1 = DBConnection.getDbCon().conn.prepareStatement("SELECT attempt FROM users WHERE user_id = '" + userID + "'");
                ResultSet resultSet1 = preparedStatement1.executeQuery();
                while (resultSet1.next()) {
                    attm = resultSet1.getInt("attempt");
                    System.out.println(attm);
                }

                if (attm < 2)
                {
                    System.out.println("attm");
                    PreparedStatement preparedStatement2 = DBConnection.getDbCon().conn.prepareStatement("UPDATE users SET attempt = attempt + 1 WHERE user_id = '"+userID+"'");
                    preparedStatement2.executeUpdate();
                    return 2;
                }
                else
                {
                    PreparedStatement preparedStatement3 = DBConnection.getDbCon().conn.prepareStatement("UPDATE users SET attempt = 0 WHERE user_id = '"+userID+"'");
                    preparedStatement3.executeUpdate();
                    System.out.println("false: 4");
                    return 4;
                }

            }



        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("invalid: 0");

        return 0;
    }

    public static int insertContent(ContentModel contentModel, String type) throws ClassNotFoundException {
        System.out.println("save content");

        int saveContent = 0;
        Date date = new Date();


        try {

//            if (type.equals("videos"))
//            {
//
//                System.out.println("videos");
//
//                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("INSERT INTO videosnewscontent (imagepath, content, link, type, date) VALUES (?, ?, ?, ?, ?)");
//                preparedStatement.setObject(1, contentModel.getImagePath());
//                preparedStatement.setObject(2, contentModel.getContent());
//                preparedStatement.setObject(3, contentModel.getLink());
//                preparedStatement.setObject(4, contentModel.getType());
//                preparedStatement.setObject(5, date);
//
//                saveContent = preparedStatement.executeUpdate();
//            }


                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("INSERT INTO ndbnewscontent (imagepath, content, link, type, msgtype, date) VALUES (?, ?, ?, ?, ?, ?)");
                preparedStatement.setObject(1, contentModel.getImagePath());
                preparedStatement.setObject(2, contentModel.getContent());
                preparedStatement.setObject(3, contentModel.getLink());
                preparedStatement.setObject(4, contentModel.getType());
                preparedStatement.setObject(5, contentModel.getMsgType());
                preparedStatement.setObject(6, date);

                saveContent = preparedStatement.executeUpdate();


//            else if (type.equals("cartoons"))
//            {
//
//                System.out.println("cartoons");
//
//                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("INSERT INTO cartooncontent (imagepath, content, link, type, date) VALUES (?, ?, ?, ?, ?)");
//                preparedStatement.setObject(1, contentModel.getImagePath());
//                preparedStatement.setObject(2, contentModel.getContent());
//                preparedStatement.setObject(3, contentModel.getLink());
//                preparedStatement.setObject(4, contentModel.getType());
//                preparedStatement.setObject(5, date);
//
//                saveContent = preparedStatement.executeUpdate();
//            }
//            else if (type.equals("sports"))
//            {
//
//                System.out.println("sports");
//
//                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("INSERT INTO sportsnewscontent (imagepath, content, link, type, date) VALUES (?, ?, ?, ?, ?)");
//                preparedStatement.setObject(1, contentModel.getImagePath());
//                preparedStatement.setObject(2, contentModel.getContent());
//                preparedStatement.setObject(3, contentModel.getLink());
//                preparedStatement.setObject(4, contentModel.getType());
//                preparedStatement.setObject(5, date);
//
//                saveContent = preparedStatement.executeUpdate();
//            }
//            else
//            {
//
//                System.out.println("biz");
//
//                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("INSERT INTO bizcontent (imagepath, content, link, type, date) VALUES (?, ?, ?, ?, ?)");
//                preparedStatement.setObject(1, contentModel.getImagePath());
//                preparedStatement.setObject(2, contentModel.getContent());
//                preparedStatement.setObject(3, contentModel.getLink());
//                preparedStatement.setObject(4, contentModel.getType());
//                preparedStatement.setObject(5, date);
//
//                saveContent = preparedStatement.executeUpdate();
//            }



        } catch (SQLException e) {
            System.out.println(e);
            e.printStackTrace();
        }

        return saveContent;
    }

    public static List<ContentModel> contentResults(String type) {

        List<ContentModel> contentModels = new ArrayList<>();
        System.out.println("content List");

        try {
            if (type.equals("ndbnews"))
            {

                System.out.println("ndbnews content");

                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT * FROM ndbnewscontent WHERE msgtype = 'imgntxt' ORDER BY id DESC LIMIT 1");
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    contentModels.add(new ContentModel(resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)));
                }
            }
//            else if (type.equals("cartoon"))
//            {
//
//                System.out.println("cartoon content");
//
//                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT * FROM cartooncontent ORDER BY id DESC LIMIT 5");
//                ResultSet resultSet = preparedStatement.executeQuery();
//
//                while (resultSet.next()) {
//                    contentModels.add(new ContentModel(resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)));
//                }
//            }
//
//            else if (type.equals("sports"))
//            {
//
//                System.out.println("sports content");
//
//                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT * FROM sportsnewscontent ORDER BY id DESC LIMIT 5");
//                ResultSet resultSet = preparedStatement.executeQuery();
//
//                while (resultSet.next()) {
//                    contentModels.add(new ContentModel(resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)));
//                }
//            }
//            else if (type.equals("videos"))
//            {
//
//                System.out.println("videos content");
//
//                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT * FROM videosnewscontent ORDER BY id DESC LIMIT 5");
//                ResultSet resultSet = preparedStatement.executeQuery();
//
//                while (resultSet.next()) {
//                    contentModels.add(new ContentModel(resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)));
//                }
//            }
//            else if (type.equals("biz"))
//            {
//
//                System.out.println("biz content");
//
//                PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT * FROM bizcontent ORDER BY id DESC LIMIT 5");
//                ResultSet resultSet = preparedStatement.executeQuery();
//
//                while (resultSet.next()) {
//                    contentModels.add(new ContentModel(resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)));
//                }
//            }

            return contentModels;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public static String getImagePath(String imageTag)
    {
        String path = "";
        try {
            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT img_path FROM images WHERE img_tag = '"+imageTag+"'");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                path = resultSet.getString("img_path");
                System.out.println(path);
            }

            return path;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "NONE";

    }



}
