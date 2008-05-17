import XMonad
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.Roledex

myLayouts = noBorders (tabbed shrinkText defaultTConf)

main = xmonad defaultConfig {
       	      layoutHook = myLayouts,
       	      modMask = mod4Mask
       }
