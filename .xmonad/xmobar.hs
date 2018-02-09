-- Config { font = "xft:Droid Sans:size=11:antialias=true,FontAwesome:size=11"
Config { font = "xft:Iosevka:size=12:bold:antialias=true,FontAwesome:size=12"
         -- , borderColor = "#282828"
         , overrideRedirect = False
         -- , bgColor = "#282828"
         -- , fgColor = "#fdf4c1"
         , borderColor = "#282c34"
         , bgColor = "#282c34"
         , fgColor = "#bbc2cf"
         , commands = [Run Memory ["-t","<usedratio>%"] 10
                      ,Run Cpu ["-t", "<total>%", "-L","3","-H","50"] 10
                      ,Run CoreTemp ["-t", "<core0>°C"] 50
                      ,Run Network "enp4s0" ["-t", "<fc=#c678dd></fc> <rx>KB/s | <fc=#dcaeea></fc> <tx>KB/s"] 20 
                      ,Run Com "zsh" [ "-c", "~/Scripts/date.sh"] "date" 10           
                      ,Run Com "zsh" [ "-c", "~/Scripts/time.sh"] "time" 10           
                      -- ,Run Com "zsh" [ "-c", "~/Scripts/volumexmonad.sh"] "vol" 10
                      ,Run StdinReader
                      ]
         , sepChar = "%"
         , alignSep = "}{"
         -- , template = "%StdinReader% }{ <fc=#d3869b> %memory%</fc> | <fc=#fb4933> %cpu%</fc> | <fc=#fe8019> %coretemp%</fc> | <fc=#fabd2f> %enp4s0%</fc> | <fc=#08CC38> %date%</fc> | <fc=#68CDFF> %time%</fc> "
         -- , template = "%StdinReader% }{ <fc=#d3869b></fc> %memory% | <fc=#fb4933></fc> %cpu% | <fc=#fe8019></fc> %coretemp% | <fc=#fabd2f></fc>%enp4s0% | <fc=#08CC38></fc> %date% | <fc=#68CDFF></fc> %time% "
         , template = "%StdinReader% }{ <fc=#98be65>Mem:</fc> %memory% | <fc=#51afef>CPU:</fc> %cpu% | <fc=#a9a1e1>CPU Temp:</fc> %coretemp% | %enp4s0% | <fc=#98be65>%date%</fc> | <fc=#51afef>%time%</fc> "
         }
