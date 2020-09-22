package com.mobios.models;

import com.google.gson.annotations.SerializedName;

public class SenderModel
{
    @SerializedName("name")
    private String name;

    @SerializedName("avatar")
    private String avatar;

    public SenderModel() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
