import XMonad
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders

myLayouts = noBorders (tabbed shrinkText defaultTheme ||| Full)

main = xmonad defaultConfig {
       	      layoutHook = myLayouts,
       	      modMask = mod4Mask
       }
