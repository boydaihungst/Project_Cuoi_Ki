/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DrAgOn
 */
public class TimeUtils {

    public static final int SPRING = 0;
    public static final int SUMMER = 1;
    public static final int AUTUMN = 2;
    public static final int WINTER = 3;

    public TimeUtils() {
    }

    public static Date getStartTimeOfMonth() {
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH);
        String time = "";
        if (month >= 0 && month <= 2) {
            time += "-01-01";
        } else if (month >= 3 && month <= 5) {
            time += "-04-01";
        } else if (month >= 6 && month <= 8) {
            time += "-07-01";
        } else if (month >= 9 && month <= 11) {
            time += "-10-01";
        }
        time = Year.now().getValue() + "" + time;
        return Date.valueOf(time);
    }
}
