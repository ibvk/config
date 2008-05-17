;; .emacs


(add-to-list 'load-path                 "~/config/emacs/lisp")
(add-to-list 'load-path                 "~/config/emacs/my-elisp")


;;
;; Customizations
;;
(setq debug-on-error                    t

      backup-by-copying                 t
      make-backup-files                 nil

      temp-buffer-resize-mode           t
      even-window-heights               nil
      mouse-avoidance-mode              t
      scroll-step                       1
      x-stretch-cursor                  t
      frame-title-format                (concat "%b - "
						(user-login-name)
						"@"
						(system-name))

      icomplete-mode                    t
      require-final-newline             nil

      password-cache-expiry             nil

      show-trailing-whitespace          t
)

(show-paren-mode 1)
(global-font-lock-mode 1)
(column-number-mode 1)
(transient-mark-mode 1)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(menu-bar-mode 0)
(which-function-mode 1)

(setq-default indent-tabs-mode nil)

(load "~/config/emacs/my-uniquify.el")
(load "~/config/emacs/my-iswitchb.el")
(load "~/config/emacs/my-keybindings.el")
(load "~/config/emacs/bvk.el")
(load "~/config/emacs/tramp.el")
(load "~/config/emacs/my-elisp/mail-config.el")

(cond ((eq window-system 'mac) (load "~/config/emacs/my-mac.el"))
      ((eq window-system 'x)   (load "~/config/emacs/my-x11.el"))
      ((eq window-system nil)  (load "~/config/emacs/my-term.el"))
      (t                       (message "unknown window-system type")))

;;
;; cscope for emacs
;;
(require 'xcscope)

;;
;; Adaptive fill mode
;;
(setq adaptive-fill-regexp "[ 	]*\\([-!|#%;>*·•‣⁃◦0123456789]+.?[ 	]*\\)*")

;;
;; Load column-marker package
;;
(require 'column-marker)

(defun my-c-mode-hook ()
  (c-set-style     "bsd")
  (column-marker-1 72)
  (column-marker-2 80)
  (local-set-key [return] 'newline-and-indent))


;;
;; Hooks
;;
(add-hook 'c-mode-hook     'my-c-mode-hook)
(add-hook 'c++-mode-hook   'my-c-mode-hook)
(add-hook 'mail-setup-hook 'mail-abbrevs-setup)

;;
;; Rectangle Region Marking
;;
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

;;
;; Org-mode
;;
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(global-font-lock-mode 1)
