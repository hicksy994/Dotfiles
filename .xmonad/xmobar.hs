Config { font = "xft:Droid Sans:size=11:antialias=true,FontAwesome:size=11"
         , borderColor = "#282828"
         , overrideRedirect = False
         , bgColor = "#282828"
         , fgColor = "#fdf4c1"
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
         , template = "%StdinReader% }{ <fc=#d3869b> %memory%</fc> | <fc=#fb4933> %cpu%</fc> | <fc=#fe8019> %coretemp%</fc> | <fc=#fabd2f> %vol%</fc> | <fc=#08CC38> %date%</fc> | <fc=#68CDFF> %time%</fc> "
         }
