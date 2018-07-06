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

    public static final String SPRING = "XUÂN";
    public static final String SUMMER = "HÈ";
    public static final String AUTUMN = "THU";
    public static final String WINTER = "ĐÔNG";
    public static final int CURRENT_SEASON = 4;
    public static final int PRE_SEASON = 5;
    public static final int PRE_2_SEASON = 6;
    public static final int BY_YEAR = 7;
    public static final int BY_DAY = 8;
    public static final int BY_SEASON = 9;

    public TimeUtils() {
    }

    public static Calendar toCalendar(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal;
    }

    public static String getSeasonYearName(Date _time) {
        String s = "";
        Calendar time = toCalendar(_time);
        int month = time.get(Calendar.MONTH);
        int year = time.get(Calendar.YEAR);
        if (month >= 0 && month <= 2) {
            s += SPRING ;
        } else if (month >= 3 && month <= 5) {
           s += SUMMER ;
        } else if (month >= 6 && month <= 8) {
            s += AUTUMN ;
        } else if (month >= 9 && month <= 11) {
            s += WINTER ;
        }
        s+=" "+year;
        return s;
    }

    public static String getStopTimeOfMonth(int _time) {
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH);
        String time = "";
        switch (_time) {
            case CURRENT_SEASON: {
                if (month >= 0 && month <= 2) {
                    time += "-03-31";
                } else if (month >= 3 && month <= 5) {
                    time += "-06-30";
                } else if (month >= 6 && month <= 8) {
                    time += "-09-30";
                } else if (month >= 9 && month <= 11) {
                    time += "-12-31";
                }
                break;
            }
            case PRE_SEASON: {
                if (month >= 0 && month <= 2) {
                    time += "-12-31";
                    return Year.now().getValue() + "" + time;
                } else if (month >= 3 && month <= 5) {
                    time += "-03-31";
                } else if (month >= 6 && month <= 8) {
                    time += "-06-30";
                } else if (month >= 9 && month <= 11) {
                    time += "-09-30";
                }

                break;
            }
            case PRE_2_SEASON: {
                if (month >= 0 && month <= 2) {
                    time += "-09-30";
                    return Year.now().getValue() - 1 + "" + time;
                } else if (month >= 3 && month <= 5) {
                    time += "-12-31";
                    return Year.now().getValue() - 1 + "" + time;
                } else if (month >= 6 && month <= 8) {
                    time += "-03-31";
                } else if (month >= 9 && month <= 11) {
                    time += "-06-30";
                }
                break;
            }
            default:
                break;
        }
        time = Year.now().getValue() + "" + time;
        return time;
    }

    public static String getStartTimeOfMonth(int _month) {
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH);
        String time = "";
        switch (_month) {
            case CURRENT_SEASON: {
                if (month >= 0 && month <= 2) {
                    time += "-01-01";
                } else if (month >= 3 && month <= 5) {
                    time += "-04-01";
                } else if (month >= 6 && month <= 8) {
                    time += "-07-01";
                } else if (month >= 9 && month <= 11) {
                    time += "-10-01";
                }
                break;
            }
            case PRE_SEASON: {
                if (month >= 0 && month <= 2) {
                    time += "-10-01";
                    return Year.now().getValue() + "" + time;
                } else if (month >= 3 && month <= 5) {
                    time += "-01-01";
                } else if (month >= 6 && month <= 8) {
                    time += "-04-01";
                } else if (month >= 9 && month <= 11) {
                    time += "-07-01";
                }

                break;
            }
            case PRE_2_SEASON: {
                if (month >= 0 && month <= 2) {
                    time += "-07-01";
                    return Year.now().getValue() - 1 + "" + time;
                } else if (month >= 3 && month <= 5) {
                    time += "-10-01";
                    return Year.now().getValue() - 1 + "" + time;
                } else if (month >= 6 && month <= 8) {
                    time += "-01-01";
                } else if (month >= 9 && month <= 11) {
                    time += "-04-01";
                }
                break;
            }
            default:
                break;
        }
        time = Year.now().getValue() + "" + time;
        return time;
    }
}
