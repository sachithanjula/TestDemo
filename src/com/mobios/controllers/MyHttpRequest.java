package com.mobios.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mobios.models.*;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class MyHttpRequest
{

    public static String sendRequest(SampleMsgModel sampleMsgModel, String key)
    {

        try {

            System.out.println("viber bot save block");
            CloseableHttpClient httpClient = HttpClients.createDefault();
            String postUrl = "https://chatapi.viber.com/pa/send_message";
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            HttpPost post = new HttpPost(postUrl);
            StringEntity postingString = new StringEntity(gson.toJson(sampleMsgModel)); //convert to json

            System.out.println(gson.toJson(sampleMsgModel));

            post.setEntity(postingString);
            post.setHeader("X-Viber-Auth-Token", key);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            System.out.println("stringBuffer: " + stringBuffer);

            System.out.println("Response code  : " + response.getStatusLine().getStatusCode());
            System.out.println("Response phrase: " + response.getStatusLine().getReasonPhrase());

            int responseCode = response.getStatusLine().getStatusCode();


            System.out.println(stringBuffer.toString());

            return "success";

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return "fail";

    }


    public static String sendMessage(TextMessageModel textMessageModel, String key)
    {

        try {

            System.out.println("sendSMS");
            CloseableHttpClient httpClient = HttpClients.createDefault();
            String postUrl = "https://chatapi.viber.com/pa/send_message";
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            HttpPost post = new HttpPost(postUrl);
            StringEntity postingString = new StringEntity(gson.toJson(textMessageModel)); //convert to json

            System.out.println(gson.toJson(textMessageModel));

            post.setEntity(postingString);
            post.setHeader("X-Viber-Auth-Token", key);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            System.out.println("stringBuffer: " + stringBuffer);

            System.out.println("Response code  : " + response.getStatusLine().getStatusCode());
            System.out.println("Response phrase: " + response.getStatusLine().getReasonPhrase());

            int responseCode = response.getStatusLine().getStatusCode();


            System.out.println(stringBuffer.toString());

            return "msg send";

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return "msg not send";

    }

    public static String subscribeService(CustomTextMessageModel customTextMessageModel, String key)
    {

        try {

            System.out.println("subscribed");
            CloseableHttpClient httpClient = HttpClients.createDefault();
            String postUrl = "https://chatapi.viber.com/pa/send_message";
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            HttpPost post = new HttpPost(postUrl);
            StringEntity postingString = new StringEntity(gson.toJson(customTextMessageModel)); //convert to json

            System.out.println(gson.toJson(customTextMessageModel));

            post.setEntity(postingString);
            post.setHeader("X-Viber-Auth-Token", key);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            System.out.println("stringBuffer: " + stringBuffer);

            System.out.println("Response code  : " + response.getStatusLine().getStatusCode());
            System.out.println("Response phrase: " + response.getStatusLine().getReasonPhrase());

            int responseCode = response.getStatusLine().getStatusCode();


            System.out.println(stringBuffer.toString());

            return "subscribed";

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return "not subscribed";

    }

    public static String replyService(ReplyModel replyModel, String key)
    {

        try {

            System.out.println("replyModel");
            CloseableHttpClient httpClient = HttpClients.createDefault();
            String postUrl = "https://chatapi.viber.com/pa/send_message";
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            HttpPost post = new HttpPost(postUrl);
            StringEntity postingString = new StringEntity(gson.toJson(replyModel),"UTF-8"); //convert to json

            System.out.println(gson.toJson(replyModel));

            post.setEntity(postingString);
            post.setHeader("X-Viber-Auth-Token", key);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            System.out.println("stringBuffer: " + stringBuffer);

            System.out.println("Response code  : " + response.getStatusLine().getStatusCode());
            System.out.println("Response phrase: " + response.getStatusLine().getReasonPhrase());

            int responseCode = response.getStatusLine().getStatusCode();


            System.out.println(stringBuffer.toString());

            return "replied";

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return "not replied";

    }

    public static String broadCastService(BroadcastUsersModel broadcastUsersModel, String key)
    {

        try {

            System.out.println("replyModel");
            CloseableHttpClient httpClient = HttpClients.createDefault();
            String postUrl = "https://chatapi.viber.com/pa/broadcast_message";
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            HttpPost post = new HttpPost(postUrl);
            StringEntity postingString = new StringEntity(gson.toJson(broadcastUsersModel),"UTF-8"); //convert to json

            System.out.println(gson.toJson(broadcastUsersModel));

            post.setEntity(postingString);
            post.setHeader("X-Viber-Auth-Token", key);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            System.out.println("stringBuffer: " + stringBuffer);

            System.out.println("Response code  : " + response.getStatusLine().getStatusCode());
            System.out.println("Response phrase: " + response.getStatusLine().getReasonPhrase());

            int responseCode = response.getStatusLine().getStatusCode();


            System.out.println(stringBuffer.toString());

            return "sent";

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return "not send";

    }

    public static String broadCastImagesService(BroadcastImageUsersModel broadcastUsersModel, String key)
    {

        try {

            System.out.println("replyModel");
            CloseableHttpClient httpClient = HttpClients.createDefault();
            String postUrl = "https://chatapi.viber.com/pa/broadcast_message";
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            HttpPost post = new HttpPost(postUrl);
            StringEntity postingString = new StringEntity(gson.toJson(broadcastUsersModel),"UTF-8"); //convert to json

            System.out.println(gson.toJson(broadcastUsersModel));

            post.setEntity(postingString);
            post.setHeader("X-Viber-Auth-Token", key);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            System.out.println("stringBuffer: " + stringBuffer);

            System.out.println("Response code  : " + response.getStatusLine().getStatusCode());
            System.out.println("Response phrase: " + response.getStatusLine().getReasonPhrase());

            int responseCode = response.getStatusLine().getStatusCode();


            System.out.println(stringBuffer.toString());

            return "sent";

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return "not send";

    }

    public static String broadCastVideoService(BroadcastVideoUsersModel broadcastUsersModel, String key)
    {

        try {

            System.out.println("replyModel");
            CloseableHttpClient httpClient = HttpClients.createDefault();
            String postUrl = "https://chatapi.viber.com/pa/broadcast_message";
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            HttpPost post = new HttpPost(postUrl);
            StringEntity postingString = new StringEntity(gson.toJson(broadcastUsersModel),"UTF-8"); //convert to json

            System.out.println(gson.toJson(broadcastUsersModel));

            post.setEntity(postingString);
            post.setHeader("X-Viber-Auth-Token", key);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            System.out.println("stringBuffer: " + stringBuffer);

            System.out.println("Response code  : " + response.getStatusLine().getStatusCode());
            System.out.println("Response phrase: " + response.getStatusLine().getReasonPhrase());

            int responseCode = response.getStatusLine().getStatusCode();


            System.out.println(stringBuffer.toString());

            return "sent";

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return "not send";

    }

    public static String broadCastFileService(BroadcastFileUsersModel broadcastUsersModel, String key)
    {

        try {

            System.out.println("replyModel");
            CloseableHttpClient httpClient = HttpClients.createDefault();
            String postUrl = "https://chatapi.viber.com/pa/broadcast_message";
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            HttpPost post = new HttpPost(postUrl);
            StringEntity postingString = new StringEntity(gson.toJson(broadcastUsersModel),"UTF-8"); //convert to json

            System.out.println(gson.toJson(broadcastUsersModel));

            post.setEntity(postingString);
            post.setHeader("X-Viber-Auth-Token", key);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            System.out.println("stringBuffer: " + stringBuffer);

            System.out.println("Response code  : " + response.getStatusLine().getStatusCode());
            System.out.println("Response phrase: " + response.getStatusLine().getReasonPhrase());

            int responseCode = response.getStatusLine().getStatusCode();


            System.out.println(stringBuffer.toString());

            return "sent";

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return "not send";

    }

}
