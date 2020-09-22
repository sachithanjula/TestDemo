package com.mobios.models;

public class StatusModel
{
    private String event;
    private long timestamp;
    private String chat_hostname;
    private long message_token;
    private String user_id;

    public StatusModel() {}

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }

    public String getChat_hostname() {
        return chat_hostname;
    }

    public void setChat_hostname(String chat_hostname) {
        this.chat_hostname = chat_hostname;
    }

    public long getMessage_token() {
        return message_token;
    }

    public void setMessage_token(long message_token) {
        this.message_token = message_token;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
}
