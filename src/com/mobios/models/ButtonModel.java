package com.mobios.models;

import com.google.gson.annotations.SerializedName;

public class ButtonModel
{
    @SerializedName("Columns")
    private Integer columns;

    @SerializedName("Rows")
    private Integer rows;

    @SerializedName("ActionType")
    private String actionType;

    @SerializedName("ActionBody")
    private String actionBody;

    @SerializedName("BgColor")
    private String bgColor;

    @SerializedName("Image")
    private String image;

    @SerializedName("Text")
    private String text;

    @SerializedName("TextSize")
    private String textSize;

    @SerializedName("TextHAlign")
    private String textHAlign;

    @SerializedName("TextVAlign")
    private String textVAlign;

    @SerializedName("Silent")
    private boolean silent;

    public ButtonModel() {}

    public Integer getColumns() {
        return columns;
    }

    public void setColumns(Integer columns) {
        this.columns = columns;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getActionType() {
        return actionType;
    }

    public void setActionType(String actionType) {
        this.actionType = actionType;
    }

    public String getActionBody() {
        return actionBody;
    }

    public void setActionBody(String actionBody) {
        this.actionBody = actionBody;
    }

    public String getBgColor() {
        return bgColor;
    }

    public void setBgColor(String bgColor) {
        this.bgColor = bgColor;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTextSize() {
        return textSize;
    }

    public void setTextSize(String textSize) {
        this.textSize = textSize;
    }

    public String getTextHAlign() {
        return textHAlign;
    }

    public void setTextHAlign(String textHAlign) {
        this.textHAlign = textHAlign;
    }

    public String getTextVAlign() {
        return textVAlign;
    }

    public void setTextVAlign(String textVAlign) {
        this.textVAlign = textVAlign;
    }

    public boolean isSilent() {
        return silent;
    }

    public void setSilent(boolean silent) {
        this.silent = silent;
    }
}
