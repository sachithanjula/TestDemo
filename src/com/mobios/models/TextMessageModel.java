package com.mobios.models;

public class TextMessageModel
{
    private String receiver;
    private int min_api_version;
    private SenderModel sender;
    private String type;
    private String text;
    private String  tracking_data;


    public TextMessageModel() {}

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public int getMin_api_version() {
        return min_api_version;
    }

    public void setMin_api_version(int min_api_version) {
        this.min_api_version = min_api_version;
    }

    public SenderModel getSender() {
        return sender;
    }

    public void setSender(SenderModel sender) {
        this.sender = sender;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTracking_data() {
        return tracking_data;
    }

    public void setTracking_data(String tracking_data) {
        this.tracking_data = tracking_data;
    }
}
