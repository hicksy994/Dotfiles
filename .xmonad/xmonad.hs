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
myLauncher = "$(dmenu_path | yeganesh -x -- -fn 'SFNS Display-12' -nb '#2f343f')"

myFocusedBorderColor :: String
myFocusedBorderColor = "#68a2ff"

xmobarTitleColor :: String
xmobarTitleColor = "#68CDFF"

xmobarCurrentWorkspaceColor :: String
xmobarCurrentWorkspaceColor = "#f3f4f5"

xmobarUnfocusedWorkspaceColor :: String
xmobarUnfocusedWorkspaceColor = "#676E7D"

main :: IO()
main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig,
          handleEventHook = fullscreenEventHook,
          layoutHook = avoidStruts $ smartBorders $  layoutHook defaultConfig,
          logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc,
                          ppTitle = xmobarColor xmobarTitleColor "" . shorten 100,
                          ppCurrent = xmobarColor xmobarCurrentWorkspaceColor "",
                          ppHidden = xmobarColor xmobarUnfocusedWorkspaceColor ""
                        },
          modMask = mod4Mask,
          terminal = myTerminal,
          focusedBorderColor = myFocusedBorderColor
        }
        `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_x), spawn myScreensaver),
          ((mod4Mask, xK_d), spawn myLauncher),
          ((0, 0x1008FF13), spawn "pactl set-sink-volume 2 +1%"),
          ((0, 0x1008FF11), spawn "pactl set-sink-volume 2 -1%"),
          ((0, 0x1008FF12), spawn "pactl set-sink-mute 2 toggle"),
          ((0, 0x1008FF17), spawn "~/Scripts/sp next"),
          ((0, 0x1008FF16), spawn "~/Scripts/sp prev"),
          ((0, 0x1008FF14), spawn "~/Scripts/sp play")
        ]
