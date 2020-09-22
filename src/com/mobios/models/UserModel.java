package com.mobios.models;

public class UserModel
{
    private String id;
    private String name;
    private String avatar;
    private String country;
    private String language;
    private int api_version;

    public UserModel() {}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getApi_version() {
        return api_version;
    }

    public void setApi_version(int api_version) {
        this.api_version = api_version;
    }
}
