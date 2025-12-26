# Garmin Roman Time

A minimalist, elegant, geeky Garmin watch face that displays the current time as Roman numerals.

![Single line Roman numerals](resources/graphics/xxiv-xxxviii-single.png)
![Two line Roman numerals](resources/graphics/xxiv-xxxviii-double.png)

## Contents

* [Roman numerals](#roman-numerals)
* [Project structure](#project-structure)
* [Build, test, deploy](#build-test-deploy)

## Roman numerals

The Garmin Roman Time watch face shows hours and minutes as [Roman numerals](https://en.wikipedia.org/wiki/Roman_numerals), for the fun of it and for an educational value.

To display hours (0-23) and minutes (0-59), the following Roman digits are used:

| Value | Digit |
|------:|:------|
|     0 | N     |
|     1 | I     |
|     5 | V     |
|    10 | X     |
|    50 | L     |

Roman numerals are formed by adding the values of all digits forming a numeral, with the exception of numerals forming a _subtractive notation_:

| Value | Digits |
|------:|:-------|
|     4 | IV     |
|     9 | IX     |
|    40 | XL     |

Thus, 23:59 is `XXIII LIX`, and 9:44 is `IX XLIV`.

The watch face shows time as:
* either `hours minutes` in one line;
* or `hours` over `minutes`, in two lines.

**Note**  
* The mode can be selected in the app settings, at any time (pun intended), on the watch.
* Due to the size of Roman numerals, the font size in single line mode has tighter limits than in two-line mode. 
Otherwise, the time would at times (pun intended) extend past the boundaries of the watch face. 
In particular, `XXIV XXXVIII` is the longest pair of numeral to be displayed, and it dictates the limit on font size for the single-line mode.

The watch face uses custom fonts, as the built-in fonts do not provide large enough typeface for non-numeric data.
The font presented here is [Asap Condensed](https://fonts.google.com/specimen/Asap+Condensed), available from [Google Fonts](https://fonts.google.com/) as a True Type font (`ttf`).
It has been converted to a bitmap font (`bmp`, `fnt`) using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.

## Project structure

```bash
RomanTime
├── LICENCE                     # MIT licence
├── Makefile                    # Convenience makefile
├── manifest.xml                # Project manifest 
├── monkey.jungle               # Monkey C jungle file
├── README.md                   # This readme
├── resources
│   ├── drawables               # Application icon
│   │   ├── drawables.xml
│   │   └── launcher_icon.png
│   ├── fonts                   # Source TTF and bitmap-converted fonts
│   │   ├── *.fnt
│   │   ├── *.png
│   │   ├── *.ttf
│   │   └── OFL.txt             # Font licence
│   ├── graphics
│   │   └── *.png               # Example watch face screenshots
│   ├── layouts
│   │   └── layout.xml          # Layouts (not used in current version)
│   ├── settings                # Settings
│   │   ├── properties.xml
│   │   └── settings.xml
│   ├── strings                 # Strings (enable i18n)
│   │   ├── digits.xml
│   │   └── strings.xml
│   └── tests                   # Test case data
│       └── roman_time_tests.xml
└── source
    ├── PropertyUtils.mc        # Property utilities
    ├── RomanTime.mc            # Decimal-Roman conversion
    ├── RomanTimeApp.mc         # Application entry point
    ├── RomanTimeConstants.mc   # Constants sued in source code
    ├── RomanTimeSettings.mc    # Settings menu and delegate
    ├── RomanTimeTests.mc       # Unit tests for conversion code
    └── RomanTimeView.mc        # Drawing routines
```

## Build, test, deploy

To modify and build the sources, you need to have installed:

* [Visual Studio Code](https://code.visualstudio.com/) with [Monkey C extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/).
* [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Consult [Monkey C Visual Studio Code Extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/) for how to execute commands such as `build` and `test` to the Monkey C runtime.

You can use the included `Makefile` to conveniently trigger some of the actions from the command line.

```bash
# build binaries from sources
make build

# run unit tests
make test

# run the simulation
make run
```

To sideload your application to your Garmin watch, see [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/).
