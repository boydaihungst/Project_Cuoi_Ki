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

//    public static final String SPRING = "XUÂN";
//    public static final String SUMMER = "HÈ";
//    public static final String AUTUMN = "THU";
//    public static final String WINTER = "ĐÔNG";
    public static final String SPRING = "SPRING";
    public static final String SUMMER = "SUMMER";
    public static final String AUTUMN = "AUTUMN";
    public static final String WINTER = "WINTER";
    public static final int CURRENT_SEASON = 4;
    public static final int PRE_SEASON = 5;
    public static final int PRE_2_SEASON = 6;
    public static final int BY_YEAR = 7;
    public static final int BY_DAY = 8;
    public static final int BY_SEASON = 9;

    public TimeUtils() {
    }

    public static String seasonEngtoVn(String season) {
        return season.replaceFirst(SPRING, "Xuân")
                .replaceFirst(SUMMER, "Hè")
                .replaceFirst(AUTUMN, "Thu")
                .replaceFirst(WINTER, "Đông");
    }

    public static Calendar toCalendar(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal;
    }
    public static String convertSeasonYearToStartDate(String season,int year){
        switch(season.toUpperCase()){
            case SPRING :{
                return year+"-01-01";
            }
            case SUMMER:{
                return year+"-04-01";
            }
            case AUTUMN:{
                return year+"-07-01";
            }
            case WINTER:{
                return year+"-10-01";
            }
            default: return "";
        }
    }
    public static String convertSeasonYearToStopDate(String season,int year){
        switch(season.toUpperCase()){
            case SPRING:{
                return year+"-03-31";
            }
            case SUMMER:{
                return year+"-06-30";
            }
            case AUTUMN:{
                return year+"-09-30";
            }
            case WINTER:{
                return year+"-12-31";
            }
            default: return "";
        }
    }
    public static String getSeasonYearByDate(Date _time) {
        String s = "";
        Calendar time = toCalendar(_time);
        int month = time.get(Calendar.MONTH);
        int year = time.get(Calendar.YEAR);
        if (month >= 0 && month <= 2) {
            s += SPRING;
        } else if (month >= 3 && month <= 5) {
            s += SUMMER;
        } else if (month >= 6 && month <= 8) {
            s += AUTUMN;
        } else if (month >= 9 && month <= 11) {
            s += WINTER;
        }
        s += " " + year;
        return s;
    }

    public static String getStopTimeOfSeason(int _time) {
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

    public static String getStartTimeOfSeason(int _month) {
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
