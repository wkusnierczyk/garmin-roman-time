using Toybox.Application;
using Toybox.WatchUi;

import Toybox.Lang;

using PropertyUtils;


class RomanTimeApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new RomanTimeView() ];
    }

    function onSettingsChanged() as Void {
        WatchUi.requestUpdate();
    }

    function getSettingsView() {
        return [ new RomanTimeSettingsMenu(), new RomanTimeSettingsDelegate() ] ;
    }

}
