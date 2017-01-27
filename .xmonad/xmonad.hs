import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myTerminal :: String
myTerminal = "urxvt"

myScreensaver :: String
myScreensaver = "i3lock -u -i ~/wallpapers/elcapitan.png"

myLauncher :: String
myLauncher = "rofi -show run"

myFocusedBorderColor :: String
myFocusedBorderColor = "#68a2ff"

myNormalBorderColor :: String
myNormalBorderColor = "#2f343f"

xmobarTitleColor :: String
xmobarTitleColor = "#68CDFF"

xmobarLayoutColor :: String
xmobarLayoutColor = "#08CC38"

xmobarCurrentWorkspaceColor :: String
xmobarCurrentWorkspaceColor = "#f3f4f5"

xmobarUnfocusedWorkspaceColor :: String
xmobarUnfocusedWorkspaceColor = "#676E7D"

myWorkspaces :: [String]
myWorkspaces =  map show [1::Int ..9]

myManageHook = composeAll 
    [className =? "Google-chrome"  --> doShift "1",
     className =? "Emacs"          --> doShift "2",
     className =? "Spotify"        --> doShift "4"
    ]

defaults = def
    { modMask = mod4Mask,
      terminal = myTerminal,
      workspaces = myWorkspaces,
      focusedBorderColor = myFocusedBorderColor,
      normalBorderColor = myNormalBorderColor,
      manageHook = manageDocks <+> myManageHook,
      handleEventHook = fullscreenEventHook,
      layoutHook = avoidStruts $ smartBorders $ layoutHook def
    }

myKeys =
    [ ((mod4Mask .|. shiftMask, xK_x), spawn myScreensaver),
      ((mod4Mask, xK_d), spawn myLauncher),
      ((0, 0x1008FF13), spawn "pactl set-sink-volume 2 +1%"),
      ((0, 0x1008FF11), spawn "pactl set-sink-volume 2 -1%"),
      ((0, 0x1008FF12), spawn "pactl set-sink-mute 2 toggle"),
      ((0, 0x1008FF17), spawn "~/Scripts/sp next"),
      ((0, 0x1008FF16), spawn "~/Scripts/sp prev"),
      ((0, 0x1008FF14), spawn "~/Scripts/sp play")
    ]

main :: IO()
main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"

    xmonad $ defaults
        { logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc . pad,
              ppTitle = xmobarColor xmobarTitleColor "" . shorten 75,
              ppLayout = xmobarColor xmobarLayoutColor "",
              ppCurrent = xmobarColor xmobarCurrentWorkspaceColor "",
              ppHidden = xmobarColor xmobarUnfocusedWorkspaceColor ""
            }
        }
        `additionalKeys`
        myKeys
