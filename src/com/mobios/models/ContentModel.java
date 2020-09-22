package com.mobios.models;

import java.util.Date;

public class ContentModel
{
    private String imagePath;
    private String content;
    private String link;
    private String type;
    private String msgType;
    private String size;
    private String dur;
    private String file_name;

    private Date date;

    public ContentModel() {
    }

    public ContentModel(String imagePath, String content, String type, String msgType, Date date) {
        this.imagePath = imagePath;
        this.content = content;
        this.type = type;
        this.msgType = msgType;
        this.date = date;
    }

    public ContentModel(String imagePath, String content, String link) {
        this.imagePath = imagePath;
        this.content = content;
        this.link = link;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }


    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDur() {
        return dur;
    }

    public void setDur(String dur) {
        this.dur = dur;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    @Override
    public String toString() {
        return "ContentModel{" +
                "imagePath='" + imagePath + '\'' +
                ", content='" + content + '\'' +
                ", link='" + link + '\'' +
                ", type='" + type + '\'' +
                ", msgType='" + msgType + '\'' +
                ", date=" + date +
                '}';
    }
}
