package com.mobios.models;

import java.util.List;

public class BroadCastKeyboardModel
{
    private SenderModel sender;
    private int min_api_version;
    private List<String> broadcast_list;
    keyBoardModel keyboard;

    public BroadCastKeyboardModel() {
    }

    public SenderModel getSender() {
        return sender;
    }

    public void setSender(SenderModel sender) {
        this.sender = sender;
    }

    public int getMin_api_version() {
        return min_api_version;
    }

    public void setMin_api_version(int min_api_version) {
        this.min_api_version = min_api_version;
    }

    public List<String> getBroadcast_list() {
        return broadcast_list;
    }

    public void setBroadcast_list(List<String> broadcast_list) {
        this.broadcast_list = broadcast_list;
    }

    public keyBoardModel getKeyboard() {
        return keyboard;
    }

    public void setKeyboard(keyBoardModel keyboard) {
        this.keyboard = keyboard;
    }
}
