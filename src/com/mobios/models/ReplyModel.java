package com.mobios.models;

public class ReplyModel
{
    private String receiver;
    private String type;
    private int min_api_version;
    private RichMedia rich_media;

    public ReplyModel() {
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getMin_api_version() {
        return min_api_version;
    }

    public void setMin_api_version(int min_api_version) {
        this.min_api_version = min_api_version;
    }

    public RichMedia getRich_media() {
        return rich_media;
    }

    public void setRich_media(RichMedia rich_media) {
        this.rich_media = rich_media;
    }
}
