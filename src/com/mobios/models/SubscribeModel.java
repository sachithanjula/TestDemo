package com.mobios.models;

public class SubscribeModel
{
    private String event;
    private long timestamp;
    private String chat_hostname;
    private long message_token;
    private UserModel sender;
    private MessageModel message;
    private boolean silent;

    public SubscribeModel() {}

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

    public UserModel getSender() {
        return sender;
    }

    public void setSender(UserModel sender) {
        this.sender = sender;
    }

    public MessageModel getMessage() {
        return message;
    }

    public void setMessage(MessageModel message) {
        this.message = message;
    }

    public boolean isSilent() {
        return silent;
    }

    public void setSilent(boolean silent) {
        this.silent = silent;
    }
}
