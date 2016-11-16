Config { font = "xft:SFNS Display:size=11"
 +        , borderColor = "#2f343f"
 +        , overrideRedirect = False
 +        , bgColor = "#2f343f"
 +        , fgColor = "#f3f4f5"
 +        , commands = [Run Date "%a %_d %b %Y | %H:%M:%S " "date" 10,
 +                      Run StdinReader
 +                     ]
 +        , sepChar = "%"
 +        , alignSep = "}{"
 +        , template = "%StdinReader% }{%date%" 
 +        }
