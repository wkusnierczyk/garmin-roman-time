using Toybox.Application;
using Toybox.Graphics;
using Toybox.WatchUi;


// Typesetting
const SEPARATOR = " ";

const TWO_LINE_HOUR_VERTICAL_CORRECTION = 10;
const TWO_LINE_MINUTES_VERTICAL_CORRECTION = 5;


// Colors
const COLOR_LT_RED = 0xFFAAAA; 
const HOURS_COLOR = Graphics.COLOR_WHITE;
const MINUTES_COLOR = COLOR_LT_RED;


// Settings
const SETTINGS_LABEL = Application.loadResource(Rez.Strings.AppName);
const LAYOUT_SETTING_LABEL = Application.loadResource(Rez.Strings.LayoutSettingLabel);
const SINGLE_LINE_SETTING_LABEL = Application.loadResource(Rez.Strings.SingleLineLayoutSettingLabel);
const TWO_LINE_SETTING_LABEL = Application.loadResource(Rez.Strings.TwoLineLayoutSettingLabel);

const LAYOUT_PROPERTY_ID = "LayoutMode";
const SINGLE_LINE_SETTING = 0;
const TWO_LINE_SETTING = 1;
const DEFAULT_LAYOUT_SETTING = SINGLE_LINE_SETTING;


// Fonts
const SINGLE_LINE_HOUR_FONT = WatchUi.loadResource(Rez.Fonts.SingleLineHourFont);
const DOUBLE_LINE_HOUR_FONT = WatchUi.loadResource(Rez.Fonts.DoubleLineHourFont);
const SINGLE_LINE_MINUTES_FONT = WatchUi.loadResource(Rez.Fonts.SingleLineMinutesFont);
const DOUBLE_LINE_MINUTES_FONT = WatchUi.loadResource(Rez.Fonts.DoubleLineMinutesFont);
