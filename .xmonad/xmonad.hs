{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

import System.IO
import XMonad
import qualified XMonad.StackSet as W
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Tabbed

myFocusedBorderColor = "#83a598"
myNonFocusedBorderColor = "#666666"
myUrgentBorderColor = "#dc322f"
myUrgentTextColor = "#b58900"
xmobarTitleColor = "#fabd2f"
xmobarLayoutColor = "#fe8019"
xmobarCurrentWorkspaceColor = "#fdf4c1"
xmobarUnfocusedWorkspaceColor = "#7c6f64"
                                
myBorderWidth = 2
myTopBarHeight = 10

myModifier = mod4Mask

myFont = "xft:Droid Sans:size=11"

myTerminal = "urxvt"

myScreensaver = "i3lock -u -i ~/wallpapers/mist.png"

myLauncher = "$(dmenu_path | yeganesh -x -- -fn 'Droid Sans-11' -nb '#22262E')"

myWorkspaces = map show [1::Int ..9]

-- I use a bar at the top of my windows to highlight focused/unfocused windows, rather than a traditional border
topBarTheme = def
    { fontName = myFont
    , inactiveBorderColor = myNonFocusedBorderColor
    , inactiveColor = myNonFocusedBorderColor
    , inactiveTextColor = myNonFocusedBorderColor
    , activeBorderColor = myFocusedBorderColor 
    , activeColor = myFocusedBorderColor 
    , activeTextColor = myFocusedBorderColor 
    , urgentBorderColor = myUrgentBorderColor
    , urgentTextColor = myUrgentTextColor
    , decoHeight = myTopBarHeight
    }

addTopBar = noFrillsDeco shrinkText topBarTheme

myLayoutHook = smartBorders $ noBorders $ avoidStruts $ bsp ||| tall ||| tabs ||| full
  where bsp = named "BSP" $ addTopBar $ gaps [(U,7), (R,7), (D,7), (L,7)] $ spacing 7 emptyBSP
        tall = named "Tall" $ addTopBar $ gaps [(U,7), (R,7), (D,7), (L,7)] $ spacing 7 $ Tall 1 (3/100) (1/2)
        tabs = named "Tabbed" $ addTopBar $ gaps [(U,14), (R,14), (D,14), (L,14)] simpleTabbed
        full = named "Full" $ addTopBar $ gaps [(U,14), (R,14), (D,14), (L,14)] Full

scratchpads =
  [ NS "spotify" "LD_PRELOAD=/usr/lib/libcurl.so.3:/home/hicksy/builds/spotifywm/spotifywm.so /usr/bin/spotify" (className =? "Spotify") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
  , NS "htop" "urxvt -e htop" (title =? "htop") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
  ]
  
myManageHook =  namedScratchpadManageHook scratchpads

myKeys =
    [ ((myModifier, xK_BackSpace), kill)
    , ((myModifier, xK_d), spawn myLauncher)
    , ((myModifier, xK_e), spawn "emacs")
    , ((myModifier, xK_c), spawn "google-chrome-stable")
    , ((myModifier, xK_s), namedScratchpadAction scratchpads "spotify")
    , ((myModifier, xK_h), namedScratchpadAction scratchpads "htop")
    , ((myModifier .|. shiftMask, xK_x), spawn myScreensaver)
    , ((myModifier .|. shiftMask, xK_n), spawn "~/Scripts/sp next")
    , ((myModifier .|. shiftMask, xK_p), spawn "~/Scripts/sp prev")
    , ((myModifier .|. shiftMask, xK_s), spawn "~/Scripts/sp play")
    , ((myModifier, 0x55F2), spawn "pactl set-sink-volume 1 +1%") -- Volume up FIXME
    , ((myModifier, 0x55F4), spawn "pactl set-sink-volume 1 -1%") -- Volume down FIXME
    ]
    
defaults = def
    { modMask = mod4Mask
    , terminal = myTerminal
    , workspaces = myWorkspaces
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor = myNonFocusedBorderColor
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
