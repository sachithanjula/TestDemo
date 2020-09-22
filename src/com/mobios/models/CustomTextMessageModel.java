package com.mobios.models;

import com.google.gson.annotations.SerializedName;

public class CustomTextMessageModel
{
    @SerializedName(value = "receiver")
    private String receiver;

    @SerializedName("min_api_version")
    private int min_api_version;

    @SerializedName("sender")
    private SenderModel senderModel;

    @SerializedName("tracking_data")
    private String tracking_data;

    @SerializedName("type")
    private String type;

    @SerializedName("text")
    private String text;


    @SerializedName("keyboard")
    private keyBoardModel keyBoardModel;

    public CustomTextMessageModel() {}

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

    public SenderModel getSenderModel() {
        return senderModel;
    }

    public void setSenderModel(SenderModel senderModel) {
        this.senderModel = senderModel;
    }

    public String getTracking_data() {
        return tracking_data;
    }

    public void setTracking_data(String tracking_data) {
        this.tracking_data = tracking_data;
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

    public com.mobios.models.keyBoardModel getKeyBoardModel() {
        return keyBoardModel;
    }

    public void setKeyBoardModel(com.mobios.models.keyBoardModel keyBoardModel) {
        this.keyBoardModel = keyBoardModel;
    }
}
