package com.mobios.models;

import com.google.gson.annotations.SerializedName;

public class EventModel
{
    private String event;
    private String silent;
    private String subscribed;

    @SerializedName(value = "user", alternate = "sender")
    private UserModel user;

    public EventModel() {}

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public String getSilent() {
        return silent;
    }

    public void setSilent(String silent) {
        this.silent = silent;
    }

    public String getSubscribed() {
        return subscribed;
    }

    public void setSubscribed(String subscribed) {
        this.subscribed = subscribed;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }
}
