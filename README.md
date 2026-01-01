# Garmin Roman Time

A minimalist, elegant, geeky Garmin watch face that displays the current time as Roman numerals.

![Single line Roman numerals](resources/graphics/xxiv-xxxviii-single.png)
![Two line Roman numerals](resources/graphics/xxiv-xxxviii-double.png)

## Contents

* [Roman numerals](#roman-numerals)
* [Fonts](#fonts)
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

## Fonts

The Morse Time watch face uses custom fonts:

* [Asap Condensed](https://fonts.google.com/specimen/Asap+Condensed) for hours (bold) and minutes (light).

The font development process was as follows:

* The fonts were downloaded from [Google Fonts](https://fonts.google.com/) as True Type  (`.ttf`) fonts.
* The fonts were converted to bitmaps as `.fnt` and `.png` pairs using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.
* The font sizes were established to match the Garmin Fenix 7X Solar watch 280x280 pixel screen resolution.
* The fonts were then scaled proportionally to match other screen sizes available on Garmin watches with round screens using the included [utility script](utils/generate_fonts.py).

The table below lists all font sizes provided for the supported screen resolutions.

| Resolution |    Shape     |       Element       |        Font         | Size |
| ---------: | :----------- | :------------------ | :------------------ | ---: |
|  148 x 205 | rectangle    | Double line hour    | AsapCondensed bold  |   42 |
|  148 x 205 | rectangle    | Double line minutes | AsapCondensed light |   42 |
|  148 x 205 | rectangle    | Single line hour    | AsapCondensed bold  |   32 |
|  148 x 205 | rectangle    | Single line minutes | AsapCondensed light |   32 |
|  176 x 176 | semi-octagon | Double line hour    | AsapCondensed bold  |   50 |
|  176 x 176 | semi-octagon | Double line minutes | AsapCondensed light |   50 |
|  176 x 176 | semi-octagon | Single line hour    | AsapCondensed bold  |   38 |
|  176 x 176 | semi-octagon | Single line minutes | AsapCondensed light |   38 |
|  215 x 180 | semi-round   | Double line hour    | AsapCondensed bold  |   51 |
|  215 x 180 | semi-round   | Double line minutes | AsapCondensed light |   51 |
|  215 x 180 | semi-round   | Single line hour    | AsapCondensed bold  |   39 |
|  215 x 180 | semi-round   | Single line minutes | AsapCondensed light |   39 |
|  218 x 218 | round        | Double line hour    | AsapCondensed bold  |   62 |
|  218 x 218 | round        | Double line minutes | AsapCondensed light |   62 |
|  218 x 218 | round        | Single line hour    | AsapCondensed bold  |   47 |
|  218 x 218 | round        | Single line minutes | AsapCondensed light |   47 |
|  240 x 240 | round        | Double line hour    | AsapCondensed bold  |   69 |
|  240 x 240 | rectangle    | Double line hour    | AsapCondensed bold  |   69 |
|  240 x 240 | round        | Double line minutes | AsapCondensed light |   69 |
|  240 x 240 | rectangle    | Double line minutes | AsapCondensed light |   69 |
|  240 x 240 | round        | Single line hour    | AsapCondensed bold  |   51 |
|  240 x 240 | rectangle    | Single line hour    | AsapCondensed bold  |   51 |
|  240 x 240 | round        | Single line minutes | AsapCondensed light |   51 |
|  240 x 240 | rectangle    | Single line minutes | AsapCondensed light |   51 |
|  260 x 260 | round        | Double line hour    | AsapCondensed bold  |   74 |
|  260 x 260 | round        | Double line minutes | AsapCondensed light |   74 |
|  260 x 260 | round        | Single line hour    | AsapCondensed bold  |   56 |
|  260 x 260 | round        | Single line minutes | AsapCondensed light |   56 |
|  280 x 280 | round        | Double line hour    | AsapCondensed bold  |   80 |
|  280 x 280 | round        | Double line minutes | AsapCondensed light |   80 |
|  280 x 280 | round        | Single line hour    | AsapCondensed bold  |   60 |
|  280 x 280 | round        | Single line minutes | AsapCondensed light |   60 |
|  320 x 360 | rectangle    | Double line hour    | AsapCondensed bold  |   91 |
|  320 x 360 | rectangle    | Double line minutes | AsapCondensed light |   91 |
|  320 x 360 | rectangle    | Single line hour    | AsapCondensed bold  |   69 |
|  320 x 360 | rectangle    | Single line minutes | AsapCondensed light |   69 |
|  360 x 360 | round        | Double line hour    | AsapCondensed bold  |  103 |
|  360 x 360 | round        | Double line minutes | AsapCondensed light |  103 |
|  360 x 360 | round        | Single line hour    | AsapCondensed bold  |   77 |
|  360 x 360 | round        | Single line minutes | AsapCondensed light |   77 |
|  390 x 390 | round        | Double line hour    | AsapCondensed bold  |  111 |
|  390 x 390 | round        | Double line minutes | AsapCondensed light |  111 |
|  390 x 390 | round        | Single line hour    | AsapCondensed bold  |   84 |
|  390 x 390 | round        | Single line minutes | AsapCondensed light |   84 |
|  416 x 416 | round        | Double line hour    | AsapCondensed bold  |  119 |
|  416 x 416 | round        | Double line minutes | AsapCondensed light |  119 |
|  416 x 416 | round        | Single line hour    | AsapCondensed bold  |   89 |
|  416 x 416 | round        | Single line minutes | AsapCondensed light |   89 |
|  454 x 454 | round        | Double line hour    | AsapCondensed bold  |  130 |
|  454 x 454 | round        | Double line minutes | AsapCondensed light |  130 |
|  454 x 454 | round        | Single line hour    | AsapCondensed bold  |   97 |
|  454 x 454 | round        | Single line minutes | AsapCondensed light |   97 |



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
