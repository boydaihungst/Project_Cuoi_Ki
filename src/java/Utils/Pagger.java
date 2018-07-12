/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

/**
 *
 * @author DrAgOn
 */
public class Pagger {

    private static String generateHyperLink(String label, String urlFormat, int page) {
        return "<button class='btn pagger' onclick=\"document.location.href='" + urlFormat + page + "'\">" +label + "</button>\n";
    }

    public static String generate(int pageIndex, int pageSize, int total,
            String urlFormat, int gap) {
        int NumberOfPage = total / pageSize + (total % pageSize == 0 ? 0 : 1);
        String result = "";
        if (pageIndex > gap) {
            result += generateHyperLink("<i class=\"fa fa-step-backward\"></i>", urlFormat, 1);
        }
        if (pageIndex > 1) {
            result += generateHyperLink("<i class=\"fa fa-caret-left\"></i>", urlFormat, pageIndex - 1);
        }
        for (int i = pageIndex - gap; i <= pageIndex + gap; i++) {
            if (i > 0 && i != pageIndex && i <= NumberOfPage) {
                result += generateHyperLink("" + i, urlFormat, i);
            } else if (i == pageIndex) {
                result += "<button class='btn pagger pagger-disabled' onclick=\"return false;\">" + pageIndex + "</button>\n";
            }
        }
        if (pageIndex < NumberOfPage) {
            result += generateHyperLink("<i class=\"fa fa-caret-right\"></i>", urlFormat, pageIndex + 1);
        }
        if (pageIndex < NumberOfPage - gap) {
            result += generateHyperLink("<i class=\"fa fa-step-forward\"></i>", urlFormat, NumberOfPage);
        }

        return result;
    }
}
