import XMonad
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders

myDefaultGaps = [(15,0,0,0)]
myLayouts = noBorders Full

main = xmonad defaultConfig {
       	      layoutHook = myLayouts,
       	      modMask = mod4Mask,
	      defaultGaps = myDefaultGaps
       }
