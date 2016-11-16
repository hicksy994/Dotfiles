Config { font = "xft:SFNS Display:size=11, FontAwesome:size=11"
        , borderColor = "#2f343f"
        , overrideRedirect = False
        , bgColor = "#2f343f"
        , fgColor = "#f3f4f5"
        , commands = [ Run Com "~/Scripts/date.sh" "myDate" 10,
                       Run Com "~/Scripts/time.sh" "myTime" 10,
                       Run Com "~/Scripts/memory2.sh" "myMemory" 10,
                       Run Com "~/Scripts/cpu_usage2.sh" "myCpu" 10,
                      Run Date "%a %_d %b %Y %H:%M:%S " "date" 10,
                      Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10,
                      Run Memory ["-t","Mem: <usedratio>%"] 10,
                      Run StdinReader
                     ]
        , sepChar = "%"
        , alignSep = "}{"
        , template = "<fc=#0080FF>λ</fc> %StdinReader% }{ <fc=#AEB404>  </fc><fc=#f3f4f5>%myCpu%</fc> | <fc=#B40404>   </fc><fc=#f3f4f5>%myMemory%</fc> | <fc=#2E9AFE>   </fc><fc=#f3f4f5>%myDate%</fc> | <fc=#268BD2>  </fc><fc=#f3f4f5>%myTime%</fc> "
        }
