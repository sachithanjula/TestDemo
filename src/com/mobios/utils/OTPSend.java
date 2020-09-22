package com.mobios.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class OTPSend
{
    public static String sendSMS(String msisdn, String msg) {


        try {
            msg= URLEncoder.encode(msg, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

//        String url = "http://122.255.29.68:5000/sms/send_sms.php?username=mobios_alert&password=Mo321Ar&src=SMSDEMO&dst="+msisdn+"&msg="+msg+"&dr=1";
        String url = "http://bulksms.hutch.lk/sendsmsmultimask.php?USER=textware&PWD=abc@123&MASK=One%20NDB&NUM="+msisdn+"&MSG="+msg;

        StringBuffer response = null;

        String converted_response = "";

        try {

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            // optional default is GET
            con.setRequestMethod("GET");

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            in.close();

            converted_response = response.toString();

        }catch(Exception e) {
            System.out.println("Exception in Client.sendSMS "+e.toString());
            converted_response = "xxxxxxxxxx_message_not_success_xxxxxxxxxx";
        }
        // print result
        return converted_response;

    }
}
