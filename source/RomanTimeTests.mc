using Toybox.Application;
using Toybox.Test;

import Toybox.Lang;

using RomanTime;


const TEST_NAME = "name";
const TEST_INPUT = "input";
const TEST_EXPECTED = "expected";
const TEST_ERROR_TEMPLATE = "Test '$1$' failed: expected '$2$', got '$3$'";

(:test)
function testRomanConversion(logger) {

    var tests = Application.loadResource(Rez.JsonData.RomanTimeTests) as Array<Dictionary>;
    
    for (var i = 0; i < tests.size(); ++i) {
        var test = tests[i] as Dictionary;
        var name = test[TEST_NAME] as String;
        logger.debug(Lang.format("Running test '$1$...", [name]));
        var input = test[TEST_INPUT] as Number;
        var output = RomanTime.toRoman(input);
        var expected = test[TEST_EXPECTED] as String;
        if (!output.equals(expected)) {
            var message = Lang.format(TEST_ERROR_TEMPLATE, [name, expected, output]);
            logger.error(message);
            return false;
        }
    }
    
    return true;

}