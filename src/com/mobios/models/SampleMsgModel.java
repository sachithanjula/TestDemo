package com.mobios.models;

import com.google.gson.annotations.SerializedName;

public class SampleMsgModel
{
    @SerializedName("receiver")
    private String receiver;

    @SerializedName("min_api_version")
    private int apiVersion;

    @SerializedName("sender")
    private SenderModel senderModel;

    @SerializedName("InputFieldState")
    private String InputFieldState;

    @SerializedName("type")
    private String type;

    @SerializedName("text")
    private String text;

    @SerializedName("keyboard")
    private keyBoardModel keyBoardModel;

    public SampleMsgModel() {}

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public int getApiVersion() {
        return apiVersion;
    }

    public void setApiVersion(int apiVersion) {
        this.apiVersion = apiVersion;
    }

    public SenderModel getSenderModel() {
        return senderModel;
    }

    public void setSenderModel(SenderModel senderModel) {
        this.senderModel = senderModel;
    }

    public String getInputFieldState() {
        return InputFieldState;
    }

    public void setInputFieldState(String inputFieldState) {
        InputFieldState = inputFieldState;
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
