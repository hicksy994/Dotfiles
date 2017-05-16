import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
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

myBorderWidth :: Dimension
myBorderWidth = 2

xmobarTitleColor :: String
xmobarTitleColor = "#68CDFF"

xmobarLayoutColor :: String
xmobarLayoutColor = "#08CC38"

xmobarCurrentWorkspaceColor :: String
xmobarCurrentWorkspaceColor = "#68CDFF"

xmobarUnfocusedWorkspaceColor :: String
xmobarUnfocusedWorkspaceColor = "#676E7D"

myWorkspaces :: [String]
myWorkspaces = map show [1::Int ..9]

myManageHook = composeAll 
    [ className =? "Google-chrome"        --> doShift "1"
    , className =? "Emacs"                --> doShift "2"
    , className =? "Spotify"              --> doShift "4"
    , className =? "Qemu-system-x86_64"   --> doFloat
    ]
    
myKeys =
    [ ((mod4Mask, xK_x), spawn myScreensaver)
    , ((mod4Mask, xK_d), spawn myLauncher)
    , ((mod4Mask, xK_e), spawn "emacs")
    , ((mod4Mask, xK_c), spawn "google-chrome-stable")
    , ((mod4Mask, xK_s), spawn "spotify")
    , ((0, 0x1008FF13), spawn "pactl set-sink-volume 1 +1%")
    , ((0, 0x1008FF11), spawn "pactl set-sink-volume 1 -1%")
    , ((0, 0x1008FF12), spawn "pactl set-sink-mute 1 toggle")
    , ((0, 0x1008FF17), spawn "~/Scripts/sp next")
    , ((0, 0x1008FF16), spawn "~/Scripts/sp prev")
    , ((0, 0x1008FF14), spawn "~/Scripts/sp play")
    ]

defaults = def
    { modMask = mod4Mask
    , terminal = myTerminal
    , workspaces = myWorkspaces
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor = myNormalBorderColor
    , borderWidth = myBorderWidth
    , manageHook = manageDocks <+> myManageHook
    , handleEventHook = fullscreenEventHook
    , layoutHook = smartBorders $ avoidStruts $ layoutHook def
    , startupHook = setWMName "LG3D"
    }

main :: IO()
main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad $ docks $ defaults
        { logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc . pad
            , ppTitle = xmobarColor xmobarTitleColor "" . shorten 30
            , ppLayout = xmobarColor xmobarLayoutColor ""
            , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
            , ppHidden = xmobarColor xmobarUnfocusedWorkspaceColor ""
            }
        }
        `additionalKeys`
        myKeys
