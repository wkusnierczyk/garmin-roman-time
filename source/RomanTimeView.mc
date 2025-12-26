using Toybox.Application.Properties;
using Toybox.WatchUi;

import Toybox.Graphics;
import Toybox.Lang;


class RomanTimeView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onUpdate(dc as Dc) as Void {

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        var clockTime = System.getClockTime();
        var hours = RomanTime.toRoman(clockTime.hour);
        var minutes = RomanTime.toRoman(clockTime.min);
        var seconds = RomanTime.toRoman(clockTime.sec);

        // For debugging only: widest hour and minutes string
        // hours = "XXIV";
        // minutes = "XXXVIII";

        var currentLayout = PropertyUtils.getPropertyElseDefault(LAYOUT_PROPERTY_ID, DEFAULT_LAYOUT_SETTING);
        switch (currentLayout) {
            case 0:
                _drawOneLineTime(dc, hours, minutes, seconds);
                break;
            case 1:
                _drawTwoLineTime(dc, hours, minutes, seconds);
                break;
            default:
                break;
        }

    }

    function _drawOneLineTime(dc as Dc, hours as String, minutes as String, seconds as String) as Void {

        var width = dc.getWidth();
        var height = dc.getHeight();
        
        var hoursFont = SINGLE_LINE_HOUR_FONT;
        var minutesFont = SINGLE_LINE_MINUTES_FONT;

        var hoursWidth = dc.getTextWidthInPixels(hours, hoursFont);
        var minutesWidth = dc.getTextWidthInPixels(minutes, minutesFont);
        var separatorWidth = dc.getTextWidthInPixels(SEPARATOR, minutesFont);
        var totalWidth = hoursWidth + separatorWidth + minutesWidth;

        var currentX = (width - totalWidth) / 2;
        var centerY = height / 2;

        dc.setColor(HOURS_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, centerY, hoursFont, hours, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        currentX += hoursWidth + separatorWidth;

        dc.setColor(MINUTES_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, centerY, minutesFont, minutes, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);

    }

    function _drawTwoLineTime(dc as Dc, hours as String, minutes as String, seconds as String) as Void {

        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        var hoursFont = DOUBLE_LINE_HOUR_FONT;
        var minutesFont = DOUBLE_LINE_MINUTES_FONT;

        var hoursDimensions = dc.getTextDimensions(hours, hoursFont);
        var hoursHeight = hoursDimensions[1];
        var hoursY = centerY - hoursHeight + TWO_LINE_HOUR_VERTICAL_CORRECTION;
        var minutesY = centerY + TWO_LINE_MINUTES_VERTICAL_CORRECTION;

        dc.setColor(HOURS_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, hoursY, hoursFont, hours, Graphics.TEXT_JUSTIFY_CENTER);

        dc.setColor(MINUTES_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, minutesY, minutesFont, minutes, Graphics.TEXT_JUSTIFY_CENTER);
        
    }

}
