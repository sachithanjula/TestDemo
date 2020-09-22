package com.mobios.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MobileNoValidator
{
    public static String getValidNumber(String selectedNumber) {
        selectedNumber = selectedNumber.trim();
        String validNumber = "";
        if (selectedNumber.length() == 11) {
            validNumber = selectedNumber;
        } else if (selectedNumber.length() == 10) {
            selectedNumber = selectedNumber.replaceFirst("0", "94");
            validNumber = selectedNumber;

        } else if (selectedNumber.length() == 9) {
            selectedNumber = "94" + selectedNumber;
            validNumber = selectedNumber;

        } else if (selectedNumber.length() == 12) {
            selectedNumber = selectedNumber.replaceFirst("\\+", "");
            validNumber = selectedNumber;

        } else if (selectedNumber.length() == 13) {
            selectedNumber = selectedNumber.replaceFirst("0094", "94");
            validNumber = selectedNumber;
        }
        return validNumber;
    }

    public static Boolean checkValidNumber(String number) {
        Pattern p = Pattern.compile("^(?:0|94|\\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|5|6|7|8)\\d)\\d{6}$");
        Matcher matcher = p.matcher(number);
        return (matcher.find() && matcher.group().equals(number));

    }
}
