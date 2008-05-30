import XMonad
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.Roledex

myLayouts = noBorders (tabbed shrinkText defaultTheme)

main = xmonad defaultConfig {
       	      layoutHook = myLayouts,
       	      modMask = mod4Mask
       }
