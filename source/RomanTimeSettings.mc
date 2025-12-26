using Toybox.Application.Properties;
using Toybox.WatchUi;


class RomanTimeSettingsMenu extends WatchUi.Menu2 {

    function initialize() {

        Menu2.initialize({:title => SETTINGS_LABEL});

        var currentLayout = PropertyUtils.getPropertyElseDefault(LAYOUT_PROPERTY_ID, DEFAULT_LAYOUT_SETTING);
        var currentLayoutLabel = (currentLayout == TWO_LINE_SETTING) ? TWO_LINE_SETTING_LABEL : SINGLE_LINE_SETTING_LABEL;

        addItem(
            new WatchUi.MenuItem(
                LAYOUT_SETTING_LABEL,
                currentLayoutLabel,
                LAYOUT_PROPERTY_ID, 
                null
            )
        );

    }

}


class RomanTimeSettingsDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as WatchUi.MenuItem) as Void {
        if (item.getId().equals(LAYOUT_PROPERTY_ID) && item instanceof WatchUi.MenuItem) {
            var currentLayout = PropertyUtils.getPropertyElseDefault(LAYOUT_PROPERTY_ID, DEFAULT_LAYOUT_SETTING);
            var newLayout = (currentLayout + 1) % 2;
            Properties.setValue(LAYOUT_PROPERTY_ID, newLayout);
            var newLayoutLabel = (newLayout == SINGLE_LINE_SETTING) ? SINGLE_LINE_SETTING_LABEL : TWO_LINE_SETTING_LABEL;
            item.setSubLabel(newLayoutLabel);
        }
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }

}
