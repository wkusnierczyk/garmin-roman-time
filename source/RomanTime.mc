using Toybox.Application;

import Toybox.Lang;


module RomanTime {

    const ROMAN_NUMERALS = Application.loadResource(Rez.JsonData.RomanNumerals) as Dictionary;

    function toRoman(number as Number) as String {
        if (number == 0) { 
            return ROMAN_NUMERALS[0.toString()]; 
        }
        var decimals = [50, 40, 10, 9, 5, 4, 1];
        var result = "";
        for (var i = 0; i < decimals.size(); ++i) {
            if (number == 0) {
                break;
            }
            var decimal = decimals[i];
            while (number >= decimal) {
                number -= decimal;
                result += ROMAN_NUMERALS[decimal.toString()];
            }
        }
        return result;
        // var roman = ["L", "XL", "X", "IX", "V", "IV", "I"];
        // var result = "";
        // for (var i = 0; i < decimal.size(); ++i) {
        //     if (number == 0) {
        //         break;
        //     }
        //     while (number >= decimal[i]) {
        //         number -= decimal[i];
        //         result += roman[i];
        //     }
        // }
        // return result;
    }
    

}
