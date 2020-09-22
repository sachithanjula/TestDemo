package com.mobios.models;

import java.util.List;

public class BroadcastVideoUsersModel
{
    private SenderModel sender;
    private int min_api_version;
    private String type;
    private List<String> broadcast_list;
    private keyBoardModel keyboard;
    private String media;
    private String thumbnail;
    private String size;
    private String duration;

    public BroadcastVideoUsersModel() {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<String> getBroadcast_list() {
        return broadcast_list;
    }

    public void setBroadcast_list(List<String> broadcast_list) {
        this.broadcast_list = broadcast_list;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public keyBoardModel getKeyboard() {
        return keyboard;
    }

    public void setKeyboard(keyBoardModel keyboard) {
        this.keyboard = keyboard;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }


    @Override
    public String toString() {
        return "BroadcastVideoUsersModel{" +
                "sender=" + sender +
                ", min_api_version=" + min_api_version +
                ", type='" + type + '\'' +
                ", broadcast_list=" + broadcast_list +
                ", keyboard=" + keyboard +
                ", media='" + media + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", size='" + size + '\'' +
                ", duration='" + duration + '\'' +
                '}';
    }
}
