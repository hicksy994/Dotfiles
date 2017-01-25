Config { font = "xft:Droid Sans:size=12"
         , borderColor = "#2f343f"
         , overrideRedirect = False
         , bgColor = "#2f343f"
         , fgColor = "#f3f4f5"
         , commands = [Run Date "%a %_d %b %Y | %H:%M:%S " "date" 10,
                       Run Memory ["-t","Mem: <usedratio>%"] 10,
                       Run Cpu ["-L","3","-H","50"] 10,
                       Run StdinReader
                      ]
         , sepChar = "%"
         , alignSep = "}{"
         , template = "%StdinReader% }{ %memory% | %cpu% | %date%" 
         }
