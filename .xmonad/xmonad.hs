{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myTerminal = "urxvt"

myScreensaver = "i3lock -u -i ~/wallpapers/godspeed.png"

myLauncher = "$(dmenu_path | yeganesh -x -- -fn 'Droid Sans-11' -nb '#22262E')"

myFocusedBorderColor = "#68a2ff"

myNormalBorderColor = "#22262E"

myBorderWidth = 2

xmobarTitleColor = "#68CDFF"

xmobarLayoutColor = "#08CC38"

xmobarCurrentWorkspaceColor = "#68CDFF"

xmobarUnfocusedWorkspaceColor = "#676E7D"

myWorkspaces = map show [1::Int ..9]

myManageHook = composeAll 
    [ className =? "Qemu-system-x86_64"   --> doFloat]
    
myKeys =
    [ ((mod4Mask .|. shiftMask, xK_x), spawn myScreensaver)
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

myLayoutHook = smartBorders $ avoidStruts $ tiled ||| full
  where tiled = named "Tiled" $ gaps [(U,7), (R,7), (D,7), (L,7)] $ spacing 7 $ Tall 1 (3/100) (1/2)
        full = gaps [(U,14), (R,14), (D,14), (L,14)] Full
  
defaults = def
    { modMask = mod4Mask
    , terminal = myTerminal
    , workspaces = myWorkspaces
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor = myNormalBorderColor
    , borderWidth = myBorderWidth
    , handleEventHook = fullscreenEventHook
    , manageHook = manageDocks <+> myManageHook
    , layoutHook = myLayoutHook
    , startupHook = setWMName "LG3D"
    }

main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad $ docks $ defaults
        { logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc . pad
            , ppTitle = xmobarColor xmobarTitleColor "" . shorten 75
            , ppLayout = xmobarColor xmobarLayoutColor ""
            , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
            , ppHidden = xmobarColor xmobarUnfocusedWorkspaceColor ""
            }
        }
        `additionalKeys`
        myKeys
