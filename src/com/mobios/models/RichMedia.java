package com.mobios.models;

import java.util.List;

public class RichMedia
{
    private String Type;
    private int ButtonsGroupColumns;
    private int ButtonsGroupRows;
    private String BgColor;
    private List<ButtonModel> Buttons;

    public RichMedia(String type, int buttonsGroupColumns, int buttonsGroupRows, String bgColor, List<ButtonModel> buttons) {
        Type = type;
        ButtonsGroupColumns = buttonsGroupColumns;
        ButtonsGroupRows = buttonsGroupRows;
        BgColor = bgColor;
        Buttons = buttons;
    }

    public RichMedia() {
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public int getButtonsGroupColumns() {
        return ButtonsGroupColumns;
    }

    public void setButtonsGroupColumns(int buttonsGroupColumns) {
        ButtonsGroupColumns = buttonsGroupColumns;
    }

    public int getButtonsGroupRows() {
        return ButtonsGroupRows;
    }

    public void setButtonsGroupRows(int buttonsGroupRows) {
        ButtonsGroupRows = buttonsGroupRows;
    }

    public String getBgColor() {
        return BgColor;
    }

    public void setBgColor(String bgColor) {
        BgColor = bgColor;
    }

    public List<ButtonModel> getButtons() {
        return Buttons;
    }

    public void setButtons(List<ButtonModel> buttons) {
        Buttons = buttons;
    }
}
