package com.mobios.models;

public class ConStartModel
{
    private String event;
    private long timestamp;
    private String chat_hostname;
    private long message_token;
    private String type;
    private UserModel user;
    private String subscribed;

    public ConStartModel() {}

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

    public String getSubscribed() {
        return subscribed;
    }

    public void setSubscribed(String subscribed) {
        this.subscribed = subscribed;
    }
}
