package com.mobios.models;

public class PictureMessage extends TextMessageModel
{
    private String media;
    private String thumbnail;

    public PictureMessage() {
    }

    public PictureMessage(String media, String thumbnail) {
        this.media = media;
        this.thumbnail = thumbnail;
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
}
