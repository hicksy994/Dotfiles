{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

import System.IO
import XMonad
import qualified XMonad.StackSet as W
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Reflect
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Tabbed

myFocusedBorderColor = "#83a598"
myNonFocusedBorderColor = "#666666"
myUrgentBorderColor = "#dc322f"
myUrgentTextColor = "#b58900"
myXmobarTitleColor = "#fabd2f"
myXmobarLayoutColor = "#fe8019"
myTextColor = "#fdf4c1"
myNonFocusedTextColor = "#7c6f64"

myBorderWidth = 2
myTopBarHeight = 10

myModifier = mod4Mask

myFont = "xft:Droid Sans:size=11:antialias=true"

myTerminal = "urxvt"

myScreensaver = "i3lock -u -i ~/wallpapers/mist.png"

-- myLauncher = "$(dmenu_path | yeganesh -x -- -fn 'Droid Sans-11' -nb '#282828')"
myLauncher = "rofi -show run -theme gruvbox-dark -font 'Droid Sans 15' -lines  10 -no-show-match -width 40"

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
    
myTabTheme = def
    { fontName              = myFont
    , activeColor           = myFocusedBorderColor
    , inactiveColor         = myNonFocusedBorderColor
    , activeBorderColor     = myFocusedBorderColor
    , inactiveBorderColor   = myNonFocusedBorderColor
    , activeTextColor       = myTextColor 
    , inactiveTextColor     = myTextColor 
    }
    

addTopBar = noFrillsDeco shrinkText topBarTheme

myLayoutHook = smartBorders $ noBorders $ avoidStruts $ bsp ||| tall ||| tabs
  where bsp = named "BSP" $ reflectHoriz $ addTopBar $ gaps [(U,10), (R,10), (D,10), (L,10)] $ spacing 10 emptyBSP
        tall = named "Tall" $ addTopBar $ gaps [(U,10), (R,10), (D,10), (L,10)] $ spacing 10 $ Tall 1 (3/100) (1/2)
        tabs = named "Tabbed" $ reflectHoriz $ gaps [(U,20), (R,20), (D,20), (L,20)] $ tabbed shrinkText myTabTheme

scratchpads =
  [ NS "spotify" "LD_PRELOAD=/usr/lib/libcurl.so.3:/home/hicksy/builds/spotifywm/spotifywm.so /usr/bin/spotify" (className =? "Spotify") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
  ]
  
myManageHook = namedScratchpadManageHook scratchpads

myKeys =
    [ ((myModifier, xK_BackSpace), kill)
    , ((myModifier, xK_d), spawn myLauncher)
    , ((myModifier, xK_e), spawn "emacs")
    , ((myModifier, xK_c), spawn "chromium")
    , ((myModifier, xK_s), namedScratchpadAction scratchpads "spotify")
    , ((myModifier .|. shiftMask, xK_x), spawn myScreensaver)
    , ((myModifier .|. shiftMask, xK_n), spawn "~/Scripts/sp next")
    , ((myModifier .|. shiftMask, xK_p), spawn "~/Scripts/sp prev")
    , ((myModifier .|. shiftMask, xK_s), spawn "~/Scripts/sp play")
    , ((myModifier, xK_Up), spawn "pactl set-sink-volume 1 +1%")
    , ((myModifier, xK_Down), spawn "pactl set-sink-volume 1 -1%")
    ]

--Fix some applications not going fullscreen    
setFullscreenSupported = withDisplay $ \dpy -> do
  r <- asks theRoot
  a <- getAtom "_NET_SUPPORTED"
  c <- getAtom "ATOM"
  supp <- mapM getAtom ["_NET_WM_STATE_HIDDEN"
                       ,"_NET_WM_STATE_FULLSCREEN" -- XXX Copy-pasted to add this line
                       ,"_NET_NUMBER_OF_DESKTOPS"
                       ,"_NET_CLIENT_LIST"
                       ,"_NET_CLIENT_LIST_STACKING"
                       ,"_NET_CURRENT_DESKTOP"
                       ,"_NET_DESKTOP_NAMES"
                       ,"_NET_ACTIVE_WINDOW"
                       ,"_NET_WM_DESKTOP"
                       ,"_NET_WM_STRUT"
                       ]
  io $ changeProperty32 dpy r a c propModeReplace (fmap fromIntegral supp)

  setWMName "xmonad"


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
    , startupHook = startupHook def <+> setFullscreenSupported
    }

main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad $ docks $ defaults
        { logHook = fadeInactiveLogHook 0.9 >> dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc . pad
            , ppTitle = xmobarColor myXmobarTitleColor "" . shorten 75
            , ppLayout = xmobarColor myXmobarLayoutColor ""
            , ppCurrent = xmobarColor myTextColor ""
            , ppHidden = xmobarColor myNonFocusedTextColor ""
            }
        }
        `additionalKeys`
        myKeys
