package com.mobios.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class keyBoardModel
{
    @SerializedName("Type")
    private String Type;

    @SerializedName("InputFieldState")
    private String InputFieldState;

    @SerializedName("Buttons")
    private List<ButtonModel> buttonModels = null;

    public keyBoardModel() {}

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public String getInputFieldState() {
        return InputFieldState;
    }

    public void setInputFieldState(String inputFieldState) {
        InputFieldState = inputFieldState;
    }

    public List<ButtonModel> getButtonModels() {
        return buttonModels;
    }

    public void setButtonModels(List<ButtonModel> buttonModels) {
        this.buttonModels = buttonModels;
    }
}
