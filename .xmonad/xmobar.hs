Config { font = "xft:Droid Sans:size=11,FontAwesome:size=11"
         , borderColor = "#22262E"
         , overrideRedirect = False
         , bgColor = "#22262E"
         , fgColor = "#f3f4f5"
         , commands = [Run Memory ["-t","<usedratio>%"] 10
                      ,Run Cpu ["-t", "<total>%", "-L","3","-H","50"] 10
                      ,Run CoreTemp ["-t", "<core0>°"] 50
                      ,Run Com "zsh" [ "-c", "~/Scripts/date.sh"] "date" 10           
                      ,Run Com "zsh" [ "-c", "~/Scripts/time.sh"] "time" 10           
                      ,Run Com "zsh" [ "-c", "~/Scripts/volumexmonad.sh"] "vol" 10
                      ,Run StdinReader
                      ]
         , sepChar = "%"
         , alignSep = "}{"
         , template = "%StdinReader% }{ <fc=#f442e8> %memory%</fc> | <fc=#E03800> %cpu%</fc> | <fc=#D47B00> %coretemp%</fc> | <fc=#ffff66> %vol%</fc> | <fc=#08CC38> %date%</fc> | <fc=#68CDFF> %time%</fc> "
         }
