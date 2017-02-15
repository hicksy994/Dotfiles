Config { font = "xft:Droid Sans:size=11,FontAwesome:size=11"
         , borderColor = "#2f343f"
         , overrideRedirect = False
         , bgColor = "#2f343f"
         , fgColor = "#f3f4f5"
         -- , commands = [Run Date "%a %_d %b %Y  %H:%M:%S " "date" 10,
                       -- Run Memory ["-t","Mem: <usedratio>%"] 10,
                       -- Run Cpu ["-L","3","-H","50"] 10,
         , commands = [Run Com "zsh" [ "-c", "~/Scripts/date.sh"] "date" 10,           
                       Run Com "zsh" [ "-c", "~/Scripts/time.sh"] "time" 10,           
                       Run Com "zsh" [ "-c", "~/Scripts/volumexmonad.sh"] "vol" 10,
                       Run StdinReader
                      ]
         , sepChar = "%"
         , alignSep = "}{"
         -- , template = "%StdinReader% }{ <fc=#ffff66>%memory%</fc> | <fc=#08CC38>%cpu%</fc> | <fc=#68CDFF>%date%</fc>" 
         , template = "%StdinReader% }{ <fc=#ffff66> %vol%</fc> | <fc=#08CC38> %date%</fc> | <fc=#68CDFF> %time%</fc> "
         }
